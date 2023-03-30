part of 'history_cubit.dart';

@immutable
abstract class HistoryState {}

class HistoryInitialState extends HistoryState {}

class HistoryLoadingState extends HistoryState {}

class HistorySuccessState extends HistoryState {
  final List<CatFactResponseModel> catsList;

  HistorySuccessState(this.catsList);
}
