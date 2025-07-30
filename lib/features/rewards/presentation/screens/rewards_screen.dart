import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/models/reward.dart';
import '../widgets/promo_banner.dart';
import '../widgets/reward_card.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    final List<Reward> _mockRewards = [
      Reward(
        id: '1',
        title: appLocalizations.rewardSavingsBonusTitle,
        description: appLocalizations.rewardSavingsBonusDescription,
        requiredPoints: 2000,
        iconUrl: 'assets/icons/bank.svg',
        category: appLocalizations.categoryBanking,
        partnerName: appLocalizations.partnerAlexBank,
      ),
      Reward(
        id: '2',
        title: appLocalizations.rewardFeeWaiverTitle,
        description: appLocalizations.rewardFeeWaiverDescription,
        requiredPoints: 1500,
        iconUrl: 'assets/icons/credit_card.svg',
        category: appLocalizations.categoryBanking,
        partnerName: appLocalizations.partnerAlexBank,
      ),
      Reward(
        id: '3',
        title: appLocalizations.rewardPlantTreeTitle,
        description: appLocalizations.rewardPlantTreeDescription,
        requiredPoints: 1000,
        iconUrl: 'assets/icons/tree.svg',
        category: appLocalizations.categorySustainability,
        partnerName: appLocalizations.partnerAlexBankGreenInitiative,
      ),
      Reward(
        id: '4',
        title: appLocalizations.rewardFreeCoffeeTitle,
        description: appLocalizations.rewardFreeCoffeeDescription,
        requiredPoints: 500,
        iconUrl: 'assets/icons/coffee.svg',
        category: appLocalizations.categoryLifestyle,
        partnerName: appLocalizations.partnerLocalCoffee,
      ),
      Reward(
        id: '5',
        title: appLocalizations.rewardInvestmentConsultationTitle,
        description: appLocalizations.rewardInvestmentConsultationDescription,
        requiredPoints: 3000,
        iconUrl: 'assets/icons/consultation.svg',
        category: appLocalizations.categoryBanking,
        partnerName: appLocalizations.partnerAlexBank,
      ),
      Reward(
        id: '6',
        title: appLocalizations.rewardShoppingVoucherTitle,
        description: appLocalizations.rewardShoppingVoucherDescription,
        requiredPoints: 800,
        iconUrl: 'assets/icons/shopping.svg',
        category: appLocalizations.categoryLifestyle,
        partnerName: appLocalizations.partnerGreenShopping,
      ),
      Reward(
        id: '7',
        title: appLocalizations.rewardLoanDiscountTitle,
        description: appLocalizations.rewardLoanDiscountDescription,
        requiredPoints: 5000,
        iconUrl: 'assets/icons/loan.svg',
        category: appLocalizations.categoryBanking,
        partnerName: appLocalizations.partnerAlexBank,
      ),
      Reward(
        id: '8',
        title: appLocalizations.rewardCashbackTitle,
        description: appLocalizations.rewardCashbackDescription,
        requiredPoints: 4000,
        iconUrl: 'assets/icons/bank.svg',
        category: appLocalizations.categoryBanking,
        partnerName: appLocalizations.partnerAlexBank,
      ),
      Reward(
        id: '9',
        title: appLocalizations.rewardEcoDiscountTitle,
        description: appLocalizations.rewardEcoDiscountDescription,
        requiredPoints: 1200,
        iconUrl: 'assets/icons/tree.svg',
        category: appLocalizations.categorySustainability,
        partnerName: appLocalizations.partnerGreenFutureStore,
      ),
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const PromoBanner(),
        const SizedBox(height: 24),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemCount: _mockRewards.length,
          itemBuilder: (context, index) {
            final reward = _mockRewards[index];
            return RewardCard(
              reward: reward,
              onRedeem: () {
                // Show redemption confirmation dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(appLocalizations.redeemReward),
                    content: Text(appLocalizations.deductPointsMessage(reward.requiredPoints)),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(appLocalizations.cancel),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Implement reward redemption
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(appLocalizations.successfullyRedeemedMessage(reward.title)),
                              backgroundColor: AppColors.success,
                            ),
                          );
                        },
                        child: Text(appLocalizations.confirm),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
} 