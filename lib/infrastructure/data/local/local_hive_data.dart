import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/model/cat_fact_model.dart';

class LocalHiveService {
  static final LocalHiveService _singleton = LocalHiveService._();

  factory LocalHiveService() => _singleton;

  LocalHiveService._();

  static Box get catsFactBox => Hive.box(BoxKeys.catBox);

  Future<void> init({String? testFileName}) async {
    if (testFileName != null) {
      Hive.init('${Directory.systemTemp.path}/$testFileName');
    } else {
      await Hive.initFlutter();
      Hive.registerAdapter(CatFactResponseModelResponse());
      Hive.registerAdapter(StatusResponse());
    }
    await Future.wait([
      Hive.openBox(BoxKeys.catBox),
    ]);
  }

  //* Save All Cat Facts.....
  static Future<dynamic> saveAllFactsOfCat(
      CatFactResponseModel catFactResponseModel) async {
    dynamic factResponse = LocalHiveService.getAllCatFacts ?? [];
    List<dynamic> factList = factResponse;
    factList.add(catFactResponseModel);
    dynamic savedCatFactResponse = factList;
    return await catsFactBox.put(BoxKeys.factKey, savedCatFactResponse);
  }

  //* Get All Fact of Cats
  static dynamic get getAllCatFacts =>
      catsFactBox.get(BoxKeys.factKey, defaultValue: null);
}

class BoxKeys {
  // boxes

  static const catBox = 'factBoxKey';

  // keys

  static const factKey = 'factSaveKey';
}
