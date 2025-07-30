class LeaderboardUser {
  final String id;
  final String name;
  final String avatarUrl;
  final int points;
  final int rank;

  const LeaderboardUser({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.points,
    required this.rank,
  });
} 