import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/network/api_client.dart';
import '../../core/storage/local_storage.dart';
import '../../data/models/customer_model.dart';
import '../../app/constants/app_constants.dart';
import 'auth_repository.dart';

part 'marketplace_repository.g.dart';

@riverpod
MarketplaceRepository marketplaceRepository(MarketplaceRepositoryRef ref) {
  return MarketplaceRepository(
    apiClient: ref.watch(apiClientProvider),
    localStorage: LocalStorage.instance,
  );
}

class MarketplaceRepository {
  final ApiClient _apiClient;
  final LocalStorage _localStorage;

  MarketplaceRepository({
    required ApiClient apiClient,
    required LocalStorage localStorage,
  }) : _apiClient = apiClient,
       _localStorage = localStorage;

  // Get customers from marketplace
  Future<List<CustomerModel>> getCustomers({
    String? status,
    String? vehicleType,
    String? pickupLocation,
    String? dropoffLocation,
    DateTime? pickupTime,
    int? limit,
    int? offset,
  }) async {
    try {
      final queries = <String, dynamic>{};
      
      if (status != null) queries['status'] = status;
      if (vehicleType != null) queries['vehicle_type'] = vehicleType;
      if (pickupLocation != null) queries['pickup_location'] = pickupLocation;
      if (dropoffLocation != null) queries['dropoff_location'] = dropoffLocation;
      if (pickupTime != null) queries['pickup_time'] = pickupTime.toIso8601String();
      if (limit != null) queries['limit'] = limit;
      if (offset != null) queries['offset'] = offset;

      final customers = await _apiClient.getCustomers(queries);
      
      // Cache the results
      await _localStorage.saveCustomers(customers);
      
      return customers;
    } catch (e) {
      // Return cached data if API fails
      final cachedCustomers = _localStorage.getCustomers();
      if (cachedCustomers.isNotEmpty) {
        return cachedCustomers;
      }
      throw Exception('Không thể tải danh sách khách hàng: $e');
    }
  }

  // Post a new customer
  Future<CustomerModel> postCustomer(Map<String, dynamic> customerData) async {
    try {
      final postedCustomer = await _apiClient.postCustomer(customerData);
      
      // Refresh the marketplace list
      await getCustomers();
      
      return postedCustomer;
    } catch (e) {
      throw Exception('Không thể đăng khách hàng: $e');
    }
  }

  // Get customer details
  Future<CustomerModel> getCustomer(String customerId) async {
    try {
      return await _apiClient.getCustomer(customerId);
    } catch (e) {
      throw Exception('Không thể lấy thông tin khách hàng: $e');
    }
  }

  // Claim a customer
  Future<CustomerModel> claimCustomer(String customerId) async {
    try {
      final claimedCustomer = await _apiClient.claimCustomer(customerId);
      
      // Refresh the marketplace list
      await getCustomers();
      
      return claimedCustomer;
    } catch (e) {
      throw Exception('Không thể nhận khách hàng: $e');
    }
  }

  // Cancel a customer post
  Future<CustomerModel> cancelCustomer(String customerId, String reason) async {
    try {
      final cancelledCustomer = await _apiClient.cancelCustomer(customerId, {
        'reason': reason,
      });
      
      // Refresh the marketplace list
      await getCustomers();
      
      return cancelledCustomer;
    } catch (e) {
      throw Exception('Không thể hủy đăng khách hàng: $e');
    }
  }

  // Get cached customers
  List<CustomerModel> getCachedCustomers() {
    return _localStorage.getCustomers();
  }

  // Save favorite routes
  Future<void> saveFavoriteRoute(String route) async {
    final favoriteRoutes = _localStorage.getFavoriteRoutes();
    if (!favoriteRoutes.contains(route)) {
      favoriteRoutes.add(route);
      await _localStorage.saveFavoriteRoutes(favoriteRoutes);
    }
  }

  // Remove favorite route
  Future<void> removeFavoriteRoute(String route) async {
    final favoriteRoutes = _localStorage.getFavoriteRoutes();
    favoriteRoutes.remove(route);
    await _localStorage.saveFavoriteRoutes(favoriteRoutes);
  }

  // Get favorite routes
  List<String> getFavoriteRoutes() {
    return _localStorage.getFavoriteRoutes();
  }

  // Filter customers by criteria
  List<CustomerModel> filterCustomers({
    required List<CustomerModel> customers,
    String? status,
    String? vehicleType,
    String? pickupLocation,
    String? dropoffLocation,
    DateTime? minPickupTime,
    DateTime? maxPickupTime,
  }) {
    return customers.where((customer) {
      if (status != null && customer.status.name != status) return false;
      if (vehicleType != null) {
        // Filter by vehicle type based on seat count
        if (vehicleType == AppConstants.vehicleType4Seat && customer.seatCount > 3) return false;
        if (vehicleType == AppConstants.vehicleType7Seat && customer.seatCount > 6) return false;
      }
      if (pickupLocation != null && !customer.pickupLocation.toLowerCase().contains(pickupLocation.toLowerCase())) return false;
      if (dropoffLocation != null && !customer.dropoffLocation.toLowerCase().contains(dropoffLocation.toLowerCase())) return false;
      if (minPickupTime != null && customer.pickupTime.isBefore(minPickupTime)) return false;
      if (maxPickupTime != null && customer.pickupTime.isAfter(maxPickupTime)) return false;
      
      return true;
    }).toList();
  }

  // Search customers by location
  List<CustomerModel> searchCustomersByLocation({
    required List<CustomerModel> customers,
    required String query,
  }) {
    final lowerQuery = query.toLowerCase();
    return customers.where((customer) {
      return customer.pickupLocation.toLowerCase().contains(lowerQuery) ||
             customer.dropoffLocation.toLowerCase().contains(lowerQuery);
    }).toList();
  }
}
