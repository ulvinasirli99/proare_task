import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:proarea_task/infrastructure/data/local/local_hive_data.dart';

import '../../../domain/model/cat_fact_model.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitialState());

  getAllCatFacts() async {
    emit(HistoryLoadingState());
    List<dynamic> factsList = LocalHiveService.getAllCatFacts;
    List<CatFactResponseModel> newList = [];
    for (int i = 0; i < factsList.length; i++) {
      newList.add(factsList[i]);
    }
    emit(HistorySuccessState(newList));
  }
}
