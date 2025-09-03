import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xe_ghep_app/features/rides/presentation/providers/ride_provider.dart';
import 'package:xe_ghep_app/features/rides/presentation/widgets/ride_card.dart';
import 'package:xe_ghep_app/features/rides/presentation/widgets/ride_stats_card.dart';

class RidesPage extends ConsumerStatefulWidget {
  const RidesPage({super.key});

  @override
  ConsumerState<RidesPage> createState() => _RidesPageState();
}

class _RidesPageState extends ConsumerState<RidesPage> with TickerProviderStateMixin {
  late TabController _tabController;
  String _selectedStatus = 'all';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
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
        title: const Text('Chuyến đi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(myRidesProvider);
              ref.invalidate(rideStatsProvider);
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          onTap: (index) {
            setState(() {
              _selectedStatus = _getStatusFromIndex(index);
            });
          },
          tabs: const [
            Tab(text: 'Tất cả'),
            Tab(text: 'Chờ xác nhận'),
            Tab(text: 'Đã xác nhận'),
            Tab(text: 'Đang thực hiện'),
            Tab(text: 'Hoàn thành'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Stats card
          _buildStatsSection(),
          
          // Rides list
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildRidesList('all'),
                _buildRidesList('pending'),
                _buildRidesList('confirmed'),
                _buildRidesList('in_progress'),
                _buildRidesList('completed'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    final statsAsync = ref.watch(rideStatsProvider);
    
    return statsAsync.when(
      data: (stats) => RideStatsCard(stats: stats),
      loading: () => const SizedBox(
        height: 120,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => const SizedBox.shrink(),
    );
  }

  Widget _buildRidesList(String status) {
    final ridesAsync = status == 'all' 
        ? ref.watch(myRidesProvider)
        : ref.watch(ridesByStatusProvider(status));

    return ridesAsync.when(
      data: (rides) {
        if (rides.isEmpty) {
          return _buildEmptyState(status);
        }

        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(myRidesProvider);
            if (status != 'all') {
              ref.invalidate(ridesByStatusProvider(status));
            }
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: rides.length,
            itemBuilder: (context, index) {
              return RideCard(
                ride: rides[index],
                onStart: () => _handleStartRide(rides[index].id),
                onComplete: () => _handleCompleteRide(rides[index].id),
                onCancel: () => _handleCancelRide(rides[index].id),
                onContact: () => _handleContactCustomer(rides[index].id),
                onViewDetails: () => _handleViewDetails(rides[index]),
              );
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => _buildErrorState(error),
    );
  }

  Widget _buildEmptyState(String status) {
    String message;
    IconData icon;
    
    switch (status) {
      case 'pending':
        message = 'Chưa có chuyến đi nào chờ xác nhận';
        icon = Icons.schedule;
        break;
      case 'confirmed':
        message = 'Chưa có chuyến đi nào đã xác nhận';
        icon = Icons.check_circle_outline;
        break;
      case 'in_progress':
        message = 'Chưa có chuyến đi nào đang thực hiện';
        icon = Icons.directions_car;
        break;
      case 'completed':
        message = 'Chưa có chuyến đi nào đã hoàn thành';
        icon = Icons.check_circle;
        break;
      default:
        message = 'Chưa có chuyến đi nào';
        icon = Icons.directions_car_outlined;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Hãy nhận khách từ sàn giao dịch để bắt đầu',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Có lỗi xảy ra',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.red[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.red[500],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ref.invalidate(myRidesProvider);
              ref.invalidate(rideStatsProvider);
            },
            child: const Text('Thử lại'),
          ),
        ],
      ),
    );
  }

  String _getStatusFromIndex(int index) {
    switch (index) {
      case 0:
        return 'all';
      case 1:
        return 'pending';
      case 2:
        return 'confirmed';
      case 3:
        return 'in_progress';
      case 4:
        return 'completed';
      default:
        return 'all';
    }
  }

  // Action handlers
  void _handleStartRide(String rideId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Bắt đầu chuyến đi'),
        content: const Text('Bạn có chắc chắn muốn bắt đầu chuyến đi này?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await ref.read(rideActionsProvider.notifier).startRide(rideId);
              ref.invalidate(myRidesProvider);
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Đã bắt đầu chuyến đi!')),
                );
              }
            },
            child: const Text('Bắt đầu'),
          ),
        ],
      ),
    );
  }

  void _handleCompleteRide(String rideId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hoàn thành chuyến đi'),
        content: const Text('Bạn có chắc chắn đã hoàn thành chuyến đi này?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await ref.read(rideActionsProvider.notifier).completeRide(rideId);
              ref.invalidate(myRidesProvider);
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Đã hoàn thành chuyến đi!')),
                );
              }
            },
            child: const Text('Hoàn thành'),
          ),
        ],
      ),
    );
  }

  void _handleCancelRide(String rideId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hủy chuyến đi'),
        content: const Text('Bạn có chắc chắn muốn hủy chuyến đi này?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Không'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await ref.read(rideActionsProvider.notifier).cancelRide(rideId, 'Tài xế hủy chuyến');
              ref.invalidate(myRidesProvider);
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Đã hủy chuyến đi!')),
                );
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Hủy chuyến'),
          ),
        ],
      ),
    );
  }

  void _handleContactCustomer(String rideId) {
    // TODO: Implement contact customer functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tính năng liên hệ khách hàng đang được phát triển')),
    );
  }

  void _handleViewDetails(ride) {
    // TODO: Navigate to ride details page
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tính năng xem chi tiết chuyến đi đang được phát triển')),
    );
  }
}