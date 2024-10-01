import 'dart:typed_data';

import 'package:intl/intl.dart';

class MedicineEntity {
  int id;
  DateTime createTime;
  String medicineName;
  Uint8List imageData;
  int intervalTime;
  int emptyStomach;
  int warning;
  DateTime warningTime;

  MedicineEntity({
    required this.id,
    required this.createTime,
    required this.medicineName,
    required this.imageData,
    required this.intervalTime,
    required this.emptyStomach,
    required this.warning,
    required this.warningTime,
  });

  factory MedicineEntity.fromJson(Map<String, dynamic> json) {
    return MedicineEntity(
        id: json['id'],
        createTime: DateTime.parse(json['createTime']),
        medicineName: json['medicineName'],
        imageData: json['imageData'],
        intervalTime: json['intervalTime'],
        emptyStomach: json['emptyStomach'],
        warning: json['warning'],
        warningTime: DateTime.parse(json['warningTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createTime': createTime.toIso8601String(),
      'medicineName': medicineName,
      'imageData': imageData,
      'intervalTime': intervalTime,
      'emptyStomach': emptyStomach,
      'warning': warning,
      'warningTime': warningTime.toIso8601String(),
    };
  }

  String get warningTimeString {
    final now = DateTime.now();
    return warningTime.year == now.year &&
            warningTime.month == now.month &&
            warningTime.day == now.day
        ? DateFormat('HH:mm').format(warningTime)
        : DateFormat('yyyy-MM-dd HH:mm').format(warningTime);
  }
}
