import 'package:flutter/widgets.dart';
import 'skill_model.dart';

class SkillCategoryModel {
  final String category;
  final IconData icon;
  final List<SkillModel> skills;

  const SkillCategoryModel({
    required this.category,
    required this.icon,
    required this.skills,
  });
}
