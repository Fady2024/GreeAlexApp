import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../layout/presentation/screens/main_layout.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.greenLight,
              AppColors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                Column(
                  children: [
                    Image.asset(AppAssets.appLogo, height: 100),
                    const SizedBox(height: 24),
                    Text(
                      AppLocalizations.of(context)!.appTitle,
                      style: AppTypography.h1.copyWith(
                        fontSize: 48,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      AppLocalizations.of(context)!.welcomeSlogan,
                      style: AppTypography.h3.copyWith(
                        color: AppColors.grey700,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ).animate().slideY(duration: 600.ms, begin: 0.5, curve: Curves.easeOutCubic).fadeIn(duration: 500.ms),

                const Spacer(flex: 3),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const MainLayout(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.white,
                          elevation: 5,
                          shadowColor: AppColors.primary.withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.getStarted,
                          style: AppTypography.buttonLarge,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.inPartnershipWith,
                          style: AppTypography.bodySmall.copyWith(color: AppColors.grey500),
                        ),
                        const SizedBox(width: 8),
                        Image.asset(
                          AppAssets.alexBankLogo,
                          height: 24,
                        ),
                      ],
                    ),
                  ],
                ).animate(delay: 800.ms).slideY(duration: 800.ms, begin: 0.8, curve: Curves.easeOutCubic).fadeIn(duration: 700.ms),

                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}