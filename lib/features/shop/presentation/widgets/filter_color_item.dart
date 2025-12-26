import 'package:flutter/material.dart';

class FilterColorItem extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterColorItem({
    super.key,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
                border: Border.all(
                  color: isSelected ? Colors.black : Colors.grey.shade300,
                  width: 2,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(_colorName(color), style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  String _colorName(Color c) {
    if (c == Colors.brown) return 'Brown';
    if (c == Colors.grey) return 'Grey';
    if (c == Colors.green) return 'Green';
    if (c == Colors.red) return 'Red';
    if (c == Colors.orange) return 'Orange';
    if (c == Colors.blue) return 'Blue';
    if (c == Colors.black) return 'Black';
    return '';
  }
}
