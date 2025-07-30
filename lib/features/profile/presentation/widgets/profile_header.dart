import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';
import '../../../home/presentation/widgets/points_badge.dart';
import '../../../../l10n/app_localizations.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final int totalPoints;
  final String avatarUrl;
  final VoidCallback onEditProfile;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    required this.totalPoints,
    required this.avatarUrl,
    required this.onEditProfile,
  });

  @override
    Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 48,
            //backgroundImage: NetworkImage(avatarUrl), // Temporarily disabled
            child: Icon(Icons.person, size: 60, color: AppColors.primary.withOpacity(0.8)),
            backgroundColor: AppColors.grey200,
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: AppTypography.h2,
          ),
          const SizedBox(height: 4),
          Text(
            email,
            style: AppTypography.bodyMedium.copyWith(color: AppColors.grey500),
          ),
          const SizedBox(height: 16),
          PointsBadge(points: totalPoints, isLarge: true),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: onEditProfile,
              icon: const Icon(Icons.edit_outlined),
                            label: Text(appLocalizations.editProfile),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 