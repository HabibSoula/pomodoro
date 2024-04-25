import 'package:flutter/material.dart';
import 'package:pomo/ui/common/size_config.dart';

import '../../../common/app_colors.dart';

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final IconData icon;
  final bool isPrimary;
  final VoidCallback onTap;

  const CircularButton({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
    required this.icon,
    required this.onTap,
    this.isPrimary = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: Icon(
            size: 30.0.w,
            icon,
            color: isPrimary ? Colors.white : kcLightGrey,
          ),
        ),
      ),
    );
  }
}
