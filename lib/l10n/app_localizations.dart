import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'GreeAlex'**
  String get appTitle;

  /// No description provided for @welcomeSlogan.
  ///
  /// In en, this message translates to:
  /// **'Earn points. Help the planet.'**
  String get welcomeSlogan;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @inPartnershipWith.
  ///
  /// In en, this message translates to:
  /// **'In partnership with'**
  String get inPartnershipWith;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back,'**
  String get welcomeBack;

  /// No description provided for @suggestedEcoActions.
  ///
  /// In en, this message translates to:
  /// **'Suggested Eco Actions'**
  String get suggestedEcoActions;

  /// No description provided for @ourPartners.
  ///
  /// In en, this message translates to:
  /// **'Our Partners'**
  String get ourPartners;

  /// No description provided for @featureNotAvailableOnWeb.
  ///
  /// In en, this message translates to:
  /// **'This feature is not available on the web version.'**
  String get featureNotAvailableOnWeb;

  /// No description provided for @scannedCode.
  ///
  /// In en, this message translates to:
  /// **'Scanned Code'**
  String get scannedCode;

  /// No description provided for @scanQRCode.
  ///
  /// In en, this message translates to:
  /// **'Scan QR Code'**
  String get scanQRCode;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @plantTreeTitle.
  ///
  /// In en, this message translates to:
  /// **'Plant a Tree'**
  String get plantTreeTitle;

  /// No description provided for @plantTreeDescription.
  ///
  /// In en, this message translates to:
  /// **'Plant and care for a new tree'**
  String get plantTreeDescription;

  /// No description provided for @gardeningCategory.
  ///
  /// In en, this message translates to:
  /// **'Gardening'**
  String get gardeningCategory;

  /// No description provided for @reduceEnergyTitle.
  ///
  /// In en, this message translates to:
  /// **'Reduce Energy Consumption'**
  String get reduceEnergyTitle;

  /// No description provided for @reduceEnergyDescription.
  ///
  /// In en, this message translates to:
  /// **'Lower your electricity bill by 10%'**
  String get reduceEnergyDescription;

  /// No description provided for @energyCategory.
  ///
  /// In en, this message translates to:
  /// **'Energy'**
  String get energyCategory;

  /// No description provided for @beachCleanupTitle.
  ///
  /// In en, this message translates to:
  /// **'Beach Cleanup Day'**
  String get beachCleanupTitle;

  /// No description provided for @beachCleanupDescription.
  ///
  /// In en, this message translates to:
  /// **'Join us in cleaning Alexandria\'s beaches'**
  String get beachCleanupDescription;

  /// No description provided for @treePlantingTitle.
  ///
  /// In en, this message translates to:
  /// **'Tree Planting Initiative'**
  String get treePlantingTitle;

  /// No description provided for @treePlantingDescription.
  ///
  /// In en, this message translates to:
  /// **'Help us make Alexandria greener'**
  String get treePlantingDescription;

  /// No description provided for @leaderboardAndRewards.
  ///
  /// In en, this message translates to:
  /// **'Leaderboard & Rewards'**
  String get leaderboardAndRewards;

  /// No description provided for @leaderboard.
  ///
  /// In en, this message translates to:
  /// **'Leaderboard'**
  String get leaderboard;

  /// No description provided for @rewards.
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get rewards;

  /// No description provided for @topContributors.
  ///
  /// In en, this message translates to:
  /// **'Top Contributors'**
  String get topContributors;

  /// No description provided for @climbTheRanks.
  ///
  /// In en, this message translates to:
  /// **'Keep going green to climb the ranks!'**
  String get climbTheRanks;

  /// No description provided for @filterByCategory.
  ///
  /// In en, this message translates to:
  /// **'Filter by category:'**
  String get filterByCategory;

  /// No description provided for @noRewardsInCategory.
  ///
  /// In en, this message translates to:
  /// **'No rewards available in this category.'**
  String get noRewardsInCategory;

  /// No description provided for @redeemReward.
  ///
  /// In en, this message translates to:
  /// **'Redeem Reward'**
  String get redeemReward;

  /// No description provided for @confirmRedeemMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to redeem this reward?'**
  String get confirmRedeemMessage;

  /// Message shown when redeeming a reward, indicating point deduction.
  ///
  /// In en, this message translates to:
  /// **'This will deduct {points} points from your balance.'**
  String deductPointsMessage(int points);

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// Success message after redeeming a reward.
  ///
  /// In en, this message translates to:
  /// **'Successfully redeemed {rewardTitle}!'**
  String successfullyRedeemedMessage(String rewardTitle);

  /// No description provided for @categoryAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get categoryAll;

  /// No description provided for @categoryBanking.
  ///
  /// In en, this message translates to:
  /// **'Banking'**
  String get categoryBanking;

  /// No description provided for @categorySustainability.
  ///
  /// In en, this message translates to:
  /// **'Sustainability'**
  String get categorySustainability;

  /// No description provided for @categoryLifestyle.
  ///
  /// In en, this message translates to:
  /// **'Lifestyle'**
  String get categoryLifestyle;

  /// No description provided for @categoryShopping.
  ///
  /// In en, this message translates to:
  /// **'Shopping'**
  String get categoryShopping;

  /// No description provided for @rewardSavingsBonusTitle.
  ///
  /// In en, this message translates to:
  /// **'AlexBank Savings Bonus'**
  String get rewardSavingsBonusTitle;

  /// No description provided for @rewardSavingsBonusDescription.
  ///
  /// In en, this message translates to:
  /// **'Get 0.5% extra interest on your savings account for 3 months'**
  String get rewardSavingsBonusDescription;

  /// No description provided for @rewardFeeWaiverTitle.
  ///
  /// In en, this message translates to:
  /// **'Credit Card Fee Waiver'**
  String get rewardFeeWaiverTitle;

  /// No description provided for @rewardFeeWaiverDescription.
  ///
  /// In en, this message translates to:
  /// **'Free annual fee on your AlexBank credit card'**
  String get rewardFeeWaiverDescription;

  /// No description provided for @rewardPlantTreeTitle.
  ///
  /// In en, this message translates to:
  /// **'Plant a Tree'**
  String get rewardPlantTreeTitle;

  /// No description provided for @rewardPlantTreeDescription.
  ///
  /// In en, this message translates to:
  /// **'We\'ll plant a tree in your name in Alexandria'**
  String get rewardPlantTreeDescription;

  /// No description provided for @partnerAlexBankGreenInitiative.
  ///
  /// In en, this message translates to:
  /// **'AlexBank Green Initiative'**
  String get partnerAlexBankGreenInitiative;

  /// No description provided for @rewardFreeCoffeeTitle.
  ///
  /// In en, this message translates to:
  /// **'Free Coffee'**
  String get rewardFreeCoffeeTitle;

  /// No description provided for @rewardFreeCoffeeDescription.
  ///
  /// In en, this message translates to:
  /// **'Get a free coffee at partner cafes'**
  String get rewardFreeCoffeeDescription;

  /// No description provided for @partnerLocalCoffee.
  ///
  /// In en, this message translates to:
  /// **'Local Coffee Partners'**
  String get partnerLocalCoffee;

  /// No description provided for @rewardInvestmentConsultationTitle.
  ///
  /// In en, this message translates to:
  /// **'Investment Consultation'**
  String get rewardInvestmentConsultationTitle;

  /// No description provided for @rewardInvestmentConsultationDescription.
  ///
  /// In en, this message translates to:
  /// **'Free 30-minute session with an AlexBank financial advisor'**
  String get rewardInvestmentConsultationDescription;

  /// No description provided for @rewardShoppingVoucherTitle.
  ///
  /// In en, this message translates to:
  /// **'Shopping Voucher'**
  String get rewardShoppingVoucherTitle;

  /// No description provided for @rewardShoppingVoucherDescription.
  ///
  /// In en, this message translates to:
  /// **'EGP 100 voucher for eco-friendly products'**
  String get rewardShoppingVoucherDescription;

  /// No description provided for @partnerGreenShopping.
  ///
  /// In en, this message translates to:
  /// **'Green Shopping Partners'**
  String get partnerGreenShopping;

  /// No description provided for @rewardLoanDiscountTitle.
  ///
  /// In en, this message translates to:
  /// **'Loan Rate Discount'**
  String get rewardLoanDiscountTitle;

  /// No description provided for @rewardLoanDiscountDescription.
  ///
  /// In en, this message translates to:
  /// **'0.25% discount on your next personal loan rate'**
  String get rewardLoanDiscountDescription;

  /// No description provided for @partnerAlexBank.
  ///
  /// In en, this message translates to:
  /// **'AlexBank'**
  String get partnerAlexBank;

  /// No description provided for @rewardCashbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Cashback on Transactions'**
  String get rewardCashbackTitle;

  /// No description provided for @rewardCashbackDescription.
  ///
  /// In en, this message translates to:
  /// **'Get 5% cashback on all transactions made with your AlexBank card for a week.'**
  String get rewardCashbackDescription;

  /// No description provided for @rewardEcoDiscountTitle.
  ///
  /// In en, this message translates to:
  /// **'Eco-Friendly Product Discount'**
  String get rewardEcoDiscountTitle;

  /// No description provided for @rewardEcoDiscountDescription.
  ///
  /// In en, this message translates to:
  /// **'Get a 20% discount on a selection of eco-friendly products.'**
  String get rewardEcoDiscountDescription;

  /// No description provided for @partnerGreenFutureStore.
  ///
  /// In en, this message translates to:
  /// **'Green Future Store'**
  String get partnerGreenFutureStore;

  /// No description provided for @rewardsPromoTitle.
  ///
  /// In en, this message translates to:
  /// **'AlexBank & Green Future'**
  String get rewardsPromoTitle;

  /// No description provided for @rewardsPromoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Earn exclusive rewards for your sustainable actions and banking with AlexBank.'**
  String get rewardsPromoSubtitle;

  /// No description provided for @partnersTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Partners'**
  String get partnersTitle;

  /// No description provided for @partnerBanlasticName.
  ///
  /// In en, this message translates to:
  /// **'Banlastic Egypt'**
  String get partnerBanlasticName;

  /// No description provided for @partnerBanlasticDescription.
  ///
  /// In en, this message translates to:
  /// **'An Egyptian initiative specialized in eliminating single-use plastic and organizing environmental events.'**
  String get partnerBanlasticDescription;

  /// No description provided for @partnerBanlasticActivity1.
  ///
  /// In en, this message translates to:
  /// **'Beach cleanups'**
  String get partnerBanlasticActivity1;

  /// No description provided for @partnerBanlasticActivity2.
  ///
  /// In en, this message translates to:
  /// **'Environmental awareness workshops'**
  String get partnerBanlasticActivity2;

  /// No description provided for @partnerBanlasticActivity3.
  ///
  /// In en, this message translates to:
  /// **'Anti-plastic campaigns'**
  String get partnerBanlasticActivity3;

  /// No description provided for @partnerBanlasticPartnership.
  ///
  /// In en, this message translates to:
  /// **'We agreed that any volunteer participating in their events can scan a QR Code and get points on the app.'**
  String get partnerBanlasticPartnership;

  /// No description provided for @partnerGreenishName.
  ///
  /// In en, this message translates to:
  /// **'Greenish'**
  String get partnerGreenishName;

  /// No description provided for @partnerGreenishDescription.
  ///
  /// In en, this message translates to:
  /// **'A youth initiative focused on environmental education and working with university students in Egypt.'**
  String get partnerGreenishDescription;

  /// No description provided for @partnerGreenishActivity1.
  ///
  /// In en, this message translates to:
  /// **'Environmental education'**
  String get partnerGreenishActivity1;

  /// No description provided for @partnerGreenishActivity2.
  ///
  /// In en, this message translates to:
  /// **'Student projects'**
  String get partnerGreenishActivity2;

  /// No description provided for @partnerGreenishActivity3.
  ///
  /// In en, this message translates to:
  /// **'Workshops'**
  String get partnerGreenishActivity3;

  /// No description provided for @partnerGreenishPartnership.
  ///
  /// In en, this message translates to:
  /// **'We agreed they would nominate youth events to link with the app, giving volunteers points for their participation.'**
  String get partnerGreenishPartnership;

  /// No description provided for @partnerVeryNileName.
  ///
  /// In en, this message translates to:
  /// **'VeryNile'**
  String get partnerVeryNileName;

  /// No description provided for @partnerVeryNileDescription.
  ///
  /// In en, this message translates to:
  /// **'A leading initiative to clean the Nile River from plastic and organize volunteer events.'**
  String get partnerVeryNileDescription;

  /// No description provided for @partnerVeryNileActivity1.
  ///
  /// In en, this message translates to:
  /// **'Nile cleanups'**
  String get partnerVeryNileActivity1;

  /// No description provided for @partnerVeryNileActivity2.
  ///
  /// In en, this message translates to:
  /// **'Recycling'**
  String get partnerVeryNileActivity2;

  /// No description provided for @partnerVeryNileActivity3.
  ///
  /// In en, this message translates to:
  /// **'Environmental awareness'**
  String get partnerVeryNileActivity3;

  /// No description provided for @partnerVeryNilePartnership.
  ///
  /// In en, this message translates to:
  /// **'We partnered with them so anyone participating in Nile cleanup days can enter a code on GreeAlex and get points.'**
  String get partnerVeryNilePartnership;

  /// No description provided for @partnerYLEName.
  ///
  /// In en, this message translates to:
  /// **'Youth Loves Egypt'**
  String get partnerYLEName;

  /// No description provided for @partnerYLEDescription.
  ///
  /// In en, this message translates to:
  /// **'An Egyptian association aiming to achieve sustainable development and organizing environmental volunteer events.'**
  String get partnerYLEDescription;

  /// No description provided for @partnerYLEActivity1.
  ///
  /// In en, this message translates to:
  /// **'Sustainable development'**
  String get partnerYLEActivity1;

  /// No description provided for @partnerYLEActivity2.
  ///
  /// In en, this message translates to:
  /// **'Volunteer work'**
  String get partnerYLEActivity2;

  /// No description provided for @partnerYLEActivity3.
  ///
  /// In en, this message translates to:
  /// **'Environmental initiatives'**
  String get partnerYLEActivity3;

  /// No description provided for @partnerYLEPartnership.
  ///
  /// In en, this message translates to:
  /// **'We agreed they would announce events on the app, and anyone who participates can add a QR from the location and get points.'**
  String get partnerYLEPartnership;

  /// No description provided for @partnerBekiaName.
  ///
  /// In en, this message translates to:
  /// **'Bekia'**
  String get partnerBekiaName;

  /// No description provided for @partnerBekiaDescription.
  ///
  /// In en, this message translates to:
  /// **'An Egyptian company specializing in waste recycling and exchanging it for points or rewards.'**
  String get partnerBekiaDescription;

  /// No description provided for @partnerBekiaActivity1.
  ///
  /// In en, this message translates to:
  /// **'Waste recycling'**
  String get partnerBekiaActivity1;

  /// No description provided for @partnerBekiaActivity2.
  ///
  /// In en, this message translates to:
  /// **'Exchanging waste for points'**
  String get partnerBekiaActivity2;

  /// No description provided for @partnerBekiaActivity3.
  ///
  /// In en, this message translates to:
  /// **'Environmental awareness'**
  String get partnerBekiaActivity3;

  /// No description provided for @partnerBekiaPartnership.
  ///
  /// In en, this message translates to:
  /// **'We collaborated with them to let users link their Bekia account with GreeAlex and get points for recycling.'**
  String get partnerBekiaPartnership;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @myVolunteeringHistory.
  ///
  /// In en, this message translates to:
  /// **'My Volunteering History'**
  String get myVolunteeringHistory;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @ecoChampion.
  ///
  /// In en, this message translates to:
  /// **'Eco Champion'**
  String get ecoChampion;

  /// No description provided for @ecoHero.
  ///
  /// In en, this message translates to:
  /// **'Eco Hero'**
  String get ecoHero;

  /// No description provided for @ecoStarter.
  ///
  /// In en, this message translates to:
  /// **'Eco Starter'**
  String get ecoStarter;

  /// No description provided for @ecoNewbie.
  ///
  /// In en, this message translates to:
  /// **'Eco Newbie'**
  String get ecoNewbie;

  /// No description provided for @historyBeachCleanupTitle.
  ///
  /// In en, this message translates to:
  /// **'Beach Cleanup Day'**
  String get historyBeachCleanupTitle;

  /// No description provided for @historyFoodDonationTitle.
  ///
  /// In en, this message translates to:
  /// **'Food Donation Drive'**
  String get historyFoodDonationTitle;

  /// No description provided for @locationMontazaBeach.
  ///
  /// In en, this message translates to:
  /// **'Montaza Beach'**
  String get locationMontazaBeach;

  /// No description provided for @locationSanStefano.
  ///
  /// In en, this message translates to:
  /// **'San Stefano'**
  String get locationSanStefano;

  /// Shows the number of current participants out of the maximum allowed
  ///
  /// In en, this message translates to:
  /// **'{count}/{max} participants'**
  String participantsCount(Object count, Object max);

  /// Abbreviation for Green Points, shown next to the point value.
  ///
  /// In en, this message translates to:
  /// **'{points} GP'**
  String greenPointsAbbreviation(Object points);

  /// No description provided for @historyRecyclingWorkshopTitle.
  ///
  /// In en, this message translates to:
  /// **'Recycling Workshop'**
  String get historyRecyclingWorkshopTitle;

  /// No description provided for @historyTreePlantingTitle.
  ///
  /// In en, this message translates to:
  /// **'Tree Planting Initiative'**
  String get historyTreePlantingTitle;

  /// No description provided for @volunteeringOpportunities.
  ///
  /// In en, this message translates to:
  /// **'Volunteering Opportunities'**
  String get volunteeringOpportunities;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @chatbotTitle.
  ///
  /// In en, this message translates to:
  /// **'GreenAlex Bot'**
  String get chatbotTitle;

  /// No description provided for @chatbotSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sustainability Assistant'**
  String get chatbotSubtitle;

  /// No description provided for @chatbotWelcome.
  ///
  /// In en, this message translates to:
  /// **'Hello! I\'m GreenAlex Bot, your sustainable assistant for Alexandria! I can help you with eco-friendly actions, AlexBank services, and earning Green Points. What can I help you with today?'**
  String get chatbotWelcome;

  /// No description provided for @chatbotTooltip.
  ///
  /// In en, this message translates to:
  /// **'Ask me about sustainability!'**
  String get chatbotTooltip;

  /// No description provided for @chatInputPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Ask about sustainability, banking, points...'**
  String get chatInputPlaceholder;

  /// No description provided for @clearChat.
  ///
  /// In en, this message translates to:
  /// **'Clear Chat'**
  String get clearChat;

  /// No description provided for @clearChatConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear all messages?'**
  String get clearChatConfirm;

  /// No description provided for @chatHelp.
  ///
  /// In en, this message translates to:
  /// **'How can I help you?'**
  String get chatHelp;

  /// No description provided for @chatHelpSustainability.
  ///
  /// In en, this message translates to:
  /// **'Sustainability Tips'**
  String get chatHelpSustainability;

  /// No description provided for @chatHelpSustainabilityDesc.
  ///
  /// In en, this message translates to:
  /// **'Get eco-friendly actions and tips for Alexandria'**
  String get chatHelpSustainabilityDesc;

  /// No description provided for @chatHelpBanking.
  ///
  /// In en, this message translates to:
  /// **'AlexBank Services'**
  String get chatHelpBanking;

  /// No description provided for @chatHelpBankingDesc.
  ///
  /// In en, this message translates to:
  /// **'Learn about green banking and sustainable finance'**
  String get chatHelpBankingDesc;

  /// No description provided for @chatHelpPoints.
  ///
  /// In en, this message translates to:
  /// **'Green Points'**
  String get chatHelpPoints;

  /// No description provided for @chatHelpPointsDesc.
  ///
  /// In en, this message translates to:
  /// **'Discover ways to earn and redeem points'**
  String get chatHelpPointsDesc;

  /// No description provided for @chatHelpEvents.
  ///
  /// In en, this message translates to:
  /// **'Events & Volunteering'**
  String get chatHelpEvents;

  /// No description provided for @chatHelpEventsDesc.
  ///
  /// In en, this message translates to:
  /// **'Find volunteer opportunities and events'**
  String get chatHelpEventsDesc;

  /// No description provided for @chatHelpFooter.
  ///
  /// In en, this message translates to:
  /// **'Just type your question naturally, and I\'ll help you out!'**
  String get chatHelpFooter;

  /// No description provided for @startConversation.
  ///
  /// In en, this message translates to:
  /// **'Start a conversation'**
  String get startConversation;

  /// No description provided for @startConversationDesc.
  ///
  /// In en, this message translates to:
  /// **'Ask me about sustainability, AlexBank services,\nor how to earn Green Points!'**
  String get startConversationDesc;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @recyclePlasticBottlesTitle.
  ///
  /// In en, this message translates to:
  /// **'Recycle Plastic Bottles'**
  String get recyclePlasticBottlesTitle;

  /// No description provided for @recyclePlasticBottlesDescription.
  ///
  /// In en, this message translates to:
  /// **'Collect and recycle 10 plastic bottles'**
  String get recyclePlasticBottlesDescription;

  /// No description provided for @recycingCategory.
  ///
  /// In en, this message translates to:
  /// **'Recycling'**
  String get recycingCategory;

  /// No description provided for @publicTransportTitle.
  ///
  /// In en, this message translates to:
  /// **'Use Public Transport'**
  String get publicTransportTitle;

  /// No description provided for @publicTransportDescription.
  ///
  /// In en, this message translates to:
  /// **'Use public transport for a week'**
  String get publicTransportDescription;

  /// No description provided for @transportCategory.
  ///
  /// In en, this message translates to:
  /// **'Transport'**
  String get transportCategory;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
