import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/model/cat_fact_model.dart';
import '../../../infrastructure/data/local/local_hive_data.dart';
import '../../../infrastructure/data/remote/cats/cats_repo_data.dart';

part 'cats_state.dart';

class CatsCubit extends Cubit<CatsState> {
  CatsCubit(this.catsRepository) : super(CatsInitialState());
  final CatsRepositoryData catsRepository;

  getRandomCatImage() async {
    try {
      emit(CatsLoadingState());
      CatFactResponseModel catFactResponseModel =
          await catsRepository.getRandomCatFact();
      var random = Random();
      String randomString = random.nextInt(100000).toString();
      randomString = random.nextInt(100000).toString();
      catFactResponseModel.imageUrl =
          "${catFactResponseModel.imageUrl}$randomString";
      await LocalHiveService.saveAllFactsOfCat(catFactResponseModel);
      emit(CatsSuccessState(catFactResponseModel));
    } catch (e) {
      String errMsg = e.toString();
      emit(CatsErrorState(errMsg));
    }
  }
}
