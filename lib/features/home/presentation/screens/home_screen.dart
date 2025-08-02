import 'package:flutter/material.dart';
import 'package:gree_alex/l10n/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';
import '../../../leaderboard/presentation/screens/leaderboard_and_rewards_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../../domain/models/eco_action.dart';
import '../../domain/models/volunteer_opportunity.dart';
import '../widgets/eco_action_card.dart';
import '../widgets/points_badge.dart';
import '../widgets/volunteer_card.dart';
import '../../../partners/presentation/screens/partners_screen.dart';
import '../../../chatbot/presentation/widgets/floating_chatbot_widget.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual data from backend
    final String userName = "Fady";
    final int totalPoints = 1250;
    final appLocalizations = AppLocalizations.of(context)!;

    // Mock data
    final List<EcoAction> _mockEcoActions = [
      EcoAction(
        id: '1',
        title: appLocalizations.recyclePlasticBottlesTitle,
        description: appLocalizations.recyclePlasticBottlesDescription,
        icon: 'assets/icons/water-bottle.png',
        points: 50,
        category: appLocalizations.recycingCategory,
      ),
      EcoAction(
        id: '2',
        title: appLocalizations.publicTransportTitle,
        description: appLocalizations.publicTransportDescription,
        icon: 'assets/icons/green-car.png',
        points: 100,
        category: appLocalizations.transportCategory,
      ),
      EcoAction(
        id: '3',
        title: appLocalizations.plantTreeTitle,
        description: appLocalizations.plantTreeDescription,
        icon: 'assets/icons/tree.svg',
        points: 200,
        category: appLocalizations.gardeningCategory,
      ),
      EcoAction(
        id: '4',
        title: appLocalizations.reduceEnergyTitle,
        description: appLocalizations.reduceEnergyDescription,
        icon: 'assets/icons/save-energy.png',
        points: 150,
        category: appLocalizations.energyCategory,
      ),
    ];

    final List<VolunteerOpportunity> _mockVolunteerOpportunities = [
      VolunteerOpportunity(
        id: '1',
        title: appLocalizations.beachCleanupTitle,
        description: appLocalizations.beachCleanupDescription,
        location: appLocalizations.locationNileRiverBank,
        date: DateTime.now().add(const Duration(days: 5)),
        points: 500,
        image: 'assets/icons/beach_cleanup.jpg',
        participantsCount: 45,
        maxParticipants: 50,
      ),
      VolunteerOpportunity(
        id: '2',
        title: appLocalizations.treePlantingTitle,
        description: appLocalizations.treePlantingDescription,
        location: appLocalizations.locationLocalCommunity,
        date: DateTime.now().add(const Duration(days: 7)),
        points: 400,
        image: 'assets/icons/tree_planting.jpg',
        participantsCount: 28,
        maxParticipants: 40,
      ),
    ];
    
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              // Welcome Section
              Container(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
                decoration: const BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(32),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              appLocalizations.welcomeBack,
                              style: AppTypography.bodyLarge.copyWith(color: AppColors.white.withOpacity(0.9)),
                            ),
                            Text(
                              userName,
                              style: AppTypography.h2.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const LeaderboardAndRewardsScreen(),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.emoji_events_outlined, color: AppColors.white, size: 30),
                              tooltip: appLocalizations.leaderboardAndRewards,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProfileScreen(),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.person_outline, color: AppColors.white, size: 30),
                              tooltip: appLocalizations.profileTitle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: PointsBadge(
                        points: totalPoints,
                        isLarge: true,
                      ),
                    ),
                  ],
                ),
              ),

              // Volunteering Opportunities
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.volunteeringOpportunities,
                            style: AppTypography.h3,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // TODO: Navigate to all opportunities
                          },
                          child: Text(AppLocalizations.of(context)!.seeAll),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 320,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _mockVolunteerOpportunities.length,
                        separatorBuilder: (context, index) => const SizedBox(width: 16),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 280,
                            child: VolunteerCard(
                              opportunity: _mockVolunteerOpportunities[index],
                              onTap: () {
                                // TODO: Navigate to opportunity details
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Suggested Eco Actions
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.suggestedEcoActions,
                      style: AppTypography.h3,
                    ),
                    const SizedBox(height: 16),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _mockEcoActions.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return EcoActionCard(
                          action: _mockEcoActions[index],
                          onTap: () {
                            // TODO: Navigate to action details
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const PartnersScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.handshake_outlined, color: AppColors.primary),
                    label: Text(
                      AppLocalizations.of(context)!.ourPartners,
                      style: AppTypography.buttonLarge.copyWith(color: AppColors.primary),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.primary),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
      
      // Floating Chatbot Widget
      const FloatingChatbotWidget(),
    ],
  ),
);
  }


}