class VolunteerOpportunity {
  final String id;
  final String title;
  final String description;
  final String location;
  final DateTime date;
  final int points;
  final String image;
  final int participantsCount;
  final int maxParticipants;
  final bool isRegistered;

  const VolunteerOpportunity({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.date,
    required this.points,
    required this.image,
    required this.participantsCount,
    required this.maxParticipants,
    this.isRegistered = false,
  });

  bool get isFull => participantsCount >= maxParticipants;
} 