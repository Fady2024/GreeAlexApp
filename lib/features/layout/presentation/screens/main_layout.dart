import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:gree_alex/core/theme/colors.dart';
import 'package:gree_alex/features/home/presentation/screens/home_screen.dart';
import 'package:gree_alex/features/leaderboard/presentation/screens/leaderboard_and_rewards_screen.dart';
import 'package:gree_alex/features/profile/presentation/screens/profile_screen.dart';
import 'package:gree_alex/features/qr_scanner/presentation/screens/qr_scanner_screen.dart';
import 'package:gree_alex/l10n/app_localizations.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    const LeaderboardAndRewardsScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onScanQRTapped() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QRScannerScreen()),
    ).then((value) {
      if (value != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${AppLocalizations.of(context)!.scannedCode}: $value',
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onScanQRTapped,
        backgroundColor: AppColors.primary,
        shape: const CircleBorder(),
        child: const Icon(Icons.qr_code_scanner, color: AppColors.white),
        elevation: 2.0,
        tooltip: appLocalizations.scanQRCode,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: AppColors.white,
        elevation: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildNavItem(icon: Icons.home_rounded, index: 0, label: appLocalizations.home),
            _buildNavItem(icon: Icons.leaderboard_rounded, index: 1, label: appLocalizations.leaderboard),
            const SizedBox(width: 48), // Placeholder for the FAB
            _buildNavItem(icon: Icons.person_rounded, index: 2, label: appLocalizations.profile),
            _buildNavItem(icon: Icons.card_giftcard_rounded, index: 3, label: appLocalizations.rewards), // Assuming you have a rewards screen
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required int index, required String label}) {
    // A simple remapping for the demo. You might have a separate rewards page.
    final displayIndex = index > 2 ? 1 : index;
    final isSelected = _selectedIndex == displayIndex;
    return IconButton(
      icon: Icon(
        icon,
        color: isSelected ? AppColors.primary : AppColors.grey500,
        size: 28,
      ),
      onPressed: () => _onItemTapped(displayIndex),
      tooltip: label,
    );
  }
}
