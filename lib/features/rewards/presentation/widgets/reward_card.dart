import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';
import '../../../home/presentation/widgets/points_badge.dart';
import '../../domain/models/reward.dart';

class RewardCard extends StatelessWidget {
  final Reward reward;
  final VoidCallback onRedeem;

  const RewardCard({
    super.key,
    required this.reward,
    required this.onRedeem,
  });

  Color _getCategoryColor() {
    switch (reward.category) {
      case 'Banking':
        return AppColors.primary;
      case 'Sustainability':
        return const Color(0xFF4CAF50);
      case 'Lifestyle':
        return const Color(0xFFF4A300);
      case 'Shopping':
        return const Color(0xFF9C27B0);
      default:
        return AppColors.grey500;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onRedeem,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: _getCategoryColor().withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: SvgPicture.asset(
                            // Fix for incorrect asset path
                            reward.iconUrl.startsWith('assets/') ? reward.iconUrl : 'assets/icons/${reward.iconUrl}',
                            width: 20,
                            height: 20,
                            colorFilter: ColorFilter.mode(_getCategoryColor(), BlendMode.srcIn),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.grey100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              reward.category,
                              style: AppTypography.bodySmall.copyWith(
                                color: _getCategoryColor(),
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      reward.title,
                      style: AppTypography.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey900,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      reward.description,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.grey500,
                      ),
                      maxLines: 3, // Allow more lines before ellipsis
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PointsBadge(points: reward.requiredPoints),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: onRedeem,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Redeem'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
