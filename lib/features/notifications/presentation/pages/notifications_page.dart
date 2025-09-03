import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationsPage extends ConsumerStatefulWidget {
  const NotificationsPage({super.key});

  @override
  ConsumerState<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends ConsumerState<NotificationsPage> {
  String _selectedFilter = 'Tất cả';
  final List<String> _filters = ['Tất cả', 'Hệ thống', 'Giao dịch', 'Cập nhật'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông báo'),
        actions: [
          // Filter button với icon
          IconButton(
            icon: const Icon(
              Icons.filter_list,
              color: Colors.white,
            ),
            onPressed: _showFilterDialog,
            tooltip: 'Lọc thông báo',
          ),
          IconButton(
            icon: const Icon(Icons.done_all),
            onPressed: _markAllAsRead,
            tooltip: 'Đánh dấu tất cả đã đọc',
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm thông báo...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
          
          // Notifications List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _getFilteredNotifications().length,
              itemBuilder: (context, index) {
                final notification = _getFilteredNotifications()[index];
                return _buildNotificationItem(context, notification);
              },
            ),
          ),
        ],
      ),
    );
  }

  List<NotificationItem> _getFilteredNotifications() {
    final allNotifications = _getAllNotifications();
    if (_selectedFilter == 'Tất cả') {
      return allNotifications;
    }
    return allNotifications.where((notification) => 
      notification.type == _selectedFilter
    ).toList();
  }

  List<NotificationItem> _getAllNotifications() {
    return [
      NotificationItem(
        id: '1',
        title: 'Chuyến đi hoàn thành',
        message: 'Bạn đã hoàn thành chuyến đi từ Quận 1 đến Quận 7. Điểm số: +1',
        type: 'Giao dịch',
        time: DateTime.now().subtract(const Duration(minutes: 5)),
        isRead: false,
        icon: Icons.check_circle,
        iconColor: Colors.green,
      ),
      NotificationItem(
        id: '2',
        title: 'Cập nhật ứng dụng',
        message: 'Phiên bản 1.2.0 đã có sẵn với nhiều tính năng mới. Hãy cập nhật ngay!',
        type: 'Cập nhật',
        time: DateTime.now().subtract(const Duration(hours: 2)),
        isRead: false,
        icon: Icons.system_update,
        iconColor: Colors.blue,
      ),
      NotificationItem(
        id: '3',
        title: 'Khách hàng mới',
        message: 'Có khách hàng mới từ Quận 3 đến Quận 10. Hãy nhanh tay nhận!',
        type: 'Hệ thống',
        time: DateTime.now().subtract(const Duration(hours: 3)),
        isRead: true,
        icon: Icons.person_add,
        iconColor: Colors.orange,
      ),
      NotificationItem(
        id: '4',
        title: 'Thanh toán thành công',
        message: 'Bạn đã nhận được 150,000 VNĐ từ chuyến đi #1234',
        type: 'Giao dịch',
        time: DateTime.now().subtract(const Duration(hours: 5)),
        isRead: true,
        icon: Icons.payment,
        iconColor: Colors.green,
      ),
      NotificationItem(
        id: '5',
        title: 'Bảo trì hệ thống',
        message: 'Hệ thống sẽ bảo trì từ 02:00 - 04:00 ngày mai. Vui lòng lưu ý.',
        type: 'Hệ thống',
        time: DateTime.now().subtract(const Duration(days: 1)),
        isRead: true,
        icon: Icons.build,
        iconColor: Colors.amber,
      ),
      NotificationItem(
        id: '6',
        title: 'Điểm số cập nhật',
        message: 'Điểm số của bạn đã tăng lên 16 điểm. Chúc mừng!',
        type: 'Hệ thống',
        time: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
        isRead: true,
        icon: Icons.star,
        iconColor: Colors.purple,
      ),
      NotificationItem(
        id: '7',
        title: 'Khuyến mãi đặc biệt',
        message: 'Nhận thêm 50% điểm số cho mọi chuyến đi trong tuần này!',
        type: 'Cập nhật',
        time: DateTime.now().subtract(const Duration(days: 2)),
        isRead: true,
        icon: Icons.local_offer,
        iconColor: Colors.red,
      ),
      NotificationItem(
        id: '8',
        title: 'Chuyến đi bị hủy',
        message: 'Chuyến đi #1235 đã bị khách hàng hủy. Điểm số: -1',
        type: 'Giao dịch',
        time: DateTime.now().subtract(const Duration(days: 2, hours: 3)),
        isRead: true,
        icon: Icons.cancel,
        iconColor: Colors.red,
      ),
    ];
  }

  Widget _buildNotificationItem(BuildContext context, NotificationItem notification) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: notification.isRead ? Colors.white : Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: notification.isRead ? Colors.grey[200]! : Colors.blue[200]!,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Dismissible(
        key: Key(notification.id),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 24,
          ),
        ),
        confirmDismiss: (direction) async {
          return await showDialog<bool>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Xác nhận xóa'),
                content: const Text('Bạn có chắc chắn muốn xóa thông báo này?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('Hủy'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                    ),
                    child: const Text('Xóa'),
                  ),
                ],
              );
            },
          );
        },
        onDismissed: (direction) {
          _deleteNotification(notification.id);
        },
        child: InkWell(
          onTap: () => _markAsRead(notification.id),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        notification.title,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: notification.isRead ? FontWeight.w500 : FontWeight.w600,
                          color: notification.isRead ? Colors.grey[700] : Colors.black,
                        ),
                      ),
                    ),
                    if (!notification.isRead)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  notification.message,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: _getTypeColor(notification.type).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        notification.type,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: _getTypeColor(notification.type),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _formatTime(notification.time),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'Hệ thống':
        return Colors.blue;
      case 'Giao dịch':
        return Colors.green;
      case 'Cập nhật':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inMinutes < 1) {
      return 'Vừa xong';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} phút trước';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} giờ trước';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} ngày trước';
    } else {
      return '${time.day}/${time.month}/${time.year}';
    }
  }

  void _markAsRead(String notificationId) {
    setState(() {
      // In a real app, this would update the database
      // For now, we'll just rebuild the UI
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã đánh dấu thông báo')),
    );
  }

  void _markAllAsRead() {
    setState(() {
      // In a real app, this would update all notifications in database
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã đánh dấu tất cả thông báo')),
    );
  }

  void _deleteNotification(String notificationId) {
    setState(() {
      // In a real app, this would delete from database
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã xóa thông báo')),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Lọc thông báo',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _filters.map((filter) {
                return RadioListTile<String>(
                  title: Text(
                    filter,
                    style: const TextStyle(fontSize: 16),
                  ),
                  value: filter,
                  groupValue: _selectedFilter,
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        _selectedFilter = value;
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  activeColor: Theme.of(context).primaryColor,
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Hủy',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        );
      },
    );
  }
}

class NotificationItem {
  final String id;
  final String title;
  final String message;
  final String type;
  final DateTime time;
  final bool isRead;
  final IconData icon;
  final Color iconColor;

  NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.time,
    required this.isRead,
    required this.icon,
    required this.iconColor,
  });
}
