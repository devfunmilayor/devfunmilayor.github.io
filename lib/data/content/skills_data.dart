
import 'package:devfunmi/data/models/skill_category_model.dart';
import 'package:devfunmi/data/models/skill_model.dart';
import 'package:hugeicons/hugeicons.dart';

abstract class SkillsData {
  static const List<SkillCategoryModel> all = [
    SkillCategoryModel(
      category: 'Languages & Frameworks',
      icon: HugeIcons.strokeRoundedCode,
      skills: [
        SkillModel(label: 'Flutter / Dart'),
        SkillModel(label: 'Go (Golang)'),
        SkillModel(label: 'Swift (Native iOS)'),
        SkillModel(label: 'Kotlin (Native Android)'),
      ],
    ),
    SkillCategoryModel(
      category: 'Architecture & Patterns',
      icon: HugeIcons.strokeRoundedLayers01,
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
      icon: HugeIcons.strokeRoundedCloud,
      skills: [
        SkillModel(label: 'Go / gRPC'),
        SkillModel(label: 'REST APIs'),
        SkillModel(label: 'Firebase'),
        SkillModel(label: 'PostgreSQL'),
        SkillModel(label: 'GraphQL'),
        SkillModel(label: 'DartFrog'),
      ],
    ),
    SkillCategoryModel(
      category: 'Native Integration',
      icon: HugeIcons.strokeRoundedSmartPhone01,
      skills: [
        SkillModel(label: 'Platform Channels'),
        SkillModel(label: 'iOS Vision Framework'),
        SkillModel(label: 'Android ML Kit'),
        SkillModel(label: 'Secure Enclave'),
        SkillModel(label: 'Biometric Auth'),
        SkillModel(label: 'Push Notifications'),
      ],
    ),
    SkillCategoryModel(
      category: 'DevOps & QA',
      icon: HugeIcons.strokeRoundedTools,
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
      icon: HugeIcons.strokeRoundedShield01,
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
