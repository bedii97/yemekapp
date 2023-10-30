import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yemek_app/core/utils/token_manager.dart';
import 'package:yemek_app/features/auth/provider/auth_provider.dart';

class NotificationsPage extends ConsumerWidget with TokenManager {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          ref.read(authProvider.notifier).logout(context);
        },
        child: const Text('Logout'),
      ),
    );
  }
}
