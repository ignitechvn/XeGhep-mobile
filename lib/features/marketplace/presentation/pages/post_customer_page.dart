import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:xe_ghep_app/features/marketplace/domain/entities/post_customer_request.dart';
import 'package:xe_ghep_app/features/marketplace/presentation/pages/my_post_detail_page.dart';
import 'package:xe_ghep_app/features/marketplace/presentation/providers/marketplace_provider.dart';
import 'package:xe_ghep_app/features/marketplace/presentation/widgets/my_post_card.dart';
import 'package:xe_ghep_app/features/marketplace/presentation/pages/post_customer_page_new.dart';

class PostCustomerPage extends ConsumerStatefulWidget {
  const PostCustomerPage({super.key});

  @override
  ConsumerState<PostCustomerPage> createState() => _PostCustomerPageState();
}

class _PostCustomerPageState extends ConsumerState<PostCustomerPage> {
  @override
  Widget build(BuildContext context) {
    final myPostsAsync = ref.watch(myPostsProvider);
    final postCustomerState = ref.watch(postCustomerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng khách'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(myPostsProvider);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Header with score and quota
          _buildHeader(context),
          

          
          // My posts list
          Expanded(
            child: myPostsAsync.when(
              data: (posts) => _buildMyPostsList(context, posts),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => _buildErrorWidget(context, error),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showPostCustomerForm(context),
        icon: const Icon(Icons.add),
        label: const Text('Chia sẻ khách'),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Score: +15',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Quota: 3/5 chuyến/ngày',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  'Có thể chia sẻ',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
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



  Widget _buildMyPostsList(BuildContext context, List<dynamic> posts) {
    if (posts.isEmpty) {
      return _buildEmptyState(context);
    }

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(myPostsProvider);
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return MyPostCard(
            post: posts[index],
            onCancel: () => _handleCancelPost(posts[index].id),
            onViewDetails: () => _handleViewDetails(posts[index].id),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.directions_car_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Chưa có chuyến nào được chia sẻ',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Hãy chia sẻ chuyến đi đầu tiên của bạn',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _showPostCustomerForm(context),
            icon: const Icon(Icons.add),
            label: const Text('Chia sẻ ngay'),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context, Object error) {
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
              ref.invalidate(myPostsProvider);
            },
            child: const Text('Thử lại'),
          ),
        ],
      ),
    );
  }

  void _showPostCustomerForm(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PostCustomerPageNew(),
      ),
    );
  }



  void _handleCancelPost(String postId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hủy chuyến đi'),
        content: const Text('Bạn có chắc chắn muốn hủy chuyến đi này?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
            ),
            child: const Text('Không'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop();
              // TODO: Implement cancel post
              ref.invalidate(myPostsProvider);
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Đã hủy chuyến đi!')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Có'),
          ),
        ],
      ),
    );
  }

  void _handleViewDetails(String postId) {
    final post = ref.read(myPostsProvider).value?.firstWhere(
      (p) => p.id == postId,
      orElse: () => throw Exception('Post not found'),
    );
    
    if (post != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MyPostDetailPage(post: post),
        ),
      );
    }
  }
}
