import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class DatabaseFileRoutines {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/inventory_persistence.json');
  }

  Future<String> readLogs() async {
    try {
      final file = await _localFile;
      if (!file.existsSync()) {
        print("File does not Exist: ${file.absolute}");
        await writeLogs('{"logs": []}');
      }
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      print("error readLogs: $e");
      return "";
    }
  }

  Future<File> writeLogs(String json) async {
    final file = await _localFile;
    return file.writeAsString('$json');
  }
}

Database databaseFromJson(String str) {
  final dataFromJson = json.decode(str);
  return Database.fromJson(dataFromJson);
}

String databaseToJson(Database data) {
  final dataToJson = data.toJson();
  return json.encode(dataToJson);
}

class Database {
  List<InventoryLog> logs;

  Database({required this.logs});

  factory Database.fromJson(Map<String, dynamic> json) => Database(
        logs: List<InventoryLog>.from(
            json["logs"].map((x) => InventoryLog.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "logs": List<dynamic>.from(logs.map((x) => x.toJson())),
      };
}

class InventoryLog {
  String id;
  String date;
  String itemName;
  String stockDetails;

  InventoryLog({
    required this.id,
    required this.date,
    required this.itemName,
    required this.stockDetails,
  });

  factory InventoryLog.fromJson(Map<String, dynamic> json) => InventoryLog(
        id: json["id"] ?? '',
        date: json["date"] ?? '',
        itemName: json["itemName"] ?? '',
        stockDetails: json["stockDetails"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "itemName": itemName,
        "stockDetails": stockDetails,
      };
}

class LogEdit {
  String action;
  InventoryLog log;

  LogEdit({required this.action, required this.log});
}