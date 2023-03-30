import 'package:flutter/material.dart';
import 'package:proarea_task/core/app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proarea_task/infrastructure/data/local/local_hive_data.dart';
import 'package:proarea_task/infrastructure/data/remote/cats/cats_repo_data.dart';
import 'package:proarea_task/presentation/cubits/cats/cats_cubit.dart';
import 'package:proarea_task/presentation/cubits/history/history_cubit.dart';

void main() async {
  await LocalHiveService().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CatsCubit(CatsRepositoryData()),
        ),
        BlocProvider(
          create: (_) => HistoryCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
