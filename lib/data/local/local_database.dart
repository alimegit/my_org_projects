import 'package:default_project/data/model/note_model.dart';
import 'package:default_project/data/model/note_model_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  //Step 1
  static final databaseInstance = LocalDatabase._();

  LocalDatabase._();

  factory LocalDatabase() {
    return databaseInstance;
  }

  //-----
  //Step 2
  Database? _database;

  //Step 3
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _init("todo.db");
      return _database!;
    }
  }

  //Step 4
  Future<Database> _init(String databaseName) async {
    //......Android/data
    String internalPath = await getDatabasesPath();
    //......Android/data/todo.db
    String path = join(internalPath, databaseName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  //--------------------------READY TO USE------------------------

  Future<void> _onCreate(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    await db.execute('''CREATE TABLE ${NoteConstants.tableName} (
      ${NoteConstants.id} $idType,
      ${NoteConstants.title} $textType,
      ${NoteConstants.text} $textType,
      ${NoteConstants.createDate} $textType,
      ${NoteConstants.color} $textType,
    )''');
  }

  //------------------TASKS--------------------------------------

  static Future<NoteModel> insertTask(NoteModel noteModel) async {
    debugPrint("INITIAL ID:${noteModel.id}");
    final db = await databaseInstance.database;
    int savedNoteId =
    await db.insert(NoteConstants.tableName, noteModel.toJson());
    debugPrint("SAVED ID:$savedNoteId");
    return noteModel.copyWith(id: savedNoteId);
  }

  static Future<List<NoteModel>> getAllNotes() async {
    final db = await databaseInstance.database;
    String orderBy = "${NoteConstants.id} DESC"; //"_id DESC"
    List json = await db.query(NoteConstants.tableName, orderBy: orderBy);
    return json.map((e) => NoteModel.fromJson(e)).toList();
  }

  static Future<int> deleteTask(int id) async {
    final db = await databaseInstance.database;
    int deletedId = await db.delete(
      NoteConstants.tableName,
      where: "${NoteConstants.id} = ?",
      whereArgs: [id],
    );
    return deletedId;
  }

  static Future<int> updateTask(
      NoteModel noteModel,
      int id,
      ) async {
    debugPrint("UPDATE: ${noteModel.toJson()} ${noteModel.id}");

    final db = await databaseInstance.database;
    int updatedTaskId = await db.update(
      NoteConstants.tableName,
      noteModel.toJson(),
      where: "${NoteConstants.id} = ?",
      whereArgs: [id],
    );
    return updatedTaskId;
  }

  // static Future<int> updateTaskStatus({
  //   required String newStatus,
  //   required int taskId,
  // }) async {
  //   final db = await databaseInstance.database;
  //   int updatedTaskId = await db.update(
  //     NoteConstants.tableName,
  //     {NoteConstants: newStatus},
  //     where: "${NoteConstants.id} = ?",
  //     whereArgs: [taskId],
  //   );
  //   return updatedTaskId;
  // }

  static Future<List<NoteModel>> searchNotes(String query) async {
    final db = await databaseInstance.database;
    var json = await db.query(
      NoteConstants.tableName,
      where: "${NoteConstants.title} LIKE ?",
      whereArgs: ["$query%"],
    );
    return json.map((e) => NoteModel.fromJson(e)).toList();
  }


  void function() {
    //000000 => Color(0xFF000000)
    var color = Colors.black;
    Color(int.parse("000000"));
    color.value.toString();
  }
}