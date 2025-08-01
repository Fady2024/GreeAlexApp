import 'package:flutter/material.dart';

import 'chat_message.dart';

class Intent {
  final String id;
  final List<String> keywords;
  final ChatMessage Function(BuildContext context, DateTime timestamp) responseBuilder;

  const Intent({
    required this.id,
    required this.keywords,
    required this.responseBuilder,
  });
}
