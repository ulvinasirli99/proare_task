import 'package:dio/dio.dart';
import 'package:proarea_task/domain/model/cat_fact_model.dart';
import 'package:proarea_task/domain/service/retrofit_service.dart';
import 'package:proarea_task/infrastructure/repositories/cats/cat_repositroy.dart';

class CatsRepositoryData implements CatsRepository {

  //** Random Cat Image Repository Data
  @override
  Future<CatFactResponseModel> getRandomCatFact() async {
    final dio = Dio();
    final apiService = RetrofitService(dio);
    CatFactResponseModel data = await apiService.getCatFactData();
    return data;
  }
}
