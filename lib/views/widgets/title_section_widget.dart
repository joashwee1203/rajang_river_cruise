import 'package:flutter/material.dart';

class TitleSectionWidget extends StatelessWidget {
  final String name;
  final String location;
  final int starCount;
  final bool isStarred;
  final VoidCallback onStarPressed;

  const TitleSectionWidget({
    super.key,
    required this.name,
    required this.location,
    required this.starCount,
    required this.isStarred,
    required this.onStarPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  location,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: 'Toggle star!',
            onPressed: onStarPressed,
            icon: Icon(
              isStarred ? Icons.star : Icons.star_border,
              color: Colors.amber,
            ),
          ),
          Text('$starCount'),
        ],
      ),
    );
  }
}