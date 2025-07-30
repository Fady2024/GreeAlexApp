import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';
import '../../../../l10n/app_localizations.dart';

class PointsBadge extends StatelessWidget {
  final int points;
  final bool isLarge;
  final bool onLightBackground;

  const PointsBadge({
    super.key,
    required this.points,
    this.isLarge = false,
    this.onLightBackground = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor;
    final Color borderColor;
    final Color contentColor;

    if (onLightBackground) {
      backgroundColor = AppColors.primary.withOpacity(0.08);
      borderColor = AppColors.primary.withOpacity(0.2);
      contentColor = AppColors.primary;
    } else {
      backgroundColor = AppColors.white.withOpacity(0.2);
      borderColor = AppColors.white.withOpacity(0.3);
      contentColor = AppColors.white;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isLarge ? 16.0 : 12.0,
        vertical: isLarge ? 8.0 : 6.0,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.eco_rounded,
            color: contentColor,
            size: isLarge ? 24.0 : 16.0,
          ),
          const SizedBox(width: 8),
          Text(
            AppLocalizations.of(context)!.greenPointsAbbreviation(points),
            style: (isLarge ? AppTypography.h3 : AppTypography.bodyLarge).copyWith(
              color: contentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}