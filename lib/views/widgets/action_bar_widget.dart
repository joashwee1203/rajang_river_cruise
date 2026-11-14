import 'package:flutter/material.dart';

class ActionBarWidget extends StatelessWidget {
  const ActionBarWidget({super.key});

  void showActionMessage(BuildContext context, String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$action selected'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          actionButton(context, icon: Icons.call, label: 'CALL'),
          actionButton(context, icon: Icons.near_me, label: 'ROUTE'),
          actionButton(context, icon: Icons.share, label: 'SHARE'),
        ],
      ),
    );
  }

  Widget actionButton(
      BuildContext context, {
        required IconData icon,
        required String label,
      }) {
    return TextButton(
      onPressed: () => showActionMessage(context, label),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}