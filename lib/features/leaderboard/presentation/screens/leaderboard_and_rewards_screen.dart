import 'package:flutter/material.dart';
import 'package:gree_alex/l10n/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';
import '../../../rewards/domain/models/reward.dart';
import '../../../rewards/presentation/widgets/promo_banner.dart';
import '../../../rewards/presentation/widgets/reward_card.dart';
import '../../domain/models/leaderboard_user.dart';
import '../widgets/leaderboard_tile.dart';

class LeaderboardAndRewardsScreen extends StatefulWidget {
  const LeaderboardAndRewardsScreen({super.key});

  @override
  State<LeaderboardAndRewardsScreen> createState() => _LeaderboardAndRewardsScreenState();
}

class _LeaderboardAndRewardsScreenState extends State<LeaderboardAndRewardsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedCategory = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_selectedCategory.isEmpty) {
      setState(() {
        _selectedCategory = AppLocalizations.of(context)!.categoryAll;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    final List<String> categories = [
      appLocalizations.categoryAll,
      appLocalizations.categoryBanking,
      appLocalizations.categorySustainability,
      appLocalizations.categoryLifestyle,
      appLocalizations.categoryShopping
    ];

    final List<Reward> mockRewards = [
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
        category: appLocalizations.categoryShopping,
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

    final List<Reward> filteredRewards = _selectedCategory == appLocalizations.categoryAll
        ? mockRewards
        : mockRewards.where((reward) => reward.category == _selectedCategory).toList();

    final List<LeaderboardUser> mockLeaderboardUsers = [
      LeaderboardUser(
        id: '1',
        name: 'Fady',
        avatarUrl: '', // Using placeholder
        points: 1250,
        rank: 1,
      ),
      LeaderboardUser(
        id: '2',
        name: 'Ahmed',
        avatarUrl: '', // Using placeholder
        points: 1100,
        rank: 2,
      ),
      LeaderboardUser(
        id: '3',
        name: 'Youssef',
        avatarUrl: '', // Using placeholder
        points: 980,
        rank: 3,
      ),
      LeaderboardUser(
        id: '4',
        name: 'Salma',
        avatarUrl: '', // Using placeholder
        points: 850,
        rank: 4,
      ),
    ];


    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          appLocalizations.leaderboardAndRewards,
          style: AppTypography.h3.copyWith(color: AppColors.grey900),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.grey200),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.grey500,
              indicatorColor: AppColors.primary,
              indicatorWeight: 3,
              labelStyle: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600),
              tabs: [
                Tab(
                  icon: const Icon(Icons.leaderboard_outlined),
                  text: appLocalizations.leaderboard,
                ),
                Tab(
                  icon: const Icon(Icons.card_giftcard_outlined),
                  text: appLocalizations.rewards,
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildLeaderboardTab(appLocalizations, mockLeaderboardUsers),
          _buildRewardsTab(appLocalizations, mockRewards, categories),
        ],
      ),
    );
  }

  Widget _buildLeaderboardTab(AppLocalizations appLocalizations, List<LeaderboardUser> mockLeaderboardUsers) {
    final appLocalizations = AppLocalizations.of(context)!;
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: mockLeaderboardUsers.length + 1, // +1 for the header
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey200.withOpacity(0.5),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appLocalizations.topContributors,
                  style: AppTypography.h3.copyWith(color: AppColors.grey900),
                ),
                const SizedBox(height: 8),
                Text(
                  appLocalizations.climbTheRanks,
                  style: AppTypography.bodyMedium.copyWith(color: AppColors.grey500),
                ),
              ],
            ),
          );
        }
        return LeaderboardTile(user: mockLeaderboardUsers[index - 1]);
      },
    );
  }

  Widget _buildRewardsTab(AppLocalizations appLocalizations, List<Reward> mockRewards, List<String> categories) {
    final List<Reward> filteredRewards = _selectedCategory == appLocalizations.categoryAll
        ? mockRewards
        : mockRewards.where((reward) => reward.category == _selectedCategory).toList();

    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: PromoBanner(),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appLocalizations.filterByCategory,
                style: AppTypography.h3.copyWith(color: AppColors.grey900),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = _selectedCategory == category;
                    return ChoiceChip(
                      label: Text(category),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            _selectedCategory = category;
                          });
                        }
                      },
                      avatar: Icon(
                        _getIconForCategory(category, appLocalizations),
                        color: isSelected ? AppColors.primary : AppColors.grey500,
                        size: 20,
                      ),
                      labelPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      backgroundColor: AppColors.white,
                      selectedColor: AppColors.primary.withOpacity(0.1),
                      labelStyle: AppTypography.bodyMedium.copyWith(
                        color: isSelected ? AppColors.primary : AppColors.grey900,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: isSelected ? AppColors.primary : AppColors.grey300,
                          width: isSelected ? 1.5 : 1,
                        ),
                      ),
                      elevation: isSelected ? 2 : 0,
                      shadowColor: AppColors.primary.withOpacity(0.2),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        if (filteredRewards.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 48.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.card_giftcard_outlined,
                    size: 64,
                    color: AppColors.grey300,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    appLocalizations.noRewardsInCategory,
                    style: AppTypography.bodyLarge.copyWith(color: AppColors.grey500),
                  ),
                ],
              ),
            ),
          )
        else
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.65,
            ),
            itemCount: filteredRewards.length,
            itemBuilder: (context, index) {
              final reward = filteredRewards[index];
              return RewardCard(
                reward: reward,
                onRedeem: () => _showRedeemDialog(context, reward),
              );
            },
          ),
      ],
    );
  }

  IconData _getIconForCategory(String category, AppLocalizations localizations) {
    if (category == localizations.categoryAll) return Icons.all_inclusive_rounded;
    if (category == localizations.categoryBanking) return Icons.account_balance_wallet_rounded;
    if (category == localizations.categorySustainability) return Icons.eco_rounded;
    if (category == localizations.categoryLifestyle) return Icons.nightlife_rounded;
    if (category == localizations.categoryShopping) return Icons.shopping_bag_rounded;
    return Icons.category_rounded;
  }

  void _showRedeemDialog(BuildContext context, Reward reward) {
    final appLocalizations = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(appLocalizations.redeemReward),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appLocalizations.confirmRedeemMessage,
              style: AppTypography.bodyMedium.copyWith(color: AppColors.grey700),
            ),
            const SizedBox(height: 16),
            Text(
              appLocalizations.deductPointsMessage(reward.requiredPoints),
              style: AppTypography.bodySmall.copyWith(color: AppColors.grey500),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(appLocalizations.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const Icon(Icons.check_circle_outline, color: AppColors.white),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          appLocalizations.successfullyRedeemedMessage(reward.title),
                          style: AppTypography.bodyMedium.copyWith(color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: AppColors.success,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              );
            },
            child: Text(appLocalizations.confirm),
          ),
        ],
      ),
    );
  }
}