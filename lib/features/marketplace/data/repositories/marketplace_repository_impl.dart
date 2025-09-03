import 'package:xe_ghep_app/core/network/api_client.dart';
import 'package:xe_ghep_app/data/models/detailed_address.dart';
import 'package:xe_ghep_app/features/marketplace/domain/entities/customer_post.dart';
import 'package:xe_ghep_app/features/marketplace/domain/entities/post_customer_request.dart';
import 'package:xe_ghep_app/features/marketplace/domain/repositories/marketplace_repository.dart';

class MarketplaceRepositoryImpl implements MarketplaceRepository {
  final ApiClient _apiClient;

  MarketplaceRepositoryImpl(this._apiClient);

  @override
  Future<List<CustomerPost>> getAvailablePosts({
    double? maxDistance,
    int? maxSeats,
    double? maxPrice,
    String? sortBy,
  }) async {
    try {
      final response = await _apiClient.get(
        '/marketplace/posts',
        queryParameters: {
          if (maxDistance != null) 'max_distance': maxDistance,
          if (maxSeats != null) 'max_seats': maxSeats,
          if (maxPrice != null) 'max_price': maxPrice,
          if (sortBy != null) 'sort_by': sortBy,
        },
      );

      final List<dynamic> postsJson = response.data?['data'] ?? [];
      return postsJson.map((json) => CustomerPost.fromJson(json)).toList();
    } catch (e) {
      // For demo purposes, return mock data
      return _getMockPosts();
    }
  }

  @override
  Future<List<CustomerPost>> getMyPosts() async {
    try {
      final response = await _apiClient.get('/marketplace/my-posts');
      final List<dynamic> postsJson = response.data?['data'] ?? [];
      return postsJson.map((json) => CustomerPost.fromJson(json)).toList();
    } catch (e) {
      // For demo purposes, return mock data
      return _getMockMyPosts();
    }
  }

  @override
  Future<CustomerPost> postCustomer(PostCustomerRequest request) async {
    try {
      final response = await _apiClient.post(
        '/marketplace/posts',
        data: request.toJson(),
      );
      return CustomerPost.fromJson(response.data?['data'] ?? {});
    } catch (e) {
      // For demo purposes, return mock data
      return _createMockPost(request);
    }
  }

  @override
  Future<bool> claimCustomer(String postId) async {
    try {
      await _apiClient.post('/marketplace/posts/$postId/claim');
      return true;
    } catch (e) {
      // For demo purposes, return success
      return true;
    }
  }

  @override
  Future<CustomerPost> getPostDetails(String postId) async {
    try {
      final response = await _apiClient.get('/marketplace/posts/$postId');
      return CustomerPost.fromJson(response.data?['data'] ?? {});
    } catch (e) {
      // For demo purposes, return mock data
      return _getMockPosts().first;
    }
  }

  @override
  Future<bool> updatePostStatus(String postId, String status) async {
    try {
      await _apiClient.put(
        '/marketplace/posts/$postId',
        data: {'status': status},
      );
      return true;
    } catch (e) {
      return true;
    }
  }

  @override
  Future<Map<String, dynamic>> getDriverProfile(String driverId) async {
    try {
      final response = await _apiClient.get('/drivers/$driverId');
      return response.data?['data'] ?? {};
    } catch (e) {
      return {
        'name': 'Nguyễn Văn A',
        'rating': 4.8,
        'total_trips': 150,
        'success_rate': 95.5,
      };
    }
  }

  // Mock data for demo
  List<CustomerPost> _getMockPosts() {
    final now = DateTime.now();
    return [
      CustomerPost(
        id: '1',
        driverId: 'driver1',
        driverName: 'Nguyễn Văn A',
        driverRating: 4.8,
        fromLocation: const DetailedAddress(
          street: '123 Phố Huế',
          ward: 'Phường Phố Huế',
          district: 'Quận Hai Bà Trưng',
          city: 'Hà Nội',
          latitude: 21.0285,
          longitude: 105.8542,
          landmark: 'Gần chợ Đồng Xuân',
        ),
        toLocation: const DetailedAddress(
          street: '456 Lê Lợi',
          ward: 'Phường Máy Chai',
          district: 'Quận Ngô Quyền',
          city: 'Hải Phòng',
          latitude: 20.8449,
          longitude: 106.6881,
          landmark: 'Gần bến xe Hải Phòng',
        ),
        departureTime: now.add(const Duration(hours: 2)),
        seatsNeeded: 2,
        price: 120000,
        distance: 120.5,
        status: 'available',
        createdAt: now.subtract(const Duration(minutes: 30)),
        expiresAt: now.add(const Duration(hours: 1, minutes: 30)),
        interestedCount: 3,
        description: 'Khách hàng có 2 vali lớn, cần xe rộng. Có thể đón thêm khách trên đường.',
        vehicleType: 'Xe 7 chỗ',
        licensePlate: '29A-12345',
      ),
      CustomerPost(
        id: '2',
        driverId: 'driver2',
        driverName: 'Trần Thị B',
        driverRating: 4.5,
        fromLocation: const DetailedAddress(
          street: '789 Nguyễn Huệ',
          ward: 'Phường Bến Nghé',
          district: 'Quận 1',
          city: 'TP.HCM',
          latitude: 10.7769,
          longitude: 106.7009,
          landmark: 'Gần Bitexco Financial Tower',
        ),
        toLocation: const DetailedAddress(
          street: '321 Thùy Vân',
          ward: 'Phường Thắng Tam',
          district: 'Thành phố Vũng Tàu',
          city: 'Bà Rịa - Vũng Tàu',
          latitude: 10.3460,
          longitude: 107.0843,
          landmark: 'Gần bãi biển Thùy Vân',
        ),
        departureTime: now.add(const Duration(hours: 3)),
        seatsNeeded: 1,
        price: 80000,
        distance: 95.2,
        status: 'available',
        createdAt: now.subtract(const Duration(minutes: 15)),
        expiresAt: now.add(const Duration(hours: 2, minutes: 45)),
        interestedCount: 1,
        description: 'Khách hàng muốn đi sớm 15 phút. Không hút thuốc, ưu tiên xe sạch sẽ.',
        vehicleType: 'Xe 4 chỗ',
        licensePlate: '51G-67890',
      ),
      CustomerPost(
        id: '3',
        driverId: 'driver3',
        driverName: 'Lê Văn C',
        driverRating: 4.9,
        fromLocation: const DetailedAddress(
          street: '555 Lê Duẩn',
          ward: 'Phường Thạch Thang',
          district: 'Quận Hải Châu',
          city: 'Đà Nẵng',
          latitude: 16.0544,
          longitude: 108.2022,
          landmark: 'Gần chợ Cồn',
        ),
        toLocation: const DetailedAddress(
          street: '888 Lê Lợi',
          ward: 'Phường Phú Hội',
          district: 'Thành phố Huế',
          city: 'Thừa Thiên Huế',
          latitude: 16.4637,
          longitude: 107.5909,
          landmark: 'Gần Đại Nội Huế',
        ),
        departureTime: now.add(const Duration(hours: 1)),
        seatsNeeded: 3,
        price: 150000,
        distance: 100.0,
        status: 'available',
        createdAt: now.subtract(const Duration(minutes: 45)),
        expiresAt: now.add(const Duration(minutes: 15)),
        interestedCount: 5,
        description: 'Cần đi qua chợ để mua đồ. Khách hàng có 1 trẻ em, cần ghế an toàn.',
        vehicleType: 'Xe 7 chỗ',
        licensePlate: '43D-11111',
      ),
    ];
  }

  List<CustomerPost> _getMockMyPosts() {
    final now = DateTime.now();
    return [
      CustomerPost(
        id: 'my1',
        driverId: 'current_driver',
        driverName: 'Nguyễn Văn A',
        driverRating: 4.8,
        fromLocation: const DetailedAddress(
          street: '123 Phố Huế',
          ward: 'Phường Phố Huế',
          district: 'Quận Hai Bà Trưng',
          city: 'Hà Nội',
          latitude: 21.0285,
          longitude: 105.8542,
          landmark: 'Gần chợ Đồng Xuân',
        ),
        toLocation: const DetailedAddress(
          street: '456 Tràng An',
          ward: 'Phường Tràng An',
          district: 'Thành phố Ninh Bình',
          city: 'Ninh Bình',
          latitude: 20.2506,
          longitude: 105.9744,
          landmark: 'Gần chùa Bái Đính',
        ),
        departureTime: now.add(const Duration(hours: 4)),
        seatsNeeded: 2,
        price: 90000,
        distance: 90.0,
        status: 'available',
        createdAt: now.subtract(const Duration(minutes: 20)),
        expiresAt: now.add(const Duration(hours: 3, minutes: 40)),
        interestedCount: 2,
        description: 'Chuyến đi cuối tuần, khách hàng muốn tham quan thêm. Có thể dừng chân chụp ảnh.',
        vehicleType: 'Xe 7 chỗ',
        licensePlate: '29A-12345',
      ),
      CustomerPost(
        id: 'my2',
        driverId: 'current_driver',
        driverName: 'Nguyễn Văn A',
        driverRating: 4.8,
        fromLocation: const DetailedAddress(
          street: '789 Nguyễn Huệ',
          ward: 'Phường Bến Nghé',
          district: 'Quận 1',
          city: 'TP.HCM',
          latitude: 10.7769,
          longitude: 106.7009,
          landmark: 'Gần Bitexco Financial Tower',
        ),
        toLocation: const DetailedAddress(
          street: '321 Nguyễn Văn Cừ',
          ward: 'Phường An Khánh',
          district: 'Quận Ninh Kiều',
          city: 'Cần Thơ',
          latitude: 10.0452,
          longitude: 105.7469,
          landmark: 'Gần chợ Cần Thơ',
        ),
        departureTime: now.subtract(const Duration(hours: 2)),
        seatsNeeded: 1,
        price: 110000,
        distance: 170.0,
        status: 'claimed',
        createdAt: now.subtract(const Duration(hours: 3)),
        expiresAt: now.subtract(const Duration(minutes: 30)),
        interestedCount: 4,
        description: 'Chuyến đi công tác, khách hàng cần đến đúng giờ. Ưu tiên tài xế có kinh nghiệm.',
        vehicleType: 'Xe 4 chỗ',
        licensePlate: '29A-12345',
      ),
    ];
  }

  CustomerPost _createMockPost(PostCustomerRequest request) {
    final now = DateTime.now();
    return CustomerPost(
      id: 'new_${now.millisecondsSinceEpoch}',
      driverId: 'current_driver',
      driverName: 'Nguyễn Văn A',
      driverRating: 4.8,
      fromLocation: request.fromLocation,
      toLocation: request.toLocation,
      departureTime: request.departureTime,
      seatsNeeded: request.seatsNeeded,
      price: request.price,
      distance: request.distance,
      status: 'available',
      createdAt: now,
      expiresAt: now.add(const Duration(hours: 2)),
      interestedCount: 0,
      description: request.description,
      vehicleType: request.vehicleType,
      licensePlate: request.licensePlate,
    );
  }
}
