import '../models/experience_model.dart';

abstract class ExperienceData {
  static const List<ExperienceModel> all = [
    ExperienceModel(
      company: 'TruePath Vision',
      location: 'Texas, USA · Remote',
      role: 'Lead Engineer',
      period: 'Aug 2024 – Present',
      isCurrent: true,
      highlights: [
        'Led Flutter + native iOS/Swift + Android/Kotlin mobile architecture',
        'Shipped modular cross-platform mobile SDK for secure image capture & upload',
        'Integrated on-device ML facial recognition via Firebase ML Kit',
        'Reduced end-to-end latency with high-throughput API Gateway optimization',
        'Drove TDD, CI-backed testing, and privacy-aware data flows with ML teams',
      ],
    ),

    ExperienceModel(
      company: 'Zabira Technologies',
      location: 'Lagos, Nigeria · Remote',
      role: 'Senior Software Engineer',
      period: 'Feb 2023 – Nov 2024',
      highlights: [
        'Built cross-platform mobile app from greenfield to production',
        'Designed decentralized crypto wallet & on-network transfer workflows',
        'Implemented Go backend services with gRPC for low-latency communication',
        'Architected real-time event-driven customer to agent chat system',
        'Sustained 99.9% uptime via CI/CD pipelines and Clean Architecture',
      ],
    ),

    ExperienceModel(
      company: 'Zojatech',
      location: 'Lagos, Nigeria · Remote',
      role: 'Senior Software Engineer',
      period: 'Aug 2022 – Nov 2023',
      highlights: [
        'Delivered SmartSend Finance and AIICO Invest to production',
        'Reduced crash rates 30% via native Kotlin/Swift performance modules',
        'Built real-time currency converter, boosted cross-border speed by 35%',
        'Designed monitoring & observability via event-driven architecture',
        'Enforced Clean Architecture, TDD, and CI/CD across all products',
      ],
    ),

    ExperienceModel(
      company: 'CredPal',
      location: 'Lagos, Nigeria · Hybrid',
      role: 'Mobile Engineer',
      period: 'May 2021 – Sep 2022',
      highlights: [
        'Implemented MVVM + DDD architecture, improved usability metrics by 34%',
        'Integrated DataDog and analytics, increased user engagement by 20%',
        'Built reusable UI component & service layer libraries',
        'Established unit/integration testing and CI/CD pipelines',
      ],
    ),

    ExperienceModel(
      company: 'Sterling Bank',
      location: 'Lagos, Nigeria · Remote',
      role: 'Mobile Engineer',
      period: 'Feb 2020 – Oct 2021',
      highlights: [
        'Migrated OneBank, Sterling Pro & Switch from MVP → MVVM architecture',
        'Scaled apps to serve millions of active users',
        'Reduced manual release errors 50% via automated CI/CD',
        'Introduced automated testing across all banking platforms',
      ],
    ),

    ExperienceModel(
      company: 'Mobinet',
      location: 'UAE · Remote',
      role: 'Flutter Developer',
      period: 'Apr 2019 – Feb 2020',
      highlights: [
        'Built Chanelle MFB banking app with Flutter',
        'Integrated Firebase for analytics and push notifications',
        'Decreased crash rates by 30%',
      ],
    ),
  ];
}
