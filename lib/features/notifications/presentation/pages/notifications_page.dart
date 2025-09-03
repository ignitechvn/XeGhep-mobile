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
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                _selectedFilter = value;
              });
            },
            itemBuilder: (context) => _filters.map((filter) {
              return PopupMenuItem<String>(
                value: filter,
                child: Row(
                  children: [
                    if (_selectedFilter == filter)
                      Icon(
                        Icons.check,
                        color: Theme.of(context).primaryColor,
                        size: 20,
                      )
                    else
                      const SizedBox(width: 20),
                    const SizedBox(width: 8),
                    Text(filter),
                  ],
                ),
              );
            }).toList(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _selectedFilter,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.keyboard_arrow_down, size: 16),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
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
      child: InkWell(
        onTap: () => _markAsRead(notification.id),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: notification.iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  notification.icon,
                  color: notification.iconColor,
                  size: 20,
                ),
              ),
              
              const SizedBox(width: 12),
              
              // Content
              Expanded(
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
              
              // Actions
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'delete') {
                    _deleteNotification(notification.id);
                  } else if (value == 'mark_read') {
                    _markAsRead(notification.id);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem<String>(
                    value: 'mark_read',
                    child: Row(
                      children: [
                        Icon(
                          Icons.mark_email_read,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 8),
                        Text(
                          notification.isRead ? 'Đánh dấu chưa đọc' : 'Đánh dấu đã đọc',
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          size: 16,
                          color: Colors.red[600],
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Xóa',
                          style: TextStyle(color: Colors.red[600]),
                        ),
                      ],
                    ),
                  ),
                ],
                child: Icon(
                  Icons.more_vert,
                  color: Colors.grey[400],
                  size: 20,
                ),
              ),
            ],
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
