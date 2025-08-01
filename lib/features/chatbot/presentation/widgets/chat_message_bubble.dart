import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/models/chat_message.dart';

class ChatMessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isConsecutive;
  final VoidCallback? onQuickActionTap;

  const ChatMessageBubble({
    super.key,
    required this.message,
    this.isConsecutive = false,
    this.onQuickActionTap,
  });

  @override
  Widget build(BuildContext context) {
    final isUser = message.sender == MessageSender.user;

    return Container(
      margin: EdgeInsets.only(
        bottom: 8,
        top: isConsecutive ? 2 : 8,
        left: isUser ? 50 : 16,
        right: isUser ? 16 : 50,
      ),
      child: Column(
        crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // Message bubble
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isUser ? AppColors.primary : AppColors.grey100,
              borderRadius: BorderRadius.circular(20).copyWith(
                bottomLeft: isUser ? const Radius.circular(20) : const Radius.circular(4),
                bottomRight: isUser ? const Radius.circular(4) : const Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey300.withOpacity(0.3),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (message.isTyping)
                  _buildTypingIndicator()
                else
                  Text(
                    message.content,
                    style: AppTypography.bodyMedium.copyWith(
                      color: isUser ? AppColors.white : AppColors.grey900,
                      height: 1.4,
                    ),
                  ),
                
                // Banking info card
                if (message.bankingInfo != null)
                  _buildBankingInfoCard(message.bankingInfo!, context),
                
                // Sustainability tip card
                if (message.sustainabilityTip != null)
                  _buildSustainabilityTipCard(message.sustainabilityTip!, context),
              ],
            ),
          ),

          // Quick actions
          if (message.quickActions != null && message.quickActions!.isNotEmpty)
            _buildQuickActions(message.quickActions!, context),

          // Timestamp
          if (!isConsecutive)
            Padding(
              padding: EdgeInsets.only(
                top: 4,
                left: isUser ? 0 : 16,
                right: isUser ? 16 : 0,
              ),
              child: Text(
                _formatTime(message.timestamp),
                style: AppTypography.caption.copyWith(
                  color: AppColors.grey500,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildDot(0),
        const SizedBox(width: 4),
        _buildDot(1),
        const SizedBox(width: 4),
        _buildDot(2),
      ],
    );
  }

  Widget _buildDot(int index) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 600 + (index * 200)),
      tween: Tween(begin: 0.4, end: 1.0),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: AppColors.grey500.withOpacity(value),
              shape: BoxShape.circle,
            ),
          ),
        );
      },
      onEnd: () {
        // Repeat animation
      },
    );
  }

  Widget _buildBankingInfoCard(BankingInfo bankingInfo, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.account_balance,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  bankingInfo.title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            bankingInfo.description,
            style: AppTypography.bodyMedium,
          ),
          if (bankingInfo.greenPoints != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.stars,
                  color: AppColors.secondary,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  '${bankingInfo.greenPoints} GP',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
          if (bankingInfo.actionText != null) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  bankingInfo.actionText!,
                  style: AppTypography.buttonMedium,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSustainabilityTipCard(SustainabilityTip tip, BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.secondary.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: tip.icon.endsWith('.svg')
                    ? SvgPicture.asset(
                        tip.icon,
                        width: 20,
                        height: 20,
                        colorFilter: const ColorFilter.mode(
                          AppColors.secondary,
                          BlendMode.srcIn,
                        ),
                      )
                    : Image.asset(
                        tip.icon,
                        width: 20,
                        height: 20,
                      ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tip.title,
                      style: AppTypography.bodyLarge.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      tip.category,
                      style: AppTypography.caption.copyWith(
                        color: AppColors.grey500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${tip.potentialPoints} GP',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            tip.description,
            style: AppTypography.bodyMedium,
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.secondary),
                foregroundColor: AppColors.secondary,
                padding: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                appLocalizations.getStarted,
                style: AppTypography.buttonMedium.copyWith(color: AppColors.grey900),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(List<QuickAction> actions, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: actions.map((action) {
          return InkWell(
            onTap: action.onTap,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.grey100,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.grey300),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey300.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    action.icon,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    action.title,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.grey700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
    
    return '$displayHour:$minute $period';
  }
}
