import '../models/skill_category_model.dart';
import '../models/skill_model.dart';

abstract class SkillsData {
  static const List<SkillCategoryModel> all = [
    SkillCategoryModel(
      category: 'Languages & Frameworks',
      emoji: '⚡',
      skills: [
        SkillModel(label: 'Dart / Flutter'),
        SkillModel(label: 'Kotlin'),
        SkillModel(label: 'Swift'),
        SkillModel(label: 'Golang'),
      ],
    ),
    SkillCategoryModel(
      category: 'Architecture & Patterns',
      emoji: '🏛',
      skills: [
        SkillModel(label: 'Clean Architecture'),
        SkillModel(label: 'MVVM'),
        SkillModel(label: 'DDD'),
        SkillModel(label: 'BLoC'),
        SkillModel(label: 'Riverpod'),
        SkillModel(label: 'Modular Architecture'),
      ],
    ),
    SkillCategoryModel(
      category: 'Backend & Cloud',
      emoji: '☁️',
      skills: [
        SkillModel(label: 'Firebase'),
        SkillModel(label: 'gRPC'),
        SkillModel(label: 'REST APIs'),
        SkillModel(label: 'GraphQL'),
        SkillModel(label: 'PostgreSQL'),
        SkillModel(label: 'DartFrog'),
      ],
    ),
    SkillCategoryModel(
      category: 'DevOps & QA',
      emoji: '🔧',
      skills: [
        SkillModel(label: 'GitHub Actions'),
        SkillModel(label: 'Fastlane'),
        SkillModel(label: 'CodeMagic'),
        SkillModel(label: 'CI/CD'),
        SkillModel(label: 'TDD'),
        SkillModel(label: 'Firebase Test Lab'),
      ],
    ),
    SkillCategoryModel(
      category: 'Observability & Security',
      emoji: '🔍',
      skills: [
        SkillModel(label: 'DataDog'),
        SkillModel(label: 'Sentry'),
        SkillModel(label: 'Crashlytics'),
        SkillModel(label: 'OAuth2'),
        SkillModel(label: 'Biometric Auth'),
      ],
    ),
  ];
}
