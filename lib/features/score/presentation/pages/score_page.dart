import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xe_ghep_app/features/score/presentation/providers/score_provider.dart';
import 'package:xe_ghep_app/features/score/presentation/widgets/score_header_card.dart';
import 'package:xe_ghep_app/features/score/presentation/widgets/score_stats_grid.dart';
import 'package:xe_ghep_app/features/score/presentation/widgets/score_history_list.dart';
import 'package:xe_ghep_app/features/score/presentation/widgets/score_rules_card.dart';

class ScorePage extends ConsumerStatefulWidget {
  const ScorePage({super.key});

  @override
  ConsumerState<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends ConsumerState<ScorePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Điểm số'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showScoreRules(context),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(scoreStatsProvider);
              ref.invalidate(scoreHistoryProvider);
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          dividerColor: Colors.transparent,
          tabs: const [
            Tab(text: 'Tổng quan'),
            Tab(text: 'Lịch sử'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOverviewTab(context),
          _buildHistoryTab(context),
        ],
      ),
    );
  }

  Widget _buildOverviewTab(BuildContext context) {
    final scoreStatsAsync = ref.watch(scoreStatsProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(scoreStatsProvider);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Score Header Card
            scoreStatsAsync.when(
              data: (stats) => ScoreHeaderCard(stats: stats),
              loading: () => const ScoreHeaderCardLoading(),
              error: (error, stack) => ScoreHeaderCardError(error: error),
            ),
            
            const SizedBox(height: 16),
            
            // Score Stats Grid
            scoreStatsAsync.when(
              data: (stats) => ScoreStatsGrid(stats: stats),
              loading: () => const ScoreStatsGridLoading(),
              error: (error, stack) => ScoreStatsGridError(error: error),
            ),
            
            const SizedBox(height: 16),
            
            // Score Rules Card
            ScoreRulesCard(),
            
            const SizedBox(height: 16),
            
            // Quota Information
            scoreStatsAsync.when(
              data: (stats) => _buildQuotaCard(context, stats),
              loading: () => const SizedBox.shrink(),
              error: (error, stack) => const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryTab(BuildContext context) {
    return Column(
      children: [
        // Filter chips
        _buildFilterChips(context),
        
        // History list
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(scoreHistoryProvider);
            },
            child: ScoreHistoryList(),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChips(BuildContext context) {
    final filter = ref.watch(scoreHistoryFilterProvider);
    
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildFilterChip(context, 'Tất cả', 'all', filter),
          const SizedBox(width: 8),
          _buildFilterChip(context, 'Tích cực', 'positive', filter),
          const SizedBox(width: 8),
          _buildFilterChip(context, 'Tiêu cực', 'negative', filter),
          const SizedBox(width: 8),
          _buildFilterChip(context, 'Chia sẻ', 'posts', filter),
          const SizedBox(width: 8),
          _buildFilterChip(context, 'Nhận khách', 'claims', filter),
          const SizedBox(width: 8),
          _buildFilterChip(context, 'Hoàn thành', 'completions', filter),
          const SizedBox(width: 8),
          _buildFilterChip(context, 'Phạt', 'penalties', filter),
        ],
      ),
    );
  }

  Widget _buildFilterChip(BuildContext context, String label, String value, String currentFilter) {
    final isSelected = currentFilter == value;
    return FilterChip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Theme.of(context).primaryColor,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          fontSize: 14,
        ),
      ),
      selected: isSelected,
      onSelected: (selected) {
        ref.read(scoreHistoryFilterProvider.notifier).state = value;
      },
      selectedColor: Theme.of(context).primaryColor,
      backgroundColor: Colors.white,
      checkmarkColor: Colors.white,
      side: BorderSide(
        color: Theme.of(context).primaryColor,
        width: 1.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: isSelected ? 2 : 0,
      pressElevation: 1,
    );
  }

  Widget _buildQuotaCard(BuildContext context, dynamic stats) {
    final quotaPercentage = (stats.quotaUsed / stats.quotaLimit) * 100;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.speed,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 8),
                Text(
                  'Quota hôm nay',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${stats.quotaUsed}/${stats.quotaLimit} chuyến',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: quotaPercentage >= 80 ? Colors.red : Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: quotaPercentage / 100,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          quotaPercentage >= 80 ? Colors.red : Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: quotaPercentage >= 80 
                        ? Colors.red.withOpacity(0.1)
                        : Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    quotaPercentage >= 80 ? Icons.warning : Icons.check_circle,
                    color: quotaPercentage >= 80 ? Colors.red : Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            if (quotaPercentage >= 80) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.warning, color: Colors.red, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Quota gần hết! Hãy cân nhắc kỹ trước khi nhận thêm khách.',
                        style: TextStyle(
                          color: Colors.red[700],
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showScoreRules(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const ScoreRulesBottomSheet(),
    );
  }
}

// Loading and Error widgets
class ScoreHeaderCardLoading extends StatelessWidget {
  const ScoreHeaderCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(16),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class ScoreHeaderCardError extends StatelessWidget {
  final Object error;
  
  const ScoreHeaderCardError({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 48),
              const SizedBox(height: 8),
              Text('Lỗi: ${error.toString()}'),
            ],
          ),
        ),
      ),
    );
  }
}

class ScoreStatsGridLoading extends StatelessWidget {
  const ScoreStatsGridLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: List.generate(4, (index) => 
        Card(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}

class ScoreStatsGridError extends StatelessWidget {
  final Object error;
  
  const ScoreStatsGridError({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 48),
              const SizedBox(height: 8),
              Text('Lỗi: ${error.toString()}'),
            ],
          ),
        ),
      ),
    );
  }
}

