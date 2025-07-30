import 'package:flutter/material.dart';
import '../models/chat_message.dart';
import '../../../../l10n/app_localizations.dart';

class ChatbotService {
  static final ChatbotService _instance = ChatbotService._internal();
  factory ChatbotService() => _instance;
  ChatbotService._internal();

  final List<ChatMessage> _messages = [];
  final List<String> _conversationHistory = [];

  List<ChatMessage> get messages => List.unmodifiable(_messages);

  Future<ChatMessage> sendMessage(String userMessage, BuildContext context) async {
    // Add user message
    final userMsg = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: userMessage,
      sender: MessageSender.user,
      type: MessageType.user,
      timestamp: DateTime.now(),
    );
    _messages.add(userMsg);
    _conversationHistory.add('User: $userMessage');

    // Simulate typing
    final typingMsg = ChatMessage(
      id: 'typing_${DateTime.now().millisecondsSinceEpoch}',
      content: '...',
      sender: MessageSender.bot,
      type: MessageType.bot,
      timestamp: DateTime.now(),
      isTyping: true,
    );
    _messages.add(typingMsg);

    // Simulate response delay
    await Future.delayed(const Duration(milliseconds: 1500));

    // Remove typing indicator
    _messages.removeWhere((msg) => msg.isTyping);

    // Generate bot response
    final botResponse = await _generateResponse(userMessage, context);
    _messages.add(botResponse);
    _conversationHistory.add('Bot: ${botResponse.content}');

    return botResponse;
  }

  Future<ChatMessage> _generateResponse(String userMessage, BuildContext context) async {
    final lowerMessage = userMessage.toLowerCase();
    final now = DateTime.now();

    // Sustainability-related responses
    if (_containsAny(lowerMessage, ['recycle', 'recycling', 'sustainable', 'environment', 'green', 'eco'])) {
      return _createSustainabilityResponse(lowerMessage, now, context);
    }
    
    // Banking-related responses
    else if (_containsAny(lowerMessage, ['bank', 'banking', 'account', 'loan', 'credit', 'saving', 'money', 'alex bank', 'alexbank'])) {
      return _createBankingResponse(lowerMessage, now, context);
    }
    
    // Points and rewards
    else if (_containsAny(lowerMessage, ['points', 'reward', 'earn', 'redeem', 'green points', 'gp'])) {
      return _createPointsResponse(lowerMessage, now, context);
    }
    
    // Volunteering
    else if (_containsAny(lowerMessage, ['volunteer', 'volunteering', 'event', 'beach cleanup', 'tree planting'])) {
      return _createVolunteerResponse(lowerMessage, now, context);
    }
    
    // Greetings
    else if (_containsAny(lowerMessage, ['hello', 'hi', 'hey', 'greetings', 'good morning', 'good afternoon', 'good evening'])) {
      return _createGreetingResponse(now, context);
    }
    
    // Help
    else if (_containsAny(lowerMessage, ['help', 'assist', 'support', 'what can you do'])) {
      return _createHelpResponse(now, context);
    }
    
    // Default response
    else {
      return _createDefaultResponse(now, context);
    }
  }

  ChatMessage _createSustainabilityResponse(String message, DateTime timestamp, BuildContext context) {
    final tips = [
      SustainabilityTip(
        title: 'Plastic Bottle Recycling',
        description: 'Every plastic bottle you recycle prevents it from ending up in the Mediterranean Sea!',
        potentialPoints: 50,
        category: 'Recycling',
        icon: 'assets/icons/recycle.svg',
        actionType: 'recycle_bottles',
      ),
      SustainabilityTip(
        title: 'Energy Conservation',
        description: 'Reducing energy consumption by 10% can earn you points and help Alexandria\'s environment.',
        potentialPoints: 150,
        category: 'Energy',
        icon: 'assets/icons/reduce_energy.svg',
        actionType: 'reduce_energy',
      ),
      SustainabilityTip(
        title: 'Plant Trees in Alexandria',
        description: 'Join tree planting initiatives to make Alexandria greener and earn substantial rewards!',
        potentialPoints: 200,
        category: 'Gardening',
        icon: 'assets/icons/tree.svg',
        actionType: 'plant_tree',
      ),
    ];

    final randomTip = tips[DateTime.now().millisecond % tips.length];

    return ChatMessage(
      id: timestamp.millisecondsSinceEpoch.toString(),
      content: '🌱 Great question about sustainability! Here\'s something you can do in Alexandria:',
      sender: MessageSender.bot,
      type: MessageType.sustainabilityTip,
      timestamp: timestamp,
      sustainabilityTip: randomTip,
      quickActions: [
        QuickAction(
          id: 'more_eco_tips',
          title: 'More Eco Tips',
          icon: '🌿',
          onTap: () {},
        ),
        QuickAction(
          id: 'find_events',
          title: 'Find Events',
          icon: '📅',
          onTap: () {},
        ),
      ],
    );
  }

  ChatMessage _createBankingResponse(String message, DateTime timestamp, BuildContext context) {
    final bankingInfos = [
      BankingInfo(
        title: 'Green Banking with AlexBank',
        description: 'Open a Green Savings Account and earn 0.5% extra interest for sustainable choices!',
        actionText: 'Learn More',
        greenPoints: 500,
      ),
      BankingInfo(
        title: 'Eco-Friendly Credit Card',
        description: 'Get cashback on eco-friendly purchases with AlexBank\'s Green Credit Card.',
        actionText: 'Apply Now',
        greenPoints: 100,
      ),
      BankingInfo(
        title: 'Sustainable Investment',
        description: 'Invest in green bonds and sustainable projects through AlexBank\'s ESG portfolio.',
        actionText: 'Explore Options',
        greenPoints: 300,
      ),
    ];

    final randomInfo = bankingInfos[DateTime.now().millisecond % bankingInfos.length];

    return ChatMessage(
      id: timestamp.millisecondsSinceEpoch.toString(),
      content: '🏦 AlexBank offers amazing green banking solutions! Check this out:',
      sender: MessageSender.bot,
      type: MessageType.bankingInfo,
      timestamp: timestamp,
      bankingInfo: randomInfo,
      quickActions: [
        QuickAction(
          id: 'banking_services',
          title: 'All Services',
          icon: '🏦',
          onTap: () {},
        ),
        QuickAction(
          id: 'contact_bank',
          title: 'Contact Bank',
          icon: '📞',
          onTap: () {},
        ),
      ],
    );
  }

  ChatMessage _createPointsResponse(String message, DateTime timestamp, BuildContext context) {
    return ChatMessage(
      id: timestamp.millisecondsSinceEpoch.toString(),
      content: '⭐ You can earn Green Points by:\n\n🔄 Recycling plastic bottles (50 GP)\n🚌 Using public transport (100 GP)\n🌳 Planting trees (200 GP)\n🏖️ Beach cleanup events (500 GP)\n\nRedeem points for AlexBank rewards, coffee vouchers, and more!',
      sender: MessageSender.bot,
      type: MessageType.bot,
      timestamp: timestamp,
      quickActions: [
        QuickAction(
          id: 'view_rewards',
          title: 'View Rewards',
          icon: '🎁',
          onTap: () {},
        ),
        QuickAction(
          id: 'earn_points',
          title: 'Earn Points',
          icon: '⭐',
          onTap: () {},
        ),
      ],
    );
  }

  ChatMessage _createVolunteerResponse(String message, DateTime timestamp, BuildContext context) {
    return ChatMessage(
      id: timestamp.millisecondsSinceEpoch.toString(),
      content: '🤝 Exciting volunteer opportunities in Alexandria:\n\n🏖️ Beach Cleanup at Montaza Beach\n📅 This Saturday, 9 AM\n👥 45/50 participants\n⭐ Earn 500 GP\n\n🌳 Tree Planting at San Stefano\n📅 Next Sunday, 8 AM\n👥 28/40 participants\n⭐ Earn 400 GP',
      sender: MessageSender.bot,
      type: MessageType.bot,
      timestamp: timestamp,
      quickActions: [
        QuickAction(
          id: 'join_beach_cleanup',
          title: 'Join Beach Cleanup',
          icon: '🏖️',
          onTap: () {},
        ),
        QuickAction(
          id: 'join_tree_planting',
          title: 'Join Tree Planting',
          icon: '🌳',
          onTap: () {},
        ),
      ],
    );
  }

  ChatMessage _createGreetingResponse(DateTime timestamp, BuildContext context) {
    final greetings = [
      '👋 Hello! I\'m GreenAlex Bot, your sustainable assistant for Alexandria!',
      '🌱 Hi there! Ready to make Alexandria greener together?',
      '🌿 Welcome! How can I help you earn Green Points today?',
    ];

    return ChatMessage(
      id: timestamp.millisecondsSinceEpoch.toString(),
      content: greetings[DateTime.now().millisecond % greetings.length],
      sender: MessageSender.bot,
      type: MessageType.bot,
      timestamp: timestamp,
      quickActions: [
        QuickAction(
          id: 'eco_actions',
          title: 'Eco Actions',
          icon: '🌿',
          onTap: () {},
        ),
        QuickAction(
          id: 'volunteer_events',
          title: 'Events',
          icon: '📅',
          onTap: () {},
        ),
        QuickAction(
          id: 'alexbank_services',
          title: 'AlexBank',
          icon: '🏦',
          onTap: () {},
        ),
      ],
    );
  }

  ChatMessage _createHelpResponse(DateTime timestamp, BuildContext context) {
    return ChatMessage(
      id: timestamp.millisecondsSinceEpoch.toString(),
      content: '🤖 I can help you with:\n\n🌱 Sustainable actions and eco tips\n🏦 AlexBank green banking services\n⭐ Earning and redeeming Green Points\n📅 Finding volunteer events in Alexandria\n🎁 Exploring rewards and benefits\n\nJust ask me anything!',
      sender: MessageSender.bot,
      type: MessageType.bot,
      timestamp: timestamp,
      quickActions: [
        QuickAction(
          id: 'sustainability_tips',
          title: 'Eco Tips',
          icon: '🌿',
          onTap: () {},
        ),
        QuickAction(
          id: 'banking_help',
          title: 'Banking',
          icon: '🏦',
          onTap: () {},
        ),
        QuickAction(
          id: 'points_help',
          title: 'Points',
          icon: '⭐',
          onTap: () {},
        ),
      ],
    );
  }

  ChatMessage _createDefaultResponse(DateTime timestamp, BuildContext context) {
    return ChatMessage(
      id: timestamp.millisecondsSinceEpoch.toString(),
      content: '🤔 I\'m still learning! I can help you with sustainability, AlexBank services, Green Points, and volunteer events in Alexandria. What would you like to know?',
      sender: MessageSender.bot,
      type: MessageType.bot,
      timestamp: timestamp,
      quickActions: [
        QuickAction(
          id: 'help_topics',
          title: 'Help Topics',
          icon: '❓',
          onTap: () {},
        ),
        QuickAction(
          id: 'popular_questions',
          title: 'Popular Questions',
          icon: '💬',
          onTap: () {},
        ),
      ],
    );
  }

  bool _containsAny(String text, List<String> keywords) {
    return keywords.any((keyword) => text.contains(keyword));
  }

  void clearMessages() {
    _messages.clear();
    _conversationHistory.clear();
  }

  void addWelcomeMessage(BuildContext context) {
    if (_messages.isEmpty) {
      final appLocalizations = AppLocalizations.of(context)!;
      final welcomeMsg = ChatMessage(
        id: 'welcome_${DateTime.now().millisecondsSinceEpoch}',
        content: appLocalizations.chatbotWelcome,
        sender: MessageSender.bot,
        type: MessageType.bot,
        timestamp: DateTime.now(),
        quickActions: [
          QuickAction(
            id: 'eco_actions',
            title: appLocalizations.chatHelpSustainability,
            icon: '🌿',
            onTap: () {},
          ),
          QuickAction(
            id: 'volunteer_events',
            title: appLocalizations.chatHelpEvents,
            icon: '📅',
            onTap: () {},
          ),
          QuickAction(
            id: 'alexbank_services',
            title: appLocalizations.chatHelpBanking,
            icon: '🏦',
            onTap: () {},
          ),
        ],
      );
      _messages.add(welcomeMsg);
    }
  }
}
