import 'package:dio/dio.dart';
import 'package:proarea_task/core/constant/app_constant.dart';
import 'package:retrofit/retrofit.dart';
import '../model/cat_fact_model.dart';
part 'retrofit_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class RetrofitService {
  factory RetrofitService(Dio dio, {String baseUrl}) = _RetrofitService;

  @GET(CAT_PATH)
  Future<CatFactResponseModel> getCatFactData();

}