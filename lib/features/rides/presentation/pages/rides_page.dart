import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RidesPage extends ConsumerWidget {
  const RidesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chuyến đi'),
      ),
      body: const Center(
        child: Text('Chuyến đi - Đang phát triển'),
      ),
    );
  }
}
