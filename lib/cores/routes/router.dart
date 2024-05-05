import 'package:go_router/go_router.dart';
import 'package:quran_finder_apps/features/data_surah/presentation/pages/data_surah_page.dart';
import 'package:quran_finder_apps/features/data_surah/presentation/pages/detail_surah_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const DataSurahPage(),
      routes: [
        GoRoute(
          path: 'detail-surah',
          builder: (context, state) => const DetailSurahPage(),
        ),
      ],
    ),
  ],
);
