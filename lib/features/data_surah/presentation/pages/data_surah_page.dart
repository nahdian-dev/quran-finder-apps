import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_finder_apps/features/data_surah/presentation/bloc/data_surah_bloc.dart';

class DataSurahPage extends StatefulWidget {
  const DataSurahPage({Key? key}) : super(key: key);

  @override
  State<DataSurahPage> createState() => _DataSurahPageState();
}

class _DataSurahPageState extends State<DataSurahPage> {
  @override
  void initState() {
    super.initState();
    context.read<DataSurahBloc>().add(DataSurahEventGetDataSurah());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Surah"),
      ),
      body: BlocBuilder<DataSurahBloc, DataSurahState>(
        builder: (context, state) {
          if (state is DataSurahLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DataSurahStateError) {
            if (state.message == 'No internet condition') {
              return Center(
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
              );
            }
            return Center(
              child: Text(state.message),
            );
          }
          if (state is DataSurahLoaded) {
            return RefreshIndicator(
              onRefresh: _handelRefresh,
              child: ListView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                children: state.dataSurah.map(
                  (e) {
                    return ListTile(
                      onTap: () {
                        context.push('/detail-surah');
                      },
                      leading: Text(
                        e.number.toString(),
                      ),
                      title: Text(e.name),
                      subtitle: Text(e.translation),
                    );
                  },
                ).toList(),
              ),
            );
          }
          return const Center(
            child: Text("NO DATA"),
          );
        },
      ),
    );
  }

  Future<void> _handelRefresh() async {
    context.read<DataSurahBloc>().add(DataSurahEventGetDataSurah());
  }
}
