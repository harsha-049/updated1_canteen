import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String title;
  final IconData icon;
  const CategoryTile({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext c) => Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => ScaffoldMessenger.of(c).showSnackBar(SnackBar(content: Text('$title clicked!'))),
      child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, size: 48, color: Colors.deepPurple),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 16)),
      ])),
    ),
  );
}
