part of 'cats_cubit.dart';

@immutable
abstract class CatsState {}

class CatsInitialState extends CatsState {}

class CatsLoadingState extends CatsState {}

class CatsSuccessState extends CatsState {
  final CatFactResponseModel catFactResponseModel;
  CatsSuccessState(this.catFactResponseModel);
}

class CatsErrorState extends CatsState {
  final String? errorResponse;
  CatsErrorState(this.errorResponse);
}
