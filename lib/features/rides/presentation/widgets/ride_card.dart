import 'package:flutter/material.dart';
import 'package:xe_ghep_app/features/rides/domain/entities/ride.dart';

class RideCard extends StatelessWidget {
  final Ride ride;
  final VoidCallback onStart;
  final VoidCallback onComplete;
  final VoidCallback onCancel;
  final VoidCallback onContact;
  final VoidCallback onViewDetails;

  const RideCard({
    super.key,
    required this.ride,
    required this.onStart,
    required this.onComplete,
    required this.onCancel,
    required this.onContact,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with status and time
            Row(
              children: [
                _buildStatusChip(context),
                const Spacer(),
                Text(
                  _formatTime(ride.scheduledTime),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            // Route info
            Row(
              children: [
                Icon(
                  Icons.route,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${ride.fromLocation.shortAddress} → ${ride.toLocation.shortAddress}',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      _buildLocationInfo(
                        'Điểm đón: ${ride.fromLocation.street}',
                        Icons.my_location,
                        Colors.green,
                      ),
                      const SizedBox(height: 2),
                      _buildLocationInfo(
                        'Điểm đến: ${ride.toLocation.street}',
                        Icons.location_on,
                        Colors.red,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            // Customer info
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                  child: Text(
                    ride.customerName.substring(0, 1).toUpperCase(),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ride.customerName,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        ride.maskedCustomerPhone,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.phone),
                  onPressed: onContact,
                  tooltip: 'Liên hệ khách hàng',
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            // Trip details
            Row(
              children: [
                _buildInfoChip(
                  context,
                  Icons.person,
                  '${ride.seatsNeeded} ghế',
                  Colors.blue,
                ),
                const SizedBox(width: 8),
                _buildInfoChip(
                  context,
                  Icons.attach_money,
                  '${_formatPrice(ride.price)}',
                  Colors.orange,
                ),
                const SizedBox(width: 8),
                _buildInfoChip(
                  context,
                  Icons.straighten,
                  '${ride.distance.toStringAsFixed(1)} km',
                  Colors.purple,
                ),
              ],
            ),
            
            if (ride.actualStartTime != null || ride.actualEndTime != null) ...[
              const SizedBox(height: 12),
              _buildTimeInfo(),
            ],
            
            if (ride.rating != null) ...[
              const SizedBox(height: 12),
              _buildRatingInfo(),
            ],
            
            const SizedBox(height: 16),
            
            // Action buttons
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    IconData icon;

    switch (ride.status) {
      case 'pending':
        backgroundColor = Colors.orange;
        textColor = Colors.white;
        icon = Icons.schedule;
        break;
      case 'confirmed':
        backgroundColor = Colors.blue;
        textColor = Colors.white;
        icon = Icons.check_circle_outline;
        break;
      case 'in_progress':
        backgroundColor = Colors.green;
        textColor = Colors.white;
        icon = Icons.directions_car;
        break;
      case 'completed':
        backgroundColor = Colors.grey;
        textColor = Colors.white;
        icon = Icons.check_circle;
        break;
      case 'cancelled':
        backgroundColor = Colors.red;
        textColor = Colors.white;
        icon = Icons.cancel;
        break;
      default:
        backgroundColor = Colors.grey;
        textColor = Colors.white;
        icon = Icons.help;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: textColor, size: 16),
          const SizedBox(width: 4),
          Text(
            ride.statusText,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationInfo(String text, IconData icon, Color color) {
    return Row(
      children: [
        Icon(icon, size: 12, color: color),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 11,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoChip(
    BuildContext context,
    IconData icon,
    String text,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeInfo() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.access_time, size: 16, color: Colors.blue),
          const SizedBox(width: 8),
          if (ride.actualStartTime != null) ...[
            Text(
              'Bắt đầu: ${_formatTime(ride.actualStartTime!)}',
              style: TextStyle(
                color: Colors.blue[700],
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
          if (ride.actualStartTime != null && ride.actualEndTime != null) ...[
            const SizedBox(width: 16),
          ],
          if (ride.actualEndTime != null) ...[
            Text(
              'Kết thúc: ${_formatTime(ride.actualEndTime!)}',
              style: TextStyle(
                color: Colors.blue[700],
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildRatingInfo() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.star, size: 16, color: Colors.amber),
          const SizedBox(width: 8),
          Text(
            'Đánh giá: ${ride.rating!.toStringAsFixed(1)}/5.0',
            style: TextStyle(
              color: Colors.amber[700],
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (ride.feedback != null) ...[
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                ride.feedback!,
                style: TextStyle(
                  color: Colors.amber[700],
                  fontSize: 11,
                  fontStyle: FontStyle.italic,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    if (ride.isCancelled || ride.isCompleted) {
      return Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: onViewDetails,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Xem chi tiết'),
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        if (ride.canStart) ...[
          Expanded(
            child: ElevatedButton.icon(
              onPressed: onStart,
              icon: const Icon(Icons.play_arrow),
              label: const Text('Bắt đầu'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
        if (ride.canComplete) ...[
          Expanded(
            child: ElevatedButton.icon(
              onPressed: onComplete,
              icon: const Icon(Icons.check),
              label: const Text('Hoàn thành'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
        if (ride.canCancel) ...[
          Expanded(
            child: OutlinedButton.icon(
              onPressed: onCancel,
              icon: const Icon(Icons.cancel),
              label: const Text('Hủy'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  String _formatTime(DateTime time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  String _formatPrice(double price) {
    if (price >= 1000000) {
      return '${(price / 1000000).toStringAsFixed(1)}M';
    } else if (price >= 1000) {
      return '${(price / 1000).toStringAsFixed(0)}K';
    } else {
      return price.toStringAsFixed(0);
    }
  }
}
