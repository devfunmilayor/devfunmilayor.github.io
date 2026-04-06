import '../models/skill_category_model.dart';
import '../models/skill_model.dart';

abstract class SkillsData {
  static const List<SkillCategoryModel> all = [
    SkillCategoryModel(
      category: 'Languages & Frameworks',
      emoji: '⚡',
      skills: [
        SkillModel(label: 'Flutter / Dart'),
        SkillModel(label: 'Go (Golang)'),
        SkillModel(label: 'Swift (Native iOS)'),
        SkillModel(label: 'Kotlin (Native Android)'),
        SkillModel(label: 'Python'),
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
        SkillModel(label: 'Go / gRPC'),
        SkillModel(label: 'REST APIs'),
        SkillModel(label: 'Firebase'),
        SkillModel(label: 'PostgreSQL'),
        SkillModel(label: 'GraphQL'),
        SkillModel(label: 'AWS'),
        SkillModel(label: 'GCP'),
      ],
    ),
    SkillCategoryModel(
      category: 'Cloud Infrastructure',
      emoji: '🐳',
      skills: [
        SkillModel(label: 'Docker'),
        SkillModel(label: 'Kubernetes'),
        SkillModel(label: 'Containerization'),
        SkillModel(label: 'Terraform'),
        SkillModel(label: 'GitOps'),
        SkillModel(label: 'AWS CI/CD'),
      ],
    ),
    SkillCategoryModel(
      category: 'Native Integration',
      emoji: '📱',
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
        SkillModel(label: 'Monitoring & Observability'),
        SkillModel(label: 'OAuth2'),
        SkillModel(label: 'Biometric Auth'),
      ],
    ),
    SkillCategoryModel(
      category: 'Currently Learning',
      emoji: '🚀',
      skills: [
        SkillModel(label: 'Platform Engineering'),
        SkillModel(label: 'Backstage'),
        SkillModel(label: 'Internal Developer Platforms'),
        SkillModel(label: 'IDPs & Golden Paths'),
      ],
    ),
  ];
}
