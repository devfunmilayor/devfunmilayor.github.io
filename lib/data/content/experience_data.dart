import 'package:devfunmi/data/models/experience_model.dart';

abstract class ExperienceData {
  static const List<ExperienceModel> all = [
    ExperienceModel(
      company: 'TruePath Vision',
      location: 'Texas, USA · Remote',
      role: 'Lead Engineer',
      period: 'Aug 2024 – Present',
      isCurrent: true,
      highlights: [
        'Led Flutter, native Swift, and Kotlin architecture across iOS and Android',
        'Built cross-platform mobile SDK with native platform channel integrations',
        'Integrated on-device ML facial recognition via native iOS Vision framework and Android ML Kit',
        'Wrote high-throughput API Gateway in Go, reducing end-to-end latency significantly',
        'Established TDD practices, data privacy standards, and CI/CD pipelines alongside the ML team',
      ],
      tags: ['Flutter', 'Swift', 'Kotlin', 'Go', 'ML Kit', 'Vision Framework', 'CI/CD', 'TDD'],
    ),

    ExperienceModel(
      company: 'Zabira Technologies',
      location: 'Lagos, Nigeria · Remote',
      role: 'Senior Software Engineer',
      period: 'Feb 2023 – Nov 2024',
      highlights: [
        'Built Flutter mobile app from greenfield to production with full native integration',
        'Designed decentralized crypto wallet with native iOS/Android secure enclave workflows',
        'Wrote Go backend services with gRPC for low-latency cross-platform communication',
        'Built a real-time chat system connecting customers to support agents',
        'Maintained 99.9% uptime across mobile and backend through solid CI/CD and architecture',
      ],
      tags: ['Flutter', 'Go', 'gRPC', 'iOS', 'Android', 'Crypto Wallet', 'Clean Architecture', 'CI/CD'],
    ),

    ExperienceModel(
      company: 'Zojatech',
      location: 'Lagos, Nigeria · Remote',
      role: 'Senior Software Engineer',
      period: 'Aug 2022 – Nov 2023',
      highlights: [
        'Delivered SmartSend Finance and AIICO Invest to production on iOS and Android',
        'Built native Kotlin and Swift performance modules, reduced crash rates by 30%',
        'Wrote real-time currency converter service, boosted cross-border processing speed by 35%',
        'Designed event-driven observability layer across mobile and backend systems',
        'Enforced Clean Architecture, TDD, and CI/CD across all products',
      ],
      tags: ['Flutter', 'Kotlin', 'Swift', 'iOS', 'Android', 'Clean Architecture', 'TDD', 'CI/CD'],
    ),

    ExperienceModel(
      company: 'CredPal',
      location: 'Lagos, Nigeria · Hybrid',
      role: 'Mobile Engineer',
      period: 'May 2021 – Sep 2022',
      highlights: [
        'Implemented MVVM + DDD architecture with native Kotlin/Swift modules, improved usability by 34%',
        'Integrated DataDog and analytics across iOS and Android, increased engagement by 20%',
        'Built reusable Flutter UI library and native platform channel service layer',
        'Established unit and integration testing with CI/CD pipelines for both platforms',
      ],
      tags: ['Flutter', 'MVVM', 'DDD', 'Kotlin', 'Swift', 'DataDog', 'Fastlane', 'GitHub Actions', 'CI/CD'],
    ),

    ExperienceModel(
      company: 'Sterling Bank',
      location: 'Lagos, Nigeria · Remote',
      role: 'Mobile Engineer',
      period: 'Feb 2020 – Oct 2021',
      highlights: [
        'Migrated OneBank, Sterling Pro and Switch from MVP to MVVM on iOS and Android',
        'Scaled apps to serve millions of active users across both platforms',
        'Reduced manual release errors 50% via automated CI/CD with Azure Pipelines',
        'Introduced automated testing across all banking platforms',
      ],
      tags: ['Flutter', 'MVVM', 'iOS', 'Android', 'Azure', 'CI/CD'],
    ),

    ExperienceModel(
      company: 'Mobinet',
      location: 'UAE · Remote',
      role: 'Flutter Developer',
      period: 'Apr 2019 – Feb 2020',
      highlights: [
        'Built Chanelle MFB banking app with Flutter targeting iOS and Android',
        'Integrated Firebase for analytics and push notifications on both platforms',
        'Decreased crash rates by 30% through native platform optimisations',
      ],
      tags: ['Flutter', 'Firebase', 'iOS', 'Android'],
    ),
  ];
}
