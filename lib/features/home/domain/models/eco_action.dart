class EcoAction {
  final String id;
  final String title;
  final String description;
  final String icon;
  final int points;
  final String category;
  final bool isCompleted;

  const EcoAction({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.points,
    required this.category,
    this.isCompleted = false,
  });
} 