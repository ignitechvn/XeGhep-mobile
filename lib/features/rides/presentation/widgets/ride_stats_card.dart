import 'package:flutter/material.dart';

class RideStatsCard extends StatelessWidget {
  final Map<String, dynamic> stats;

  const RideStatsCard({
    super.key,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.analytics,
                color: Colors.white,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Thống kê chuyến đi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  'Tổng chuyến',
                  '${stats['total_rides'] ?? 0}',
                  Icons.directions_car,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  'Hoàn thành',
                  '${stats['completed_rides'] ?? 0}',
                  Icons.check_circle,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  'Đang thực hiện',
                  '${stats['in_progress_rides'] ?? 0}',
                  Icons.schedule,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  'Thu nhập',
                  '${_formatEarnings(stats['total_earnings'] ?? 0)}',
                  Icons.attach_money,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  'Đánh giá TB',
                  '${stats['average_rating']?.toStringAsFixed(1) ?? '0.0'}',
                  Icons.star,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  'Hủy chuyến',
                  '${stats['cancelled_rides'] ?? 0}',
                  Icons.cancel,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  String _formatEarnings(dynamic earnings) {
    if (earnings is num) {
      if (earnings >= 1000000) {
        return '${(earnings / 1000000).toStringAsFixed(1)}M';
      } else if (earnings >= 1000) {
        return '${(earnings / 1000).toStringAsFixed(0)}K';
      } else {
        return earnings.toStringAsFixed(0);
      }
    }
    return '0';
  }
}
