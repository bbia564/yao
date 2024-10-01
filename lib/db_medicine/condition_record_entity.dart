import 'package:intl/intl.dart';

class ConditionRecordEntity {
  int id;
  DateTime createTime;
  String title;

  ConditionRecordEntity({
    required this.id,
    required this.createTime,
    required this.title,
  });

  factory ConditionRecordEntity.fromJson(Map<String, dynamic> json) {
    return ConditionRecordEntity(
      id: json['id'],
      createTime: DateTime.parse(json['createTime']),
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createTime': createTime.toIso8601String(),
      'title': title,
    };
  }

  String get createTimeString {
    return DateFormat('yyyy-MM-dd HH:mm').format(createTime);
  }

}