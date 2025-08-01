import 'dart:math';
import 'package:flutter/material.dart' hide Intent;
import '../../../../l10n/app_localizations.dart';
import '../models/chat_message.dart';
import '../models/intent.dart';

class ChatbotKnowledgeBase {
  static List<Intent> getIntents(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final random = Random();

    // A list of sustainability tips
    final sustainabilityTips = [
      SustainabilityTip(
        title: appLocalizations.sustainabilityTip1Title,
        description: appLocalizations.sustainabilityTip1Desc,
        potentialPoints: 50,
        category: 'Recycling',
        icon: 'assets/icons/recycle.svg',
        actionType: 'recycle_bottles',
      ),
      SustainabilityTip(
        title: appLocalizations.sustainabilityTip2Title,
        description: appLocalizations.sustainabilityTip2Desc,
        potentialPoints: 150,
        category: 'Energy',
        icon: 'assets/icons/energy.svg',
        actionType: 'conserve_energy',
      ),
      SustainabilityTip(
        title: appLocalizations.sustainabilityTip3Title,
        description: appLocalizations.sustainabilityTip3Desc,
        potentialPoints: 75,
        category: 'Water',
        icon: 'assets/icons/water.svg',
        actionType: 'save_water',
      ),
    ];

    // Lists of varied responses for some intents
    final greetings = [
      appLocalizations.chatbotGreeting,
      appLocalizations.chatbotGreeting2,
      appLocalizations.chatbotGreeting3,
    ];

    final thanksResponses = [
      appLocalizations.thankYouResponse1,
      appLocalizations.thankYouResponse2,
    ];

    final farewells = [
      appLocalizations.farewellResponse1,
      appLocalizations.farewellResponse2,
    ];

    final botIdentities = [
      appLocalizations.botIdentityResponse1,
      appLocalizations.botIdentityResponse2,
    ];

    return [
      // Sustainability Intent
      Intent(
        id: 'sustainability',
        keywords: [
          'recycle', 'recycling', 'sustainable', 'environment', 'green', 'eco', 'climate', 'pollution', 'plastic', 'water', 'energy', 'tips',
          'إعادة تدوير', 'استدامة', 'بيئة', 'تلوث', 'مناخ', 'بلاستيك', 'طاقة', 'مياه', 'نصائح بيئية', 'نصيحة'
        ],
        responseBuilder: (context, timestamp) {
          return ChatMessage(
            id: timestamp.millisecondsSinceEpoch.toString(),
            content: appLocalizations.sustainabilityResponse,
            sender: MessageSender.bot,
            type: MessageType.bot,
            timestamp: timestamp,
            sustainabilityTip: sustainabilityTips[random.nextInt(sustainabilityTips.length)],
          );
        },
      ),

      // Banking Intent
      Intent(
        id: 'banking',
        keywords: [
          'bank', 'banking', 'account', 'loan', 'credit', 'saving', 'money', 'alex bank', 'alexbank', 'atm', 'branch', 'card',
          'بنك', 'حساب', 'قرض', 'ائتمان', 'توفير', 'فلوس', 'بنك اسكندرية', 'فرع', 'ماكينة صراف آلي', 'بطاقة'
        ],
        responseBuilder: (context, timestamp) {
          return ChatMessage(
            id: timestamp.millisecondsSinceEpoch.toString(),
            content: appLocalizations.bankingInfoResponse,
            sender: MessageSender.bot,
            type: MessageType.bot,
            timestamp: timestamp,
            bankingInfo: BankingInfo(
              title: appLocalizations.bankingInfoTitle,
              description: appLocalizations.bankingInfoDesc,
              actionText: 'apply_green_loan',
            ),
          );
        },
      ),

      // Points Intent
      Intent(
        id: 'points',
        keywords: [
          'points', 'reward', 'earn', 'redeem', 'green points', 'gp', 'balance', 'how to get points', 'my points',
          'نقط', 'نقاط', 'مكافأة', 'كسب', 'استبدال', 'رصيد', 'ازاي اكسب نقاط', 'نقاطي'
        ],
        responseBuilder: (context, timestamp) {
          return ChatMessage(
            id: timestamp.millisecondsSinceEpoch.toString(),
            content: appLocalizations.pointsAndRewardsResponse,
            sender: MessageSender.bot,
            type: MessageType.bot,
            timestamp: timestamp,
            quickActions: [
              QuickAction(id: 'check_balance', title: appLocalizations.quickActionCheckBalance, icon: '💰', onTap: () {}),
              QuickAction(id: 'view_rewards', title: appLocalizations.quickActionViewRewards, icon: '🎁', onTap: () {}),
            ],
          );
        },
      ),

      // Volunteering Intent
      Intent(
        id: 'volunteering',
        keywords: [
          'volunteer', 'volunteering', 'event', 'beach cleanup', 'tree planting', 'community', 'join',
          'تطوع', 'حدث', 'تنظيف شاطئ', 'زراعة أشجار', 'خدمة مجتمع', 'انضم'
        ],
        responseBuilder: (context, timestamp) {
          return ChatMessage(
            id: timestamp.millisecondsSinceEpoch.toString(),
            content: appLocalizations.volunteerResponse,
            sender: MessageSender.bot,
            type: MessageType.bot,
            timestamp: timestamp,
            quickActions: [
              QuickAction(id: 'beach_cleanup', title: appLocalizations.quickActionBeachCleanup, icon: '🌊', onTap: () {}),
              QuickAction(id: 'tree_planting', title: appLocalizations.quickActionTreePlanting, icon: '🌳', onTap: () {}),
            ],
          );
        },
      ),

      // Greeting Intent
      Intent(
        id: 'greeting',
        keywords: [
          'hello', 'hi', 'hey', 'greetings', 'good morning', 'good afternoon', 'good evening', 'how are you', 'whats up',
          'أهلاً', 'مرحباً', 'السلام عليكم', 'صباح الخير', 'مساء الخير', 'ازيك', 'عامل ايه', 'اخبارك'
        ],
        responseBuilder: (context, timestamp) {
          return ChatMessage(
            id: timestamp.millisecondsSinceEpoch.toString(),
            content: greetings[random.nextInt(greetings.length)],
            sender: MessageSender.bot,
            type: MessageType.bot,
            timestamp: timestamp,
            quickActions: [
              QuickAction(id: 'eco_actions', title: appLocalizations.chatHelpSustainability, icon: '🌿', onTap: () {}),
              QuickAction(id: 'volunteer_events', title: appLocalizations.chatHelpEvents, icon: '📅', onTap: () {}),
              QuickAction(id: 'alexbank_services', title: appLocalizations.chatHelpBanking, icon: '🏦', onTap: () {}),
            ],
          );
        },
      ),

      // Thanks Intent
      Intent(
        id: 'thanks',
        keywords: ['thanks', 'thank you', 'ok thanks', 'cool', 'awesome', 'شكراً', 'متشكر', 'تمام شكرا', 'حلو'],
        responseBuilder: (context, timestamp) {
          return ChatMessage(
            id: timestamp.millisecondsSinceEpoch.toString(),
            content: thanksResponses[random.nextInt(thanksResponses.length)],
            sender: MessageSender.bot,
            type: MessageType.bot,
            timestamp: timestamp,
          );
        },
      ),

      // Farewell Intent
      Intent(
        id: 'farewell',
        keywords: ['bye', 'goodbye', 'see you', 'later', 'باي', 'مع السلامة', 'أشوفك بعدين'],
        responseBuilder: (context, timestamp) {
          return ChatMessage(
            id: timestamp.millisecondsSinceEpoch.toString(),
            content: farewells[random.nextInt(farewells.length)],
            sender: MessageSender.bot,
            type: MessageType.bot,
            timestamp: timestamp,
          );
        },
      ),

      // Bot Identity Intent
      Intent(
        id: 'bot_identity',
        keywords: ['who are you', 'what is your name', 'your name', 'من أنت', 'اسمك ايه', 'انت مين'],
        responseBuilder: (context, timestamp) {
          return ChatMessage(
            id: timestamp.millisecondsSinceEpoch.toString(),
            content: botIdentities[random.nextInt(botIdentities.length)],
            sender: MessageSender.bot,
            type: MessageType.bot,
            timestamp: timestamp,
          );
        },
      ),
      
      // Help Intent
      Intent(
        id: 'help',
        keywords: [
          'help', 'assist', 'support', 'what can you do', 'i need help', 'can you help me', 'info',
          'مساعدة', 'دعم', 'ماذا تفعل', 'محتاج مساعدة', 'ممكن تساعدني', 'معلومات'
        ],
        responseBuilder: (context, timestamp) {
          return ChatMessage(
            id: timestamp.millisecondsSinceEpoch.toString(),
            content: appLocalizations.chatHelp,
            sender: MessageSender.bot,
            type: MessageType.bot,
            timestamp: timestamp,
            quickActions: [
              QuickAction(id: 'sustainability_tips', title: appLocalizations.quickActionEcoTips, icon: '🌿', onTap: () {}),
              QuickAction(id: 'banking_help', title: appLocalizations.quickActionBanking, icon: '🏦', onTap: () {}),
              QuickAction(id: 'points_help', title: appLocalizations.quickActionPoints, icon: '⭐', onTap: () {}),
            ],
          );
        },
      ),

      // Gree Alex Intent
      Intent(
        id: 'gree_alex',
        keywords: [
          'gree alex', 'who is gree alex', 'what is this app', 'about the app', 'the app',
          'من هو جرين أليكس', 'ما هذا التطبيق', 'عن التطبيق', 'التطبيق'
        ],
        responseBuilder: (context, timestamp) {
          return ChatMessage(
            id: timestamp.millisecondsSinceEpoch.toString(),
            content: appLocalizations.greeAlexDefinition,
            sender: MessageSender.bot,
            type: MessageType.bot,
            timestamp: timestamp,
          );
        },
      ),

      // Partners Intent
      Intent(
        id: 'partners',
        keywords: [
          'partner', 'partners', 'who are the partners', 'sponsors',
          'شريك', 'شركاء', 'من هم الشركاء', 'الرعاة'
        ],
        responseBuilder: (context, timestamp) {
          return ChatMessage(
            id: timestamp.millisecondsSinceEpoch.toString(),
            content: appLocalizations.partnersResponse,
            sender: MessageSender.bot,
            type: MessageType.bot,
            timestamp: timestamp,
          );
        },
      ),

      // Default Fallback Intent
      Intent(
        id: 'default',
        keywords: [], // No keywords, matched by default
        responseBuilder: (context, timestamp) {
          return ChatMessage(
            id: timestamp.millisecondsSinceEpoch.toString(),
            content: appLocalizations.chatbotDefaultResponse,
            sender: MessageSender.bot,
            type: MessageType.bot,
            timestamp: timestamp,
            quickActions: [
              QuickAction(id: 'help_topics', title: appLocalizations.quickActionHelpTopics, icon: '❓', onTap: () {}),
              QuickAction(id: 'popular_questions', title: appLocalizations.quickActionPopularQuestions, icon: '💬', onTap: () {}),
            ],
          );
        },
      ),
    ];
  }
}
