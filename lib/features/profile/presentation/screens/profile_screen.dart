import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/models/volunteer_history.dart';
import '../widgets/eco_hero_badge.dart';
import '../widgets/history_tile.dart';
import '../widgets/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final int _totalPoints = 1250;
  final int _activityCount = 7;
  final String _userName = 'Fady';
  final String _userEmail = 'fady@example.com';
  final String _avatarUrl = 'assets/icons/user_placeholder.png'; // Using a local asset

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    final List<VolunteerHistory> _mockHistory = [
      VolunteerHistory(
        id: '1',
        title: appLocalizations.historyBeachCleanupTitle,
        organization: 'Green Alex',
        date: DateTime.now().subtract(const Duration(days: 10)),
        points: 500,
        icon: 'assets/icons/beach.png',
      ),
      VolunteerHistory(
        id: '2',
        title: appLocalizations.historyTreePlantingTitle,
        organization: 'Eco Friends',
        date: DateTime.now().subtract(const Duration(days: 25)),
        points: 250,
        icon: 'assets/icons/tree.svg',
      ),
      VolunteerHistory(
        id: '3',
        title: appLocalizations.historyRecyclingWorkshopTitle,
        organization: 'Recycle Egypt',
        date: DateTime.now().subtract(const Duration(days: 40)),
        points: 150,
        icon: 'assets/icons/recycle.png',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: Text(
          appLocalizations.profileTitle,
          style: AppTypography.h2.copyWith(
            color: AppColors.grey900,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: AppColors.grey700),
            onPressed: () {
              // TODO: Implement settings navigation
            },
          ),
        ],
      ),
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              gradient: AppColors.primaryGradient,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileHeader(
                    name: _userName,
                    email: _userEmail,
                    totalPoints: _totalPoints,
                    avatarUrl: _avatarUrl,
                    onEditProfile: () {},
                  ),
                  const SizedBox(height: 24),
                  EcoHeroBadge(activityCount: _activityCount),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appLocalizations.myVolunteeringHistory,
                          style: AppTypography.h3,
                        ),

                        const SizedBox(height: 16),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _mockHistory.length,
                          separatorBuilder: (context, index) => const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            return HistoryTile(history: _mockHistory[index]);
                          },
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton.icon(
                            onPressed: () {
                              // TODO: Implement logout
                            },
                            icon: const Icon(Icons.logout, color: AppColors.error),
                            label: Text(
                              appLocalizations.logout,
                              style: AppTypography.buttonMedium.copyWith(color: AppColors.error),
                            ),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 
 
 
 