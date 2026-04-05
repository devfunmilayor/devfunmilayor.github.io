import '../models/portfolio_model.dart';

abstract class PortfolioData {
  static const List<PortfolioModel> all = [
    PortfolioModel(
      appName: 'Zabira',
      company: 'Zabira Technologies',
      period: 'Feb 2023 – Nov 2024',
      description:
          'Decentralized crypto wallet & consumer fintech platform. '
          'Built from greenfield to production, owning mobile architecture, '
          'backend services, and release pipelines.',
      tags: ['Flutter', 'Crypto Wallet', 'Golang', 'gRPC', 'Clean Architecture'],
      highlights: [
        '0 → production full ownership',
        'Real-time customer to agent chat',
        '99.9% uptime sustained',
      ],
      iosUrl: 'https://apps.apple.com/app/zabira/id6443791329',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.zabira.app',
    ),

    PortfolioModel(
      appName: 'SmartSend Finance',
      company: 'Zojatech',
      period: 'Aug 2022 – Nov 2023',
      description:
          'Cross-border money transfer & fintech platform with '
          'Flutter cross-platform UI and native Kotlin/Swift modules '
          'for performance-critical features.',
      tags: ['Flutter', 'Kotlin', 'Swift', 'CI/CD'],
      highlights: [
        '30% crash rate reduction',
        '35% faster cross-border processing',
        'Native Kotlin/Swift performance modules',
      ],
      iosUrl: 'https://apps.apple.com/app/smartsend-finance/id1619841578',
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.zojatech.smartsend',
    ),

    PortfolioModel(
      appName: 'AIICO Invest',
      company: 'Zojatech',
      period: 'Aug 2022 – Nov 2023',
      description:
          'Investment & portfolio management platform for AIICO Insurance. '
          'Flutter-powered with Firebase backend, real-time portfolio '
          'tracking, and proactive monitoring.',
      tags: [
        'Flutter',
        'Investments',
        'Firebase',
        'Clean Architecture',
      ],
      highlights: [
        'Real-time portfolio tracking',
        'Proactive monitoring & observability',
        'Clean Architecture + TDD',
      ],
      iosUrl: 'https://apps.apple.com/app/aiico-invest/id1618185759',
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.aiicoinvest.app',
    ),

    PortfolioModel(
      appName: 'CredPal',
      company: 'CredPal',
      period: 'May 2021 – Sep 2022',
      description:
          'Buy-now-pay-later consumer credit platform with modular '
          'MVVM + DDD architecture and Flutter cross-platform UI '
          'with native Kotlin/Swift modules.',
      tags: ['Flutter', 'BNPL', 'MVVM', 'DDD', 'Kotlin', 'Swift'],
      highlights: [
        '34% navigation & usability improvement',
        '20% engagement increase',
        'Reusable UI component library',
      ],
      iosUrl: 'https://apps.apple.com/app/credpal/id1449768564',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.credpal.app',
    ),

    PortfolioModel(
      appName: 'Sterling OneBank',
      company: 'Sterling Bank',
      period: 'Feb 2020 – Oct 2021',
      description:
          'Core retail banking super-app for Sterling Bank. '
          'Migrated from MVP to MVVM, scaled to serve millions of users '
          'with automated CI/CD pipelines.',
      tags: ['Flutter', 'Banking', 'MVVM', 'CI/CD', 'Scale'],
      highlights: [
        'Millions of active users',
        '50% fewer release errors',
        'MVP → MVVM migration',
      ],
      iosUrl: 'https://apps.apple.com/ng/app/sterling-onebank/id1039638318',
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.sterling.onebank',
    ),

    PortfolioModel(
      appName: 'Sterling Pro',
      company: 'Sterling Bank',
      period: 'Feb 2020 – Oct 2021',
      description:
          'Business & corporate banking platform for Sterling Bank. '
          'Architected for enterprise-grade transaction volumes with '
          'automated testing and release pipelines.',
      tags: ['Flutter', 'Corporate Banking', 'MVVM', 'Automated Testing'],
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
          'Lifestyle & payments app by Sterling Bank targeting '
          'younger demographics with seamless banking, spending features, '
          'and cross-platform Flutter codebase.',
      tags: ['Flutter', 'Lifestyle Banking', 'Payments', 'MVVM'],
      highlights: [
        'Youth-focused banking UX',
        'Seamless payments integration',
        'Cross-platform Flutter codebase',
      ],
      iosUrl: 'https://apps.apple.com/ng/app/switch-by-sterling/id1539586078',
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.sterling.switch',
    ),
  ];
}
