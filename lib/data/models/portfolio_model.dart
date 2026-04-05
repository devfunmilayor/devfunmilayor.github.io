class PortfolioModel {
  final String appName;
  final String company;
  final String period;
  final String description;
  final List<String> tags;
  final List<String> highlights;
  final String? iosUrl;
  final String? androidUrl;

  const PortfolioModel({
    required this.appName,
    required this.company,
    required this.period,
    required this.description,
    required this.tags,
    required this.highlights,
    this.iosUrl,
    this.androidUrl,
  });
}
