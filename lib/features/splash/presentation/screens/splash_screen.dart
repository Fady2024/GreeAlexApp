import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../welcome/presentation/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToWelcome();
  }

  _navigateToWelcome() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    if (mounted) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const WelcomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 500),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primary,
              AppColors.greenDark,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.white.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Image.asset(
                  AppAssets.appLogo,
                  height: 120,
                  width: 120,
                ),
              )
                  .animate(onPlay: (controller) => controller.repeat())
                  .shimmer(duration: 2000.ms, color: AppColors.white.withOpacity(0.3))
                  .animate()
                  .scale(duration: 800.ms, curve: Curves.easeOutBack)
                  .fadeIn(duration: 600.ms),

              const SizedBox(height: 32),

              // App title
              Text(
                'GreeAlex',
                style: AppTypography.h1.copyWith(
                  color: AppColors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              )
                  .animate(delay: 400.ms)
                  .slideY(duration: 600.ms, begin: 0.3, curve: Curves.easeOutCubic)
                  .fadeIn(duration: 500.ms),

              const SizedBox(height: 16),

              // Tagline
              Text(
                'Banking for a Greener Future',
                style: AppTypography.bodyLarge.copyWith(
                  color: AppColors.white.withOpacity(0.9),
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
              )
                  .animate(delay: 600.ms)
                  .slideY(duration: 600.ms, begin: 0.3, curve: Curves.easeOutCubic)
                  .fadeIn(duration: 500.ms),

              const Spacer(flex: 2),

              // Loading indicator with custom animation
              Column(
                children: [
                  // Custom animated loading dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                      )
                          .animate(onPlay: (controller) => controller.repeat())
                          .scale(
                            duration: 1000.ms,
                            begin: const Offset(0.5, 0.5),
                            end: const Offset(1.0, 1.0),
                            curve: Curves.easeInOut,
                          )
                          .then(delay: (index * 200).ms);
                    }),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Loading text
                  Text(
                    'Loading...',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.white.withOpacity(0.7),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                      .animate(onPlay: (controller) => controller.repeat())
                      .fadeIn(duration: 1000.ms)
                      .then()
                      .fadeOut(duration: 1000.ms),
                ],
              )
                  .animate(delay: 1000.ms)
                  .fadeIn(duration: 500.ms),

              const SizedBox(height: 48),

              // Partnership text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'In partnership with',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.white.withOpacity(0.6),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      AppAssets.alexBankLogo,
                      height: 20,
                    ),
                  ),
                ],
              )
                  .animate(delay: 1200.ms)
                  .slideY(duration: 600.ms, begin: 0.3, curve: Curves.easeOutCubic)
                  .fadeIn(duration: 500.ms),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
