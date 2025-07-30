class VolunteerHistory {
  final String id;
  final String title;
  final String organization;
  final DateTime date;
  final int points;
  final String icon; // Changed to String for asset path

  VolunteerHistory({
    required this.id,
    required this.title,
    required this.organization,
    required this.date,
    required this.points,
    required this.icon,
  });
}

