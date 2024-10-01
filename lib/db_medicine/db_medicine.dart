
import 'package:get/get.dart';
import 'package:medicine/db_medicine/condition_record_entity.dart';
import 'package:medicine/db_medicine/medicine_entity.dart';
import 'package:medicine/db_medicine/sleep_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBMedicine extends GetxService {
  late Database dbBase;

  Future<DBMedicine> init() async {
    await createMedicineDB();
    return this;
  }

  createMedicineDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'medicine.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createExperimentTable(db);
          await createConditionRecordTable(db);
          await createSleepTable(db);
        });
  }

  createExperimentTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS medicine (id INTEGER PRIMARY KEY, createTime TEXT, medicineName TEXT, imageData BLOB, intervalTime INTEGER, emptyStomach INTEGER, warning INTEGER, warningTime TEXT)');
  }

  createConditionRecordTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS conditionRecord (id INTEGER PRIMARY KEY, createTime TEXT, title TEXT)');
  }

  createSleepTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS sleep (id INTEGER PRIMARY KEY, createTime TEXT, type INTEGER, warningTime TEXT)');
  }

  updateMedicine(MedicineEntity entity) async {
    await dbBase.update('medicine', {
      'medicineName': entity.medicineName,
      'imageData': entity.imageData,
      'intervalTime': entity.intervalTime,
      'emptyStomach': entity.emptyStomach,
      'warning': entity.warning,
      'warningTime': entity.warningTime.toIso8601String(),
    },
        where: 'id = ?', whereArgs: [entity.id]);
  }

  deleteMedicine(MedicineEntity entity) async {
    await dbBase.delete('medicine', where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanMedicineData() async {
    await dbBase.delete('medicine');
  }

  cleanConditionRecordData() async {
    await dbBase.delete('conditionRecord');
  }

  cleanSleepData() async {
    await dbBase.delete('sleep');
  }

  Future<List<MedicineEntity>> getMedicineAllData() async {
    var result = await dbBase.query('medicine', orderBy: 'createTime ASC');
    return result.map((e) => MedicineEntity.fromJson(e)).toList();
  }

  Future<List<ConditionRecordEntity>> getConditionRecordAllData() async {
    var result = await dbBase.query('conditionRecord', orderBy: 'createTime DESC');
    return result.map((e) => ConditionRecordEntity.fromJson(e)).toList();
  }

  Future<List<SleepEntity>> getSleepAllData() async {
    var result = await dbBase.query('sleep', orderBy: 'createTime ASC');
    return result.map((e) => SleepEntity.fromJson(e)).toList();
  }

}
