import 'dart:convert';
import 'package:hive/hive.dart';
part 'cat_fact_model.g.dart';

CatFactResponseModel catFactFromJson(String str) =>
    CatFactResponseModel.fromJson(json.decode(str));

@HiveType(typeId: 1, adapterName: "CatFactResponseModelResponse")
class CatFactResponseModel extends HiveObject {
  CatFactResponseModel({
    this.status,
    this.id,
    this.user,
    this.text,
    this.type,
    this.deleted,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.imageUrl,
  });

  @HiveField(0)
  Status? status;
  @HiveField(1)
  String? id;
  @HiveField(2)
  String? imageUrl;
  @HiveField(3)
  String? user;
  @HiveField(4)
  String? text;
  @HiveField(5)
  String? type;
  @HiveField(6)
  bool? deleted;
  @HiveField(7)
  DateTime? createdAt;
  @HiveField(8)
  DateTime? updatedAt;
  @HiveField(9)
  int? v;

  factory CatFactResponseModel.fromJson(Map<String, dynamic> json) =>
      CatFactResponseModel(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        id: json["_id"],
        imageUrl: "https://cataas.com/cat?random=",
        user: json["user"],
        text: json["text"],
        type: json["type"],
        deleted: json["deleted"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}

@HiveType(typeId: 2, adapterName: "StatusResponse")
class Status {
  Status({
    this.verified,
    this.sentCount,
  });

  @HiveField(10)
  dynamic verified;
  @HiveField(11)
  int? sentCount;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        verified: json["verified"],
        sentCount: json["sentCount"],
      );
}
