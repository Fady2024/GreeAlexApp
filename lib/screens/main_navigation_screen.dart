import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../../l10n/app_localizations.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/leaderboard/presentation/screens/leaderboard_and_rewards_screen.dart';
import '../../features/partners/presentation/screens/partners_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/chatbot/presentation/widgets/floating_chatbot_widget.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final _pageController = PageController(initialPage: 0);
  final NotchBottomBarController _controller = NotchBottomBarController(index: 0);

  int maxCount = 4;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    
    final List<Widget> bottomBarPages = [
      HomeScreen(),
      const LeaderboardAndRewardsScreen(),
      const PartnersScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          bottomBarPages.length,
          (index) => Stack(
            children: [
              bottomBarPages[index],
              // إضافة الـ chatbot للصفحة الرئيسية فقط
              if (index == 0) const FloatingChatbotWidget(),
            ],
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: AppColors.white,
        showLabel: true,
        textOverflow: TextOverflow.visible,
        maxLine: 1,
        shadowElevation: 20,
        kIconSize: 24.0,
        kBottomRadius: 28.0,
        bottomBarWidth: MediaQuery.of(context).size.width * 0.9,
        showShadow: true,
        itemLabelStyle: AppTypography.caption.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
        elevation: 12,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Container(
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.home_outlined,
                color: AppColors.grey500,
                size: 24,
              ),
            ),
            activeItem: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.secondary, AppColors.primary],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.home,
                color: AppColors.white,
                size: 24,
              ).animate().scale(duration: 200.ms),
            ),
            itemLabel: appLocalizations.appTitle,
          ),
          BottomBarItem(
            inActiveItem: Container(
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.emoji_events_outlined,
                color: AppColors.grey500,
                size: 24,
              ),
            ),
            activeItem: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.secondary, AppColors.primary],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondary.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.emoji_events,
                color: AppColors.white,
                size: 24,
              ).animate().scale(duration: 200.ms),
            ),
            itemLabel: appLocalizations.leaderboard,
          ),
          BottomBarItem(
            inActiveItem: Container(
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.handshake_outlined,
                color: AppColors.grey500,
                size: 24,
              ),
            ),
            activeItem: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.secondary, AppColors.primary],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.handshake,
                color: AppColors.white,
                size: 24,
              ).animate().scale(duration: 200.ms),
            ),
            itemLabel: appLocalizations.ourPartners,
          ),
          BottomBarItem(
            inActiveItem: Container(
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.person_outline,
                color: AppColors.grey500,
                size: 24,
              ),
            ),
            activeItem: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.secondary, AppColors.primary],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.person,
                color: AppColors.white,
                size: 24,
              ).animate().scale(duration: 200.ms),
            ),
            itemLabel: appLocalizations.profileTitle,
          ),
        ],
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
