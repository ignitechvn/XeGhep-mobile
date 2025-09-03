import 'package:xe_ghep_app/features/marketplace/domain/entities/customer_post.dart';
import 'package:xe_ghep_app/features/marketplace/domain/entities/post_customer_request.dart';

abstract class MarketplaceRepository {
  // Get all available customer posts
  Future<List<CustomerPost>> getAvailablePosts({
    double? maxDistance,
    int? maxSeats,
    double? maxPrice,
    String? sortBy,
  });

  // Get my posted customers
  Future<List<CustomerPost>> getMyPosts();

  // Post a new customer
  Future<CustomerPost> postCustomer(PostCustomerRequest request);

  // Claim a customer post
  Future<bool> claimCustomer(String postId);

  // Get post details
  Future<CustomerPost> getPostDetails(String postId);

  // Update post status
  Future<bool> updatePostStatus(String postId, String status);

  // Get driver profile
  Future<Map<String, dynamic>> getDriverProfile(String driverId);
}
