import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xe_ghep_app/core/network/api_client.dart';
import 'package:xe_ghep_app/features/rides/data/repositories/ride_repository_impl.dart';
import 'package:xe_ghep_app/features/rides/domain/entities/ride.dart';
import 'package:xe_ghep_app/features/rides/domain/repositories/ride_repository.dart';

// Repository provider
final rideRepositoryProvider = Provider<RideRepository>((ref) {
  // For now, we'll create a mock repository without API client
  // TODO: Add proper API client integration
  return RideRepositoryImpl(null);
});

// My rides provider
final myRidesProvider = FutureProvider<List<Ride>>((ref) async {
  final repository = ref.watch(rideRepositoryProvider);
  return repository.getMyRides();
});

// Rides by status provider
final ridesByStatusProvider = FutureProvider.family<List<Ride>, String>((ref, status) async {
  final repository = ref.watch(rideRepositoryProvider);
  return repository.getRidesByStatus(status);
});

// Single ride provider
final rideProvider = FutureProvider.family<Ride, String>((ref, rideId) async {
  final repository = ref.watch(rideRepositoryProvider);
  return repository.getRideById(rideId);
});

// Ride stats provider
final rideStatsProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final repository = ref.watch(rideRepositoryProvider);
  return repository.getRideStats();
});

// Ride actions provider
final rideActionsProvider = StateNotifierProvider<RideActionsNotifier, AsyncValue<Ride?>>((ref) {
  final repository = ref.watch(rideRepositoryProvider);
  return RideActionsNotifier(repository);
});

// Customer contact provider
final customerContactProvider = FutureProvider.family<String, String>((ref, rideId) async {
  final repository = ref.watch(rideRepositoryProvider);
  return repository.getCustomerContact(rideId);
});

class RideActionsNotifier extends StateNotifier<AsyncValue<Ride?>> {
  final RideRepository _repository;

  RideActionsNotifier(this._repository) : super(const AsyncValue.data(null));

  Future<void> startRide(String rideId) async {
    state = const AsyncValue.loading();
    try {
      final result = await _repository.startRide(rideId);
      state = AsyncValue.data(result);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> completeRide(String rideId, {String? notes}) async {
    state = const AsyncValue.loading();
    try {
      final result = await _repository.completeRide(rideId, notes: notes);
      state = AsyncValue.data(result);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> cancelRide(String rideId, String reason) async {
    state = const AsyncValue.loading();
    try {
      final result = await _repository.cancelRide(rideId, reason);
      state = AsyncValue.data(result);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void reset() {
    state = const AsyncValue.data(null);
  }
}
