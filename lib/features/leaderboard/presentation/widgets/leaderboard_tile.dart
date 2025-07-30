import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';
import '../../../home/presentation/widgets/points_badge.dart';
import '../../domain/models/leaderboard_user.dart';

class LeaderboardTile extends StatelessWidget {
  final LeaderboardUser user;

  const LeaderboardTile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final isTopThree = user.rank <= 3;
    final highlightColor = _getHighlightColor(user.rank);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isTopThree ? highlightColor.withOpacity(0.05) : AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isTopThree ? highlightColor.withOpacity(0.3) : AppColors.grey200,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Rank
          Text(
            '#${user.rank}',
            style: AppTypography.h3.copyWith(
              color: isTopThree ? highlightColor : AppColors.grey700,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 16),
          
          // Avatar
          CircleAvatar(
            radius: 24,
            child: Icon(Icons.person, color: AppColors.grey500),
            backgroundColor: AppColors.grey200,
          ),
          const SizedBox(width: 16),
          
          // Name
          Expanded(
            child: Text(
              user.name,
              style: AppTypography.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          
          // Points
          PointsBadge(points: user.points, onLightBackground: true),
        ],
      ),
    );
  }

  Color _getHighlightColor(int rank) {
    switch (rank) {
      case 1:
        return AppColors.secondary; // Gold
      case 2:
        return AppColors.grey500; // Silver
      case 3:
        return const Color(0xFFCD7F32); // Bronze
      default:
        return AppColors.grey200;
    }
  }
} 