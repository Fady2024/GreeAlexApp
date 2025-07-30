class Reward {
  final String id;
  final String title;
  final String description;
  final int requiredPoints;
  final String iconUrl;
  final bool isRedeemed;
  final String category; // e.g., 'Banking', 'Sustainability', 'Lifestyle'
  final String partnerName; // e.g., 'AlexBank', 'Local Coffee Shop'
  final DateTime? expiryDate;

  const Reward({
    required this.id,
    required this.title,
    required this.description,
    required this.requiredPoints,
    required this.iconUrl,
    required this.category,
    required this.partnerName,
    this.expiryDate,
    this.isRedeemed = false,
  });
} 