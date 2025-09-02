import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hồ sơ'),
      ),
      body: const Center(
        child: Text('Hồ sơ - Đang phát triển'),
      ),
    );
  }
}
