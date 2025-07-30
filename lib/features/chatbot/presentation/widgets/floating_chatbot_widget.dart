import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../screens/chatbot_screen.dart';

class FloatingChatbotWidget extends StatefulWidget {
  const FloatingChatbotWidget({super.key});

  @override
  State<FloatingChatbotWidget> createState() => _FloatingChatbotWidgetState();
}

class _FloatingChatbotWidgetState extends State<FloatingChatbotWidget>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _bounceController;
  bool _showTooltip = true;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );


  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Hide tooltip after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showTooltip = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _bounceController.dispose();
    super.dispose();
  }

  void _onTap() {
    _bounceController.forward().then((_) {
      _bounceController.reverse();
    });

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ChatbotScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Positioned(
      bottom: 20,
      right: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Tooltip
          if (_showTooltip)
            Container(
              margin: const EdgeInsets.only(bottom: 12, right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey400.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '🤖',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    appLocalizations.chatbotTooltip,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.grey700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ).animate().slideX(duration: 400.ms, begin: 1).fadeIn(),

          // Floating Action Button
          Stack(
            alignment: Alignment.center,
            children: [
              // Pulse animation
              AnimatedBuilder(
                animation: _pulseController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 1.0 + (_pulseController.value * 0.1),
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondary.withOpacity(
                          0.3 * (1 - _pulseController.value),
                        ),
                      ),
                    ),
                  );
                },
              ),

              // Main button
              ScaleTransition(
                scale: Tween<double>(
                  begin: 1.0,
                  end: 0.95,
                ).animate(CurvedAnimation(
                  parent: _bounceController,
                  curve: Curves.easeInOut,
                )),
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.secondary,
                        AppColors.primary,
                      ],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.secondary.withOpacity(0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _onTap,
                      borderRadius: BorderRadius.circular(28),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/images/chatbot.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Green dot indicator
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.secondary.withOpacity(0.5),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ).animate(delay: 500.ms).scale(duration: 400.ms),
            ],
          ),
        ],
      ),
    );
  }
}
