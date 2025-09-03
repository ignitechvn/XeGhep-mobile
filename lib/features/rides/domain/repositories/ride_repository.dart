import 'package:xe_ghep_app/features/rides/domain/entities/ride.dart';

abstract class RideRepository {
  // Get all rides for current driver
  Future<List<Ride>> getMyRides();
  
  // Get rides by status
  Future<List<Ride>> getRidesByStatus(String status);
  
  // Get single ride details
  Future<Ride> getRideById(String rideId);
  
  // Update ride status
  Future<Ride> updateRideStatus(String rideId, String status, {String? reason});
  
  // Start ride
  Future<Ride> startRide(String rideId);
  
  // Complete ride
  Future<Ride> completeRide(String rideId, {String? notes});
  
  // Cancel ride
  Future<Ride> cancelRide(String rideId, String reason);
  
  // Contact customer (returns masked phone for calling)
  Future<String> getCustomerContact(String rideId);
  
  // Get ride statistics
  Future<Map<String, dynamic>> getRideStats();
}
