import 'package:flutter/material.dart';
import 'package:gree_alex/core/theme/colors.dart';

class PhoneFrameWrapper extends StatelessWidget {
  final Widget child;

  const PhoneFrameWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey200,
      body: Center(
        child: Container(
          // Phone dimensions (e.g., iPhone 13 Pro)
          width: 400,
          height: 844,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.black, width: 8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                spreadRadius: 5,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: child,
          ),
        ),
      ),
    );
  }
}
