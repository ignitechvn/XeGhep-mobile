import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xe_ghep_app/features/marketplace/domain/entities/customer_post.dart';
import 'package:xe_ghep_app/features/marketplace/presentation/providers/marketplace_provider.dart';

class CustomerPostDetailPage extends ConsumerStatefulWidget {
  final CustomerPost post;

  const CustomerPostDetailPage({
    super.key,
    required this.post,
  });

  @override
  ConsumerState<CustomerPostDetailPage> createState() => _CustomerPostDetailPageState();
}

class _CustomerPostDetailPageState extends ConsumerState<CustomerPostDetailPage> {
  bool _isClaiming = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết chuyến đi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _shareTrip(),
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () => _addToFavorites(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Trip status banner
            _buildStatusBanner(),
            
            // Route information
            _buildRouteSection(),
            
            // Trip details
            _buildTripDetailsSection(),
            
            // Driver information
            _buildDriverSection(),
            
            // Additional information
            _buildAdditionalInfoSection(),
            
            // Action buttons
            _buildActionButtons(),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBanner() {
    final status = widget.post.status;
    final isExpiringSoon = widget.post.expiresAt.difference(DateTime.now()).inMinutes < 30;
    
    Color backgroundColor;
    Color textColor;
    String statusText;
    IconData statusIcon;

    switch (status) {
      case 'available':
        backgroundColor = isExpiringSoon ? Colors.orange : Colors.green;
        textColor = Colors.white;
        statusText = isExpiringSoon ? 'Sắp hết hạn' : 'Có sẵn';
        statusIcon = isExpiringSoon ? Icons.warning : Icons.check_circle;
        break;
      case 'claimed':
        backgroundColor = Colors.blue;
        textColor = Colors.white;
        statusText = 'Đã được nhận';
        statusIcon = Icons.person_add;
        break;
      case 'completed':
        backgroundColor = Colors.grey;
        textColor = Colors.white;
        statusText = 'Đã hoàn thành';
        statusIcon = Icons.check_circle_outline;
        break;
      case 'cancelled':
        backgroundColor = Colors.red;
        textColor = Colors.white;
        statusText = 'Đã hủy';
        statusIcon = Icons.cancel;
        break;
      default:
        backgroundColor = Colors.grey;
        textColor = Colors.white;
        statusText = 'Không xác định';
        statusIcon = Icons.help;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(statusIcon, color: textColor, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  statusText,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (status == 'available') ...[
                  const SizedBox(height: 4),
                  Text(
                    'Hết hạn: ${_formatDateTime(widget.post.expiresAt)}',
                    style: TextStyle(
                      color: textColor.withOpacity(0.9),
                      fontSize: 14,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (status == 'available') ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: textColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                '${widget.post.interestedCount} người quan tâm',
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildRouteSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.route,
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Tuyến đường',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          
          // From location
          _buildLocationItem(
            'Điểm đón',
            widget.post.fromLocation,
            Icons.my_location,
            Colors.green,
          ),
          
          const SizedBox(height: 16),
          
          // Route line
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  height: 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.green.withOpacity(0.3),
                        Colors.red.withOpacity(0.3),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Khoảng cách: ${widget.post.distance.toStringAsFixed(1)} km',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      'Thời gian dự kiến: ${_estimateTravelTime()}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // To location
          _buildLocationItem(
            'Điểm đến',
            widget.post.toLocation,
            Icons.location_on,
            Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildLocationItem(String title, dynamic location, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
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
                  title,
                  style: TextStyle(
                    color: color,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                // Street address
                if (location.street.isNotEmpty) ...[
                  Text(
                    location.street,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
                // Ward and Village
                if (location.ward != null && location.ward!.isNotEmpty) ...[
                  Text(
                    location.ward!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 2),
                ],
                if (location.village != null && location.village!.isNotEmpty) ...[
                  Text(
                    location.village!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 2),
                ],
                // District and City
                Text(
                  '${location.district}, ${location.city}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                    fontSize: 13,
                  ),
                ),
                // Landmark
                if (location.landmark != null && location.landmark!.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 12,
                          color: color,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Gần ${location.landmark}',
                          style: TextStyle(
                            color: color,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.directions, color: color),
                onPressed: () => _openDirections(location),
                tooltip: 'Chỉ đường',
              ),
              IconButton(
                icon: Icon(Icons.copy, color: color.withOpacity(0.7)),
                onPressed: () => _copyAddress(location),
                tooltip: 'Sao chép địa chỉ',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTripDetailsSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Thông tin chuyến đi',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          
          _buildDetailRow(
            Icons.access_time,
            'Thời gian khởi hành',
            _formatTimeDisplay(),
          ),
          _buildDetailRow(
            Icons.person,
            'Số ghế cần',
            '${widget.post.seatsNeeded} ghế',
          ),
          _buildDetailRow(
            Icons.attach_money,
            'Giá tiền',
            '${_formatPrice(widget.post.price)} VNĐ',
          ),
          if (widget.post.vehicleType != null)
            _buildDetailRow(
              Icons.directions_car,
              'Loại xe',
              widget.post.vehicleType!,
            ),
          if (widget.post.licensePlate != null)
            _buildDetailRow(
              Icons.confirmation_number,
              'Biển số',
              widget.post.licensePlate!,
            ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDriverSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Thông tin tài xế',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                child: Text(
                  widget.post.driverName.substring(0, 1).toUpperCase(),
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.post.driverName,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.post.driverRating}',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Tài xế',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.message),
                onPressed: () => _contactDriver(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalInfoSection() {
    if (widget.post.description == null || widget.post.description!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.note,
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Ghi chú thêm',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            widget.post.description!,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    if (widget.post.status != 'available') {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _isClaiming ? null : _claimTrip,
              icon: _isClaiming
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : const Icon(Icons.person_add),
              label: Text(_isClaiming ? 'Đang xử lý...' : 'Nhận chuyến đi này'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _contactDriver(),
                  icon: const Icon(Icons.message),
                  label: const Text('Liên hệ'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _addToFavorites(),
                  icon: const Icon(Icons.favorite_border),
                  label: const Text('Yêu thích'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper methods
  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  String _formatTimeDisplay() {
    // Check if description contains flexible time information
    if (widget.post.description != null && widget.post.description!.contains('Thời gian linh hoạt:')) {
      final regex = RegExp(r'Thời gian linh hoạt: (\d{2}:\d{2}) - (\d{2}:\d{2})');
      final match = regex.firstMatch(widget.post.description!);
      if (match != null) {
        return '${match.group(1)} - ${match.group(2)} (Linh hoạt)';
      }
    }
    
    // Default to specific time
    final hour = widget.post.departureTime.hour.toString().padLeft(2, '0');
    final minute = widget.post.departureTime.minute.toString().padLeft(2, '0');
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

  String _estimateTravelTime() {
    // Simple estimation: 1 hour per 50km
    final hours = (widget.post.distance / 50).ceil();
    return '${hours}h';
  }

  // Action methods
  void _claimTrip() async {
    setState(() {
      _isClaiming = true;
    });

    try {
      await ref.read(claimCustomerProvider.notifier).claimCustomer(widget.post.id);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Đã nhận chuyến đi thành công!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isClaiming = false;
        });
      }
    }
  }

  void _contactDriver() {
    // TODO: Implement contact driver functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tính năng liên hệ tài xế đang được phát triển')),
    );
  }

  void _addToFavorites() {
    // TODO: Implement add to favorites functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã thêm vào danh sách yêu thích')),
    );
  }

  void _shareTrip() {
    // TODO: Implement share trip functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tính năng chia sẻ đang được phát triển')),
    );
  }

  void _openDirections(dynamic location) {
    // TODO: Implement open directions functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tính năng chỉ đường đang được phát triển')),
    );
  }

  void _copyAddress(dynamic location) {
    // TODO: Implement copy to clipboard functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã sao chép địa chỉ vào clipboard')),
    );
  }
}
