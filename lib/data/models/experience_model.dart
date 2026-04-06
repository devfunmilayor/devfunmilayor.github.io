class ExperienceModel {
  final String company;
  final String location;
  final String role;
  final String period;
  final List<String> highlights;
  final List<String> tags;
  final bool isCurrent;

  const ExperienceModel({
    required this.company,
    required this.location,
    required this.role,
    required this.period,
    required this.highlights,
    this.tags = const [],
    this.isCurrent = false,
  });
}
