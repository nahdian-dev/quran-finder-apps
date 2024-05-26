import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_finder_apps/cores/configuration/theme.dart';

import 'package:quran_finder_apps/cores/injection/depedency_injection.dart';
import 'package:quran_finder_apps/features/data_surah/presentation/bloc/data_surah_bloc.dart';

import 'package:quran_finder_apps/cores/routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencyInjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DataSurahBloc>(
          create: (context) => serviceLocator<DataSurahBloc>(),
        ),
      ],
      child: MaterialApp.router(
        routeInformationProvider: router.routeInformationProvider,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        debugShowCheckedModeBanner: false,
        title: 'Muslim Quiz',
        theme: buildTheme(Brightness.light),
      ),
    );
  }
}
