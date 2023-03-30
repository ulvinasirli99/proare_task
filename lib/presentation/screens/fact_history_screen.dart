import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proarea_task/presentation/cubits/history/history_cubit.dart';
import '../../domain/model/cat_fact_model.dart';
import '../widgets/cached_cat_component.dart';

class FactHistoryScreen extends StatefulWidget {
  const FactHistoryScreen({Key? key}) : super(key: key);

  @override
  State<FactHistoryScreen> createState() => _FactHistoryScreenState();
}

class _FactHistoryScreenState extends State<FactHistoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HistoryCubit>().getAllCatFacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cached Screen"),
      ),
      body: historyBlocView(),
    );
  }

  BlocBuilder<HistoryCubit, HistoryState> historyBlocView() {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        if (state is HistoryLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HistorySuccessState) {
          List<CatFactResponseModel> historyList = state.catsList;
          if (historyList.isEmpty) {
            return const Center(
              child: Text("You list is empty!"),
            );
          }
          return historyListView(historyList);
        }
        return const SizedBox();
      },
    );
  }

  ListView historyListView(List<CatFactResponseModel> historyList) {
    return ListView.builder(
      itemCount: historyList.length,
      itemBuilder: (context, index) {
        return CachedCatComponent(
          catFactResponseModel: historyList[index],
        );
      },
    );
  }
}
