import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_finder_apps/features/data_surah/presentation/bloc/data_surah_bloc.dart';

import '../widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<DataSurahBloc>().add(DataSurahEventGetDataSurah());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // APPBAR
            const CustomAppBar(),

            // BODY
            BlocBuilder<DataSurahBloc, DataSurahState>(
              builder: (context, state) {
                if (state is DataSurahLoading) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (state is DataSurahStateError) {
                  if (state.message == 'No internet condition') {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(state.message),
                            ElevatedButton(
                              onPressed: () {
                                context
                                    .read<DataSurahBloc>()
                                    .add(DataSurahEventGetDataSurah());
                              },
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: Text(state.message),
                  );
                }

                if (state is DataSurahLoaded) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        int number = index + 1;

                        return ListTile(
                          onTap: () {},
                          leading: Text(number.toString()),
                          title: Text(
                            state.dataSurah[index].name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Arti: ${state.dataSurah[index].translation} Ayat: ${state.dataSurah[index].totalAyah}",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          trailing: Image.asset(
                            (state.dataSurah[index].revelation == 'Madaniyah')
                                ? 'assets/images/madinah.png'
                                : 'assets/images/mecca.png',
                            height: 40,
                          ),
                        );
                      },
                      childCount: state.dataSurah.length,
                    ),
                  );
                }

                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text("NO DATA"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handelRefresh() async {
    context.read<DataSurahBloc>().add(DataSurahEventGetDataSurah());
  }
}
