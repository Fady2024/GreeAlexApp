import 'package:flutter/material.dart';
import '../models/chat_message.dart';
import '../models/intent.dart';
import '../../../../l10n/app_localizations.dart';
import 'chatbot_knowledge_base.dart';

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
    final intents = ChatbotKnowledgeBase.getIntents(context);

    // Find the first matching intent based on keywords.
    // The 'firstWhere' method returns the first element that satisfies the condition.
    final matchedIntent = intents.firstWhere(
      (intent) => intent.keywords.any((keyword) => lowerMessage.contains(keyword.toLowerCase())),
      // If no intent matches, it falls back to the 'default' intent.
      orElse: () => intents.firstWhere((intent) => intent.id == 'default'),
    );

    // Use the matched intent's response builder to create the reply.
    return matchedIntent.responseBuilder(context, now);
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
