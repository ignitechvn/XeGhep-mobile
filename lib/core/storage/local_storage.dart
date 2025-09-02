import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/constants/app_constants.dart';
import '../../data/models/user_model.dart';
import '../../data/models/customer_model.dart';
import '../../data/models/notification_model.dart';

class LocalStorage {
  static LocalStorage? _instance;
  static LocalStorage get instance => _instance ??= LocalStorage._();
  
  LocalStorage._();

  late Box<String> _authBox;
  late Box<Map> _profileBox;
  late Box<Map> _marketplaceBox;
  late Box<Map> _ridesBox;
  late Box<Map> _notificationsBox;

  Future<void> init() async {
    _authBox = await Hive.openBox<String>(AppConstants.authBox);
    _profileBox = await Hive.openBox<Map>(AppConstants.profileBox);
    _marketplaceBox = await Hive.openBox<Map>(AppConstants.marketplaceBox);
    _ridesBox = await Hive.openBox<Map>(AppConstants.ridesBox);
    _notificationsBox = await Hive.openBox<Map>(AppConstants.notificationsBox);
  }

  // Auth Storage
  Future<void> saveAuthToken(String token) async {
    await _authBox.put(AppConstants.authTokenKey, token);
  }

  String? getAuthToken() {
    return _authBox.get(AppConstants.authTokenKey);
  }

  Future<void> saveRefreshToken(String token) async {
    await _authBox.put(AppConstants.refreshTokenKey, token);
  }

  String? getRefreshToken() {
    return _authBox.get(AppConstants.refreshTokenKey);
  }

  Future<void> clearAuth() async {
    await _authBox.clear();
  }

  // Profile Storage
  Future<void> saveUserProfile(UserModel user) async {
    await _profileBox.put(AppConstants.userProfileKey, user.toJson());
  }

  UserModel? getUserProfile() {
    final data = _profileBox.get(AppConstants.userProfileKey);
    if (data != null) {
      return UserModel.fromJson(Map<String, dynamic>.from(data));
    }
    return null;
  }

  Future<void> saveDriverStatus(String status) async {
    await _profileBox.put(AppConstants.driverStatusKey, {'status': status});
  }

  String? getDriverStatus() {
    final data = _profileBox.get(AppConstants.driverStatusKey);
    if (data != null) {
      return data['status'] as String?;
    }
    return null;
  }

  // Marketplace Storage
  Future<void> saveCustomers(List<CustomerModel> customers) async {
    final data = customers.map((c) => c.toJson()).toList();
    await _marketplaceBox.put('customers', {'list': data});
  }

  List<CustomerModel> getCustomers() {
    final data = _marketplaceBox.get('customers');
    if (data != null && data['list'] != null) {
      return (data['list'] as List)
          .map((item) => CustomerModel.fromJson(Map<String, dynamic>.from(item)))
          .toList();
    }
    return [];
  }

  Future<void> saveFavoriteRoutes(List<String> routes) async {
    await _marketplaceBox.put(AppConstants.favoriteRoutesKey, {'routes': routes});
  }

  List<String> getFavoriteRoutes() {
    final data = _marketplaceBox.get(AppConstants.favoriteRoutesKey);
    if (data != null && data['routes'] != null) {
      return List<String>.from(data['routes']);
    }
    return [];
  }

  // Notifications Storage
  Future<void> saveNotifications(List<NotificationModel> notifications) async {
    final data = notifications.map((n) => n.toJson()).toList();
    await _notificationsBox.put('notifications', {'list': data});
  }

  List<NotificationModel> getNotifications() {
    final data = _notificationsBox.get('notifications');
    if (data != null && data['list'] != null) {
      return (data['list'] as List)
          .map((item) => NotificationModel.fromJson(Map<String, dynamic>.from(item)))
          .toList();
    }
    return [];
  }

  // SharedPreferences for simple key-value storage
  Future<void> setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  Future<void> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> setInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  Future<int?> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // Cache management
  Future<void> clearCache() async {
    await _marketplaceBox.clear();
    await _ridesBox.clear();
    await _notificationsBox.clear();
  }

  Future<void> clearAll() async {
    await clearAuth();
    await _profileBox.clear();
    await clearCache();
    await clear();
  }
}
