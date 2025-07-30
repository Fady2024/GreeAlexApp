import 'package:flutter/material.dart';
import 'package:gree_alex/core/theme/colors.dart';
import 'package:gree_alex/core/theme/typography.dart';
import '../../../../l10n/app_localizations.dart';

class EcoHeroBadge extends StatelessWidget {
  final int activityCount;

  const EcoHeroBadge({super.key, required this.activityCount});

  String _getHeroTitle(AppLocalizations appLocalizations) {
    if (activityCount >= 10) {
      return appLocalizations.ecoChampion;
    } else if (activityCount >= 5) {
      return appLocalizations.ecoHero;
    } else if (activityCount >= 1) {
      return appLocalizations.ecoStarter;
    } else {
      return appLocalizations.ecoNewbie;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    if (activityCount == 0) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.shield_outlined, color: AppColors.white, size: 16),
          const SizedBox(width: 8),
          Text(
            _getHeroTitle(appLocalizations),
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
} 