import 'package:xe_ghep_app/core/network/api_client.dart';
import 'package:xe_ghep_app/data/models/detailed_address.dart';
import 'package:xe_ghep_app/features/rides/domain/entities/ride.dart';
import 'package:xe_ghep_app/features/rides/domain/repositories/ride_repository.dart';

class RideRepositoryImpl implements RideRepository {
  final ApiClient? _apiClient;

  RideRepositoryImpl(this._apiClient);

  @override
  Future<List<Ride>> getMyRides() async {
    try {
      if (_apiClient != null) {
        final response = await _apiClient!.get('/rides/my-rides');
        final List<dynamic> ridesJson = response.data?['data'] ?? [];
        return ridesJson.map((json) => Ride.fromJson(json)).toList();
      }
    } catch (e) {
      // Fall through to mock data
    }
    // For demo purposes, return mock data
    return _getMockRides();
  }

  @override
  Future<List<Ride>> getRidesByStatus(String status) async {
    try {
      if (_apiClient != null) {
        final response = await _apiClient!.get('/rides/my-rides', queryParameters: {
          'status': status,
        });
        final List<dynamic> ridesJson = response.data?['data'] ?? [];
        return ridesJson.map((json) => Ride.fromJson(json)).toList();
      }
    } catch (e) {
      // Fall through to mock data
    }
    // For demo purposes, return mock data filtered by status
    return _getMockRides().where((ride) => ride.status == status).toList();
  }

  @override
  Future<Ride> getRideById(String rideId) async {
    try {
      if (_apiClient != null) {
        final response = await _apiClient!.get('/rides/$rideId');
        return Ride.fromJson(response.data?['data'] ?? {});
      }
    } catch (e) {
      // Fall through to mock data
    }
    // For demo purposes, return mock data
    return _getMockRides().firstWhere((ride) => ride.id == rideId);
  }

  @override
  Future<Ride> updateRideStatus(String rideId, String status, {String? reason}) async {
    try {
      if (_apiClient != null) {
        final response = await _apiClient!.put(
          '/rides/$rideId/status',
          data: {
            'status': status,
            if (reason != null) 'reason': reason,
          },
        );
        return Ride.fromJson(response.data?['data'] ?? {});
      }
    } catch (e) {
      // Fall through to mock data
    }
    // For demo purposes, return updated mock data
    final ride = _getMockRides().firstWhere((ride) => ride.id == rideId);
    return ride.copyWith(
      status: status,
      updatedAt: DateTime.now(),
      cancellationReason: reason,
    );
  }

  @override
  Future<Ride> startRide(String rideId) async {
    try {
      if (_apiClient != null) {
        final response = await _apiClient!.post('/rides/$rideId/start');
        return Ride.fromJson(response.data?['data'] ?? {});
      }
    } catch (e) {
      // Fall through to mock data
    }
    // For demo purposes, return updated mock data
    final ride = _getMockRides().firstWhere((ride) => ride.id == rideId);
    return ride.copyWith(
      status: 'in_progress',
      actualStartTime: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<Ride> completeRide(String rideId, {String? notes}) async {
    try {
      if (_apiClient != null) {
        final response = await _apiClient!.post(
          '/rides/$rideId/complete',
          data: {
            if (notes != null) 'notes': notes,
          },
        );
        return Ride.fromJson(response.data?['data'] ?? {});
      }
    } catch (e) {
      // Fall through to mock data
    }
    // For demo purposes, return updated mock data
    final ride = _getMockRides().firstWhere((ride) => ride.id == rideId);
    return ride.copyWith(
      status: 'completed',
      actualEndTime: DateTime.now(),
      updatedAt: DateTime.now(),
      notes: notes,
    );
  }

  @override
  Future<Ride> cancelRide(String rideId, String reason) async {
    try {
      if (_apiClient != null) {
        final response = await _apiClient!.post(
          '/rides/$rideId/cancel',
          data: {'reason': reason},
        );
        return Ride.fromJson(response.data?['data'] ?? {});
      }
    } catch (e) {
      // Fall through to mock data
    }
    // For demo purposes, return updated mock data
    final ride = _getMockRides().firstWhere((ride) => ride.id == rideId);
    return ride.copyWith(
      status: 'cancelled',
      cancellationReason: reason,
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<String> getCustomerContact(String rideId) async {
    try {
      if (_apiClient != null) {
        final response = await _apiClient!.get('/rides/$rideId/customer-contact');
        return response.data?['data']?['masked_phone'] ?? '';
      }
    } catch (e) {
      // Fall through to mock data
    }
    // For demo purposes, return mock data
    final ride = _getMockRides().firstWhere((ride) => ride.id == rideId);
    return ride.maskedCustomerPhone;
  }

  @override
  Future<Map<String, dynamic>> getRideStats() async {
    try {
      if (_apiClient != null) {
        final response = await _apiClient!.get('/rides/stats');
        return response.data?['data'] ?? {};
      }
    } catch (e) {
      // Fall through to mock data
    }
    // For demo purposes, return mock data
    return {
      'total_rides': 25,
      'completed_rides': 20,
      'cancelled_rides': 3,
      'in_progress_rides': 2,
      'total_earnings': 2500000,
      'average_rating': 4.8,
    };
  }

  // Mock data for demo
  List<Ride> _getMockRides() {
    final now = DateTime.now();
    return [
      Ride(
        id: 'ride1',
        postId: 'post1',
        driverId: 'current_driver',
        driverName: 'Nguyễn Văn A',
        customerId: 'customer1',
        customerName: 'Trần Thị B',
        customerPhone: '0901234567',
        fromLocation: DetailedAddress(
          street: '123 Phố Huế',
          ward: 'Phường Phố Huế',
          district: 'Quận Hai Bà Trưng',
          city: 'Hà Nội',
          latitude: 21.0285,
          longitude: 105.8542,
          landmark: 'Gần chợ Đồng Xuân',
        ),
        toLocation: DetailedAddress(
          street: '456 Lê Lợi',
          ward: 'Phường Máy Chai',
          district: 'Quận Ngô Quyền',
          city: 'Hải Phòng',
          latitude: 20.8449,
          longitude: 106.6881,
          landmark: 'Gần bến xe Hải Phòng',
        ),
        scheduledTime: now.add(const Duration(hours: 1)),
        seatsNeeded: 2,
        price: 120000,
        distance: 120.5,
        status: 'confirmed',
        createdAt: now.subtract(const Duration(hours: 2)),
        updatedAt: now.subtract(const Duration(minutes: 30)),
      ),
      Ride(
        id: 'ride2',
        postId: 'post2',
        driverId: 'current_driver',
        driverName: 'Nguyễn Văn A',
        customerId: 'customer2',
        customerName: 'Lê Văn C',
        customerPhone: '0907654321',
        fromLocation: DetailedAddress(
          street: '789 Nguyễn Huệ',
          ward: 'Phường Bến Nghé',
          district: 'Quận 1',
          city: 'TP.HCM',
          latitude: 10.7769,
          longitude: 106.7009,
          landmark: 'Gần Bitexco Financial Tower',
        ),
        toLocation: DetailedAddress(
          street: '321 Thùy Vân',
          ward: 'Phường Thắng Tam',
          district: 'Thành phố Vũng Tàu',
          city: 'Bà Rịa - Vũng Tàu',
          latitude: 10.3460,
          longitude: 107.0843,
          landmark: 'Gần bãi biển Thùy Vân',
        ),
        scheduledTime: now.subtract(const Duration(hours: 1)),
        actualStartTime: now.subtract(const Duration(minutes: 45)),
        seatsNeeded: 1,
        price: 80000,
        distance: 95.2,
        status: 'in_progress',
        createdAt: now.subtract(const Duration(hours: 3)),
        updatedAt: now.subtract(const Duration(minutes: 45)),
      ),
      Ride(
        id: 'ride3',
        postId: 'post3',
        driverId: 'current_driver',
        driverName: 'Nguyễn Văn A',
        customerId: 'customer3',
        customerName: 'Phạm Thị D',
        customerPhone: '0909876543',
        fromLocation: DetailedAddress(
          street: '555 Lê Duẩn',
          ward: 'Phường Thạch Thang',
          district: 'Quận Hải Châu',
          city: 'Đà Nẵng',
          latitude: 16.0544,
          longitude: 108.2022,
          landmark: 'Gần chợ Cồn',
        ),
        toLocation: DetailedAddress(
          street: '888 Lê Lợi',
          ward: 'Phường Phú Hội',
          district: 'Thành phố Huế',
          city: 'Thừa Thiên Huế',
          latitude: 16.4637,
          longitude: 107.5909,
          landmark: 'Gần Đại Nội Huế',
        ),
        scheduledTime: now.subtract(const Duration(days: 1)),
        actualStartTime: now.subtract(const Duration(days: 1, hours: -1)),
        actualEndTime: now.subtract(const Duration(days: 1, hours: -3)),
        seatsNeeded: 3,
        price: 150000,
        distance: 100.0,
        status: 'completed',
        createdAt: now.subtract(const Duration(days: 2)),
        updatedAt: now.subtract(const Duration(days: 1, hours: -3)),
        rating: 5.0,
        feedback: 'Tài xế rất thân thiện và chuyên nghiệp!',
      ),
      Ride(
        id: 'ride4',
        postId: 'post4',
        driverId: 'current_driver',
        driverName: 'Nguyễn Văn A',
        customerId: 'customer4',
        customerName: 'Hoàng Văn E',
        customerPhone: '0905555555',
        fromLocation: DetailedAddress(
          street: '111 Trần Hưng Đạo',
          ward: 'Phường Cầu Kho',
          district: 'Quận 1',
          city: 'TP.HCM',
          latitude: 10.7500,
          longitude: 106.6667,
          landmark: 'Gần chợ Bến Thành',
        ),
        toLocation: DetailedAddress(
          street: '222 Nguyễn Văn Cừ',
          ward: 'Phường An Khánh',
          district: 'Quận Ninh Kiều',
          city: 'Cần Thơ',
          latitude: 10.0452,
          longitude: 105.7469,
          landmark: 'Gần chợ Cần Thơ',
        ),
        scheduledTime: now.subtract(const Duration(days: 3)),
        seatsNeeded: 1,
        price: 110000,
        distance: 170.0,
        status: 'cancelled',
        createdAt: now.subtract(const Duration(days: 4)),
        updatedAt: now.subtract(const Duration(days: 3)),
        cancellationReason: 'Khách hàng hủy chuyến',
      ),
    ];
  }
}