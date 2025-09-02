import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostCustomerPage extends ConsumerWidget {
  const PostCustomerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng khách'),
      ),
      body: const Center(
        child: Text('Đăng khách - Đang phát triển'),
      ),
    );
  }
}
