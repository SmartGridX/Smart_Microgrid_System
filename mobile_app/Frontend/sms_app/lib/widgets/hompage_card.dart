import 'package:flutter/material.dart';

class HompageCard extends StatelessWidget {
  final String title;
  final String value;
  final String changeText;
  final Color color;
  final IconData icon;
  final Color titleColor;
  final Color valueColor;
  final Color changeTextColor;
  final Color iconColor;

  const HompageCard({
    required this.title,
    required this.value,
    required this.changeText,
    required this.color,
    required this.icon,
    required this.titleColor,
    required this.valueColor,
    required this.changeTextColor,
    required this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withAlpha((0.1 * 200).toInt()),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: valueColor,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(icon, size: 24, color: iconColor),
                ],
              ),
              SizedBox(height: 4),
              Text(
                changeText,
                style: TextStyle(fontSize: 14, color: changeTextColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
