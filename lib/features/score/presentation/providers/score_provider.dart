import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xe_ghep_app/features/score/domain/entities/score_history.dart';
import 'package:xe_ghep_app/features/score/domain/entities/score_stats.dart';

// Mock data providers for demo
final scoreStatsProvider = FutureProvider<ScoreStats>((ref) async {
  // Simulate API call delay
  await Future.delayed(const Duration(milliseconds: 500));
  
  return ScoreStats(
    currentScore: 15,
    totalPosts: 25,
    totalClaims: 10,
    totalCompletions: 8,
    totalPenalties: 2,
    successRate: 85.5,
    currentStreak: 5,
    bestStreak: 12,
    quotaUsed: 3,
    quotaLimit: 5,
    level: 'Silver',
    pointsToNextLevel: 35,
    lastActivity: DateTime(2024, 1, 15, 10, 30),
  );
});

final scoreHistoryProvider = FutureProvider<List<ScoreHistory>>((ref) async {
  // Simulate API call delay
  await Future.delayed(const Duration(milliseconds: 300));
  
  final now = DateTime.now();
  return [
    ScoreHistory(
      id: '1',
      type: 'post_customer',
      points: 1,
      description: 'Chia sẻ khách Hà Nội → Hải Phòng',
      createdAt: now.subtract(const Duration(hours: 2)),
      status: 'completed',
      relatedId: 'customer_1',
      relatedType: 'customer',
    ),
    ScoreHistory(
      id: '2',
      type: 'claim_customer',
      points: -1,
      description: 'Nhận khách TP.HCM → Vũng Tàu',
      createdAt: now.subtract(const Duration(hours: 4)),
      status: 'completed',
      relatedId: 'customer_2',
      relatedType: 'customer',
    ),
    ScoreHistory(
      id: '3',
      type: 'complete_ride',
      points: 50,
      description: 'Hoàn thành chuyến đi thành công',
      createdAt: now.subtract(const Duration(days: 1)),
      status: 'completed',
      relatedId: 'ride_1',
      relatedType: 'ride',
    ),
    ScoreHistory(
      id: '4',
      type: 'post_customer',
      points: 1,
      description: 'Chia sẻ khách Đà Nẵng → Huế',
      createdAt: now.subtract(const Duration(days: 1, hours: 3)),
      status: 'completed',
      relatedId: 'customer_3',
      relatedType: 'customer',
    ),
    ScoreHistory(
      id: '5',
      type: 'penalty',
      points: -10,
      description: 'Hủy chuyến không thông báo trước',
      createdAt: now.subtract(const Duration(days: 2)),
      status: 'completed',
      relatedId: 'ride_2',
      relatedType: 'ride',
    ),
    ScoreHistory(
      id: '6',
      type: 'post_customer',
      points: 1,
      description: 'Chia sẻ khách Hà Nội → Ninh Bình',
      createdAt: now.subtract(const Duration(days: 3)),
      status: 'completed',
      relatedId: 'customer_4',
      relatedType: 'customer',
    ),
    ScoreHistory(
      id: '7',
      type: 'claim_customer',
      points: -1,
      description: 'Nhận khách TP.HCM → Cần Thơ',
      createdAt: now.subtract(const Duration(days: 4)),
      status: 'completed',
      relatedId: 'customer_5',
      relatedType: 'customer',
    ),
    ScoreHistory(
      id: '8',
      type: 'complete_ride',
      points: 50,
      description: 'Hoàn thành chuyến đi thành công',
      createdAt: now.subtract(const Duration(days: 5)),
      status: 'completed',
      relatedId: 'ride_3',
      relatedType: 'ride',
    ),
  ];
});

// Filter provider for score history
final scoreHistoryFilterProvider = StateProvider<String>((ref) => 'all');

final filteredScoreHistoryProvider = Provider<AsyncValue<List<ScoreHistory>>>((ref) {
  final historyAsync = ref.watch(scoreHistoryProvider);
  final filter = ref.watch(scoreHistoryFilterProvider);
  
  return historyAsync.when(
    data: (history) {
      List<ScoreHistory> filtered = history;
      
      switch (filter) {
        case 'positive':
          filtered = history.where((h) => h.points > 0).toList();
          break;
        case 'negative':
          filtered = history.where((h) => h.points < 0).toList();
          break;
        case 'posts':
          filtered = history.where((h) => h.type == 'post_customer').toList();
          break;
        case 'claims':
          filtered = history.where((h) => h.type == 'claim_customer').toList();
          break;
        case 'completions':
          filtered = history.where((h) => h.type == 'complete_ride').toList();
          break;
        case 'penalties':
          filtered = history.where((h) => h.type == 'penalty').toList();
          break;
      }
      
      return AsyncValue.data(filtered);
    },
    loading: () => const AsyncValue.loading(),
    error: (error, stack) => AsyncValue.error(error, stack),
  );
});
