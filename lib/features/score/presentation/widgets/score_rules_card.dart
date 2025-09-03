import 'package:flutter/material.dart';

class ScoreRulesCard extends StatelessWidget {
  const ScoreRulesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.rule,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 8),
                Text(
                  'Quy tắc điểm số',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => _showDetailedRules(context),
                  child: const Text('Xem chi tiết'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildRuleItem(
              context,
              '+1 điểm',
              'Chia sẻ khách hàng',
              Icons.share,
              Colors.green,
            ),
            _buildRuleItem(
              context,
              '-1 điểm',
              'Nhận khách hàng',
              Icons.person_add,
              Colors.orange,
            ),
            _buildRuleItem(
              context,
              '+50 điểm',
              'Hoàn thành chuyến đi',
              Icons.check_circle,
              Colors.blue,
            ),
            _buildRuleItem(
              context,
              '-10 điểm',
              'Hủy chuyến không thông báo',
              Icons.cancel,
              Colors.red,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.amber.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info,
                    color: Colors.amber[700],
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Điểm tối thiểu để nhận khách: 0 điểm',
                      style: TextStyle(
                        color: Colors.amber[700],
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRuleItem(
    BuildContext context,
    String points,
    String description,
    IconData icon,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  points,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDetailedRules(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const ScoreRulesBottomSheet(),
    );
  }
}

// Score Rules Bottom Sheet
class ScoreRulesBottomSheet extends StatelessWidget {
  const ScoreRulesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Quy tắc điểm số chi tiết',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildRuleItem(context, '+1 điểm', 'Chia sẻ khách hàng', Icons.share, Colors.green),
          _buildRuleItem(context, '-1 điểm', 'Nhận khách hàng', Icons.person_add, Colors.orange),
          _buildRuleItem(context, '+50 điểm', 'Hoàn thành chuyến đi', Icons.check_circle, Colors.blue),
          _buildRuleItem(context, '-10 điểm', 'Hủy chuyến không thông báo', Icons.cancel, Colors.red),
          _buildRuleItem(context, '-5 điểm', 'Đánh giá thấp từ khách', Icons.star_border, Colors.amber),
          const SizedBox(height: 16),
          const Text(
            'Lưu ý quan trọng:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          const Text('• Điểm tối thiểu để nhận khách: 0 điểm'),
          const Text('• Điểm ≤ -3: Khóa tài khoản 7 ngày'),
          const Text('• Điểm ≥ 100: Nhận thưởng đặc biệt'),
          const Text('• Điểm ≥ 500: Trở thành tài xế VIP'),
          const SizedBox(height: 16),
          const Text(
            'Cách tính quota:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          const Text('• Quota cơ bản: 5 chuyến/ngày'),
          const Text('• Điểm cao hơn = quota nhiều hơn'),
          const Text('• VIP: quota không giới hạn'),
        ],
      ),
    );
  }

  Widget _buildRuleItem(BuildContext context, String points, String description, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  points,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
