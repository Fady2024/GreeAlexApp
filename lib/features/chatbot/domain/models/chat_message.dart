import 'package:flutter/material.dart';

enum MessageType {
  user,
  bot,
  actionSuggestion,
  bankingInfo,
  sustainabilityTip,
}

enum MessageSender {
  user,
  bot,
}

class ChatMessage {
  final String id;
  final String content;
  final MessageSender sender;
  final MessageType type;
  final DateTime timestamp;
  final bool isTyping;
  final List<QuickAction>? quickActions;
  final String? imageUrl;
  final BankingInfo? bankingInfo;
  final SustainabilityTip? sustainabilityTip;

  ChatMessage({
    required this.id,
    required this.content,
    required this.sender,
    required this.type,
    required this.timestamp,
    this.isTyping = false,
    this.quickActions,
    this.imageUrl,
    this.bankingInfo,
    this.sustainabilityTip,
  });

  ChatMessage copyWith({
    String? id,
    String? content,
    MessageSender? sender,
    MessageType? type,
    DateTime? timestamp,
    bool? isTyping,
    List<QuickAction>? quickActions,
    String? imageUrl,
    BankingInfo? bankingInfo,
    SustainabilityTip? sustainabilityTip,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      content: content ?? this.content,
      sender: sender ?? this.sender,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      isTyping: isTyping ?? this.isTyping,
      quickActions: quickActions ?? this.quickActions,
      imageUrl: imageUrl ?? this.imageUrl,
      bankingInfo: bankingInfo ?? this.bankingInfo,
      sustainabilityTip: sustainabilityTip ?? this.sustainabilityTip,
    );
  }
}

class QuickAction {
  final String id;
  final String title;
  final String? description;
  final String icon;
  final VoidCallback onTap;

  QuickAction({
    required this.id,
    required this.title,
    this.description,
    required this.icon,
    required this.onTap,
  });
}

class BankingInfo {
  final String title;
  final String description;
  final String? actionUrl;
  final String? actionText;
  final int? greenPoints;

  BankingInfo({
    required this.title,
    required this.description,
    this.actionUrl,
    this.actionText,
    this.greenPoints,
  });
}

class SustainabilityTip {
  final String title;
  final String description;
  final int potentialPoints;
  final String category;
  final String icon;
  final String? actionType;

  SustainabilityTip({
    required this.title,
    required this.description,
    required this.potentialPoints,
    required this.category,
    required this.icon,
    this.actionType,
  });
}
