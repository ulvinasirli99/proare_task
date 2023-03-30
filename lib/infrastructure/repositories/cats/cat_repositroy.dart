import '../../../domain/model/cat_fact_model.dart';

abstract class CatsRepository {
  //** Random Cat Image Repository
  Future<CatFactResponseModel> getRandomCatFact();
}
