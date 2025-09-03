import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xe_ghep_app/core/network/api_client.dart';
import 'package:xe_ghep_app/data/repositories/auth_repository.dart';
import 'package:xe_ghep_app/features/marketplace/data/repositories/marketplace_repository_impl.dart';
import 'package:xe_ghep_app/features/marketplace/domain/entities/customer_post.dart';
import 'package:xe_ghep_app/features/marketplace/domain/entities/post_customer_request.dart';
import 'package:xe_ghep_app/features/marketplace/domain/repositories/marketplace_repository.dart';

// Repository provider
final marketplaceRepositoryProvider = Provider<MarketplaceRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return MarketplaceRepositoryImpl(apiClient);
});

// Available posts provider
final availablePostsProvider = FutureProvider<List<CustomerPost>>((ref) async {
  final repository = ref.watch(marketplaceRepositoryProvider);
  return repository.getAvailablePosts();
});

// My posts provider
final myPostsProvider = FutureProvider<List<CustomerPost>>((ref) async {
  final repository = ref.watch(marketplaceRepositoryProvider);
  return repository.getMyPosts();
});

// Post customer provider
final postCustomerProvider = StateNotifierProvider<PostCustomerNotifier, AsyncValue<CustomerPost?>>((ref) {
  final repository = ref.watch(marketplaceRepositoryProvider);
  return PostCustomerNotifier(repository);
});

// Claim customer provider
final claimCustomerProvider = StateNotifierProvider<ClaimCustomerNotifier, AsyncValue<bool>>((ref) {
  final repository = ref.watch(marketplaceRepositoryProvider);
  return ClaimCustomerNotifier(repository);
});

// Filter state provider
final marketplaceFilterProvider = StateNotifierProvider<MarketplaceFilterNotifier, MarketplaceFilter>((ref) {
  return MarketplaceFilterNotifier();
});

class PostCustomerNotifier extends StateNotifier<AsyncValue<CustomerPost?>> {
  final MarketplaceRepository _repository;

  PostCustomerNotifier(this._repository) : super(const AsyncValue.data(null));

  Future<void> postCustomer(PostCustomerRequest request) async {
    state = const AsyncValue.loading();
    try {
      final result = await _repository.postCustomer(request);
      state = AsyncValue.data(result);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void reset() {
    state = const AsyncValue.data(null);
  }
}

class ClaimCustomerNotifier extends StateNotifier<AsyncValue<bool>> {
  final MarketplaceRepository _repository;

  ClaimCustomerNotifier(this._repository) : super(const AsyncValue.data(false));

  Future<void> claimCustomer(String postId) async {
    state = const AsyncValue.loading();
    try {
      final result = await _repository.claimCustomer(postId);
      state = AsyncValue.data(result);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void reset() {
    state = const AsyncValue.data(false);
  }
}

class MarketplaceFilter {
  final double? maxDistance;
  final int? maxSeats;
  final double? maxPrice;
  final String? sortBy;

  const MarketplaceFilter({
    this.maxDistance,
    this.maxSeats,
    this.maxPrice,
    this.sortBy,
  });

  MarketplaceFilter copyWith({
    double? maxDistance,
    int? maxSeats,
    double? maxPrice,
    String? sortBy,
  }) {
    return MarketplaceFilter(
      maxDistance: maxDistance ?? this.maxDistance,
      maxSeats: maxSeats ?? this.maxSeats,
      maxPrice: maxPrice ?? this.maxPrice,
      sortBy: sortBy ?? this.sortBy,
    );
  }
}

class MarketplaceFilterNotifier extends StateNotifier<MarketplaceFilter> {
  MarketplaceFilterNotifier() : super(const MarketplaceFilter());

  void updateFilter(MarketplaceFilter filter) {
    state = filter;
  }

  void clearFilter() {
    state = const MarketplaceFilter();
  }
}
