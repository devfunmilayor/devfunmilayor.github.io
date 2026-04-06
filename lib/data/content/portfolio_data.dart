
import 'package:devfunmi/data/models/portfolio_model.dart';

abstract class PortfolioData {
  static const List<PortfolioModel> all = [
    PortfolioModel(
      appName: 'Zabira',
      company: 'Zabira Technologies',
      period: 'Feb 2023 – Nov 2024',
      description:
          'Cross-platform Flutter app with Go backend and native iOS/Android integrations. '
          'Built from zero to production, leading mobile architecture, '
          'gRPC services, and release pipelines.',
      tags: ['Flutter', 'Go', 'gRPC', 'Native iOS/Android', 'Clean Architecture'],
      highlights: [
        '0 → production full ownership',
        'Real-time customer to agent chat',
        '99.9% uptime sustained',
      ],
      iosUrl: 'https://apps.apple.com/ng/app/zabira-buy-crypto-gift-card/id6504557775',
      androidUrl: 'https://play.google.com/store/apps/details?id=dev.app.grizab.ng',
    ),

    PortfolioModel(
      appName: 'SmartSend Finance',
      company: 'Zojatech',
      period: 'Aug 2022 – Nov 2023',
      description:
          'Cross-border payments platform built with Flutter and native Kotlin/Swift modules '
          'for performance-critical features. Go-powered backend services '
          'for real-time FX processing.',
      tags: ['Flutter', 'Go', 'Kotlin', 'Swift', 'CI/CD'],
      highlights: [
        '30% crash rate reduction',
        '35% faster cross-border processing',
        'Native Kotlin/Swift performance modules',
      ],
      iosUrl: 'https://apps.apple.com/us/app/smartsend-finance/id6743051304',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.finanace.smartsend',
    ),

    PortfolioModel(
      appName: 'AIICO Invest',
      company: 'Zojatech',
      period: 'Aug 2022 – Nov 2023',
      description:
          'Investment platform for AIICO Insurance. Flutter frontend with Firebase backend, '
          'real-time portfolio tracking, and native iOS/Android push notification integrations.',
      tags: ['Flutter', 'Firebase', 'Native iOS', 'Native Android', 'Clean Architecture'],
      highlights: [
        'Real-time portfolio tracking',
        'Proactive monitoring & observability',
        'Clean Architecture + TDD',
      ],
      iosUrl: 'https://apps.apple.com/us/app/aiico-invest/id6448627710',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.aiicocapital.aiicoinvest',
    ),

    PortfolioModel(
      appName: 'CredPal',
      company: 'CredPal',
      period: 'May 2021 – Sep 2022',
      description:
          'Buy-now-pay-later platform with Flutter cross-platform UI and native Kotlin/Swift modules. '
          'MVVM + DDD architecture with reusable component library.',
      tags: ['Flutter', 'Kotlin', 'Swift', 'MVVM', 'DDD'],
      highlights: [
        '34% navigation & usability improvement',
        '20% engagement increase',
        'Reusable UI component library',
      ],
      iosUrl: 'https://apps.apple.com/ng/app/credpal/id1541846382',
      androidUrl: 'https://play.google.com/store/search?q=credpal&c=apps',
    ),

    PortfolioModel(
      appName: 'Sterling OneBank',
      company: 'Sterling Bank',
      period: 'Feb 2020 – Oct 2021',
      description:
          'Core retail banking super-app for Sterling Bank. Flutter with native iOS/Android integrations, '
          'migrated from MVP to MVVM and scaled to millions of users.',
      tags: ['Flutter', 'Native iOS', 'Native Android', 'MVVM', 'CI/CD'],
      highlights: [
        'Millions of active users',
        '50% fewer release errors',
        'MVP → MVVM migration',
      ],
      iosUrl: 'https://apps.apple.com/ng/app/sterling-onebank/id1489139430',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.sterlingng.sterlingmobile',
    ),

    PortfolioModel(
      appName: 'Sterling Pro',
      company: 'Sterling Bank',
      period: 'Feb 2020 – Oct 2021',
      description:
          'Business banking platform built with Flutter and native integrations for '
          'large-scale transaction volumes. Automated testing and Azure release pipelines.',
      tags: ['Flutter', 'Kotlin', 'Swift', 'Corporate Banking', 'Fastlane'],
      highlights: [
        'Enterprise transaction volumes',
        'Automated CI/CD pipeline',
        '50% fewer release errors',
      ],
      iosUrl: 'https://apps.apple.com/ng/app/sterling-pro/id1570937557',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.sterling.pro',
    ),

    PortfolioModel(
      appName: 'Switch by Sterling',
      company: 'Sterling Bank',
      period: 'Feb 2020 – Oct 2021',
      description:
          'Lifestyle and payments app for Sterling Bank targeting younger users. '
          'Flutter with native iOS/Android payment integrations and seamless cross-platform UX.',
      tags: ['Flutter', 'Native iOS', 'Native Android', 'Payments', 'MVVM'],
      highlights: [
        'Youth-focused banking UX',
        'Seamless payments integration',
        'Cross-platform Flutter codebase',
      ],
      iosUrl: 'https://apps.apple.com/ng/app/switch-by-sterling/id1494153941',
      androidUrl: 'https://play.google.com/store/search?q=switch+by+sterling&c=apps',
    ),
  ];
}
