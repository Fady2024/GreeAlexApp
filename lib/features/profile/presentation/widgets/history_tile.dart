import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';
import '../../../home/presentation/widgets/points_badge.dart';
import '../../domain/models/volunteer_history.dart';

class HistoryTile extends StatelessWidget {
  final VolunteerHistory history;

  const HistoryTile({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.greenLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: history.icon.endsWith('.svg')
                  ? SvgPicture.asset(
                      history.icon,
                      width: 24,
                      height: 24,
                    )
                  : Image.asset(
                      history.icon,
                      width: 24,
                      height: 24,
                    ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  history.title,
                  style: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat.yMMMd().format(history.date),
                  style: AppTypography.bodySmall.copyWith(color: AppColors.grey500),
                ),
              ],
            ),
          ),
          PointsBadge(points: history.points),
        ],
      ),
    );
  }
}