import 'package:go_router/go_router.dart';
import 'package:quran_finder_apps/features/data_surah/presentation/pages/detail_surah_page.dart';
import 'package:quran_finder_apps/presentation/pages/home_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/detail-surah',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return DetailSurahPage(
          data: extra['data'] ?? {'data': 'No Data'},
        );
      },
    ),
  ],
);
