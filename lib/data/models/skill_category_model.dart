import 'skill_model.dart';

class SkillCategoryModel {
  final String category;
  final String emoji;
  final List<SkillModel> skills;

  const SkillCategoryModel({
    required this.category,
    required this.emoji,
    required this.skills,
  });
}
