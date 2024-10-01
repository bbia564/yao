class SleepEntity {
  int id;
  DateTime createTime;
  int type;
  DateTime warningTime;

  SleepEntity({
    required this.id,
    required this.createTime,
    required this.type,
    required this.warningTime,
  });

  factory SleepEntity.fromJson(Map<String, dynamic> json) {
    return SleepEntity(
      id: json['id'],
      createTime: DateTime.parse(json['createTime']),
      type: json['type'],
      warningTime: DateTime.parse(json['warningTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createTime': createTime.toIso8601String(),
      'type': type,
      'warningTime': warningTime.toIso8601String(),
    };
  }
}
