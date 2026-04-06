class ExperienceModel {
  final String company;
  final String location;
  final String role;
  final String period;
  final List<String> highlights;
  final bool isCurrent;
  final List<String> tags;

  const ExperienceModel({
    required this.company,
    required this.location,
    required this.role,
    required this.period,
    required this.highlights,
    this.isCurrent = false,
    this.tags = const [],
  });
}
