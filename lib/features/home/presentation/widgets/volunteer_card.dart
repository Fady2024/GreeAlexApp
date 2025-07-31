import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/models/volunteer_opportunity.dart';
import 'points_badge.dart';

class VolunteerCard extends StatelessWidget {
  final VolunteerOpportunity opportunity;
  final VoidCallback onTap;

  const VolunteerCard({
    super.key,
    required this.opportunity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: opportunity.image.endsWith('.svg')
                  ? SvgPicture.asset(
                      opportunity.image,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      opportunity.image,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Points
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          opportunity.title,
                          style: AppTypography.bodyLarge.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      PointsBadge(points: opportunity.points, onLightBackground: true),
                    ],
                  ),
                  const SizedBox(height: 8),
                  
                  // Location
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: AppColors.grey500,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        opportunity.location,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.grey500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  
                  // Date
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 16,
                        color: AppColors.grey500,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        DateFormat('MMM dd, yyyy').format(opportunity.date),
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.grey500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  
                  // Progress Bar
                  LinearProgressIndicator(
                    value: opportunity.participantsCount / opportunity.maxParticipants,
                    backgroundColor: AppColors.grey200,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      opportunity.isFull ? AppColors.error : AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Participants Count
                  Text(
                    AppLocalizations.of(context)!.participantsCount(opportunity.participantsCount, opportunity.maxParticipants),
                    style: AppTypography.bodySmall.copyWith(
                      color: opportunity.isFull ? AppColors.error : AppColors.grey700,
                    ),
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