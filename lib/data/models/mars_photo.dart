import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'mars_photo.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(createToJson: false)
class MarsPhoto {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int sol;
  @HiveField(2)
  final Camera camera;
  @HiveField(3)
  @JsonKey(name: "img_src")
  final String imgSrc;
  @HiveField(4)
  @JsonKey(name: "earth_date" , fromJson: _dateTimeFromString)
  final DateTime earthDate;

  MarsPhoto({
    required this.id,
    required this.sol,
    required this.camera,
    required this.imgSrc,
    required this.earthDate,
  });
  factory MarsPhoto.fromJson(Map<String , dynamic>json)=>_$MarsPhotoFromJson(json);
  static _dateTimeFromString (String date ) => DateTime.parse(date);
  
}


@HiveType(typeId: 1)
@JsonSerializable(createToJson: false)
class Camera {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  @JsonKey(name: "rover_id")
  final int roverId;
  @HiveField(3)
  @JsonKey(name: "full_name")
  final String fullName;
  Camera({
    required this.id,
    required this.name,
    required this.roverId,
    required this.fullName,
  });
  factory Camera.fromJson (Map<String , dynamic>json)=>_$CameraFromJson(json);
}

