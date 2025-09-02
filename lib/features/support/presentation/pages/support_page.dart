import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SupportPage extends ConsumerWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hỗ trợ'),
      ),
      body: const Center(
        child: Text('Hỗ trợ - Đang phát triển'),
      ),
    );
  }
}
