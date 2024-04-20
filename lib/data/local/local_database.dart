import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/product_model.dart';
import '../model/product_model_constants.dart';

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

    await db.execute('''CREATE TABLE ${ProductModelConstants.tableName} (
      ${ProductModelConstants.id} $idType,
      ${ProductModelConstants.qrCode} $textType,
      ${ProductModelConstants.description} $textType,
      ${ProductModelConstants.name} $textType

    )''');
  }

  //------------------TASKS--------------------------------------
  static Future<ProductModel> insertTask(ProductModel productModel) async {
    debugPrint("INITIAL ID:${productModel.id}");
    final db = await databaseInstance.database;
    int savedTaskID =
    await db.insert(ProductModelConstants.tableName, productModel.toJson());
    debugPrint("SAVED ID:$savedTaskID");
    return productModel.copyWith(id: savedTaskID);
  }

  static Future<List<ProductModel>> getAllTasks() async {
    final db = await databaseInstance.database;
    String orderBy = "${ProductModelConstants.id} DESC"; //"_id DESC"
    List json = await db.query(ProductModelConstants.tableName, orderBy: orderBy);
    return json.map((e) => ProductModel.fromJson(e)).toList();
  }

  static Future<int> deleteTask(int id) async {
    final db = await databaseInstance.database;
    int deletedId = await db.delete(
      ProductModelConstants.tableName,
      where: "${ProductModelConstants.id} = ?",
      whereArgs: [id],
    );
    return deletedId;
  }

  // static Future<int> updateTask(
  //     TaskModel taskModel,
  //     int id,
  //     ) async {
  //   debugPrint("UPDATE: ${taskModel.toJson()} ${taskModel.id}");
  //
  //   final db = await databaseInstance.database;
  //   int updatedTaskId = await db.update(
  //     TaskModelConstants.tableName,
  //     taskModel.toJson(),
  //     where: "${TaskModelConstants.id} = ?",
  //     whereArgs: [id],
  //   );
  //   return updatedTaskId;
  // }

  // static Future<int> updateTaskStatus({
  //   required String newStatus,
  //   required int taskId,
  // }) async {
  //   final db = await databaseInstance.database;
  //   int updatedTaskId = await db.update(
  //     TaskModelConstants.tableName,
  //     {TaskModelConstants.status: newStatus},
  //     where: "${TaskModelConstants.id} = ?",
  //     whereArgs: [taskId],
  //   );
  //   return updatedTaskId;
  // }

  // static Future<List<TaskModel>> searchTasks(String query) async {
  //   final db = await databaseInstance.database;
  //   var json = await db.query(
  //     TaskModelConstants.tableName,
  //     where: "${TaskModelConstants.title} LIKE ?",
  //     whereArgs: ["$query%"],
  //   );
  //   return json.map((e) => TaskModel.fromJson(e)).toList();
  // }

//------------------CATEGORIES--------------------------------------

  // static Future<CategoryModel> insertCategory(
  //     CategoryModel categoryModel) async {
  //   debugPrint("INITIAL ID:${categoryModel.id}");
  //   final db = await databaseInstance.database;
  //   int savedCategoryID = await db.insert(
  //       CategoryModelConstants.tableName, categoryModel.toJson());
  //   debugPrint("SAVED ID:$savedCategoryID");
  //   return categoryModel.copyWith(id: savedCategoryID);
  // }

  // static Future<List<CategoryModel>> getAllCategories() async {
  //   final db = await databaseInstance.database;
  //   String orderBy = "${CategoryModelConstants.id} DESC"; //"_id DESC"
  //   List json =
  //   await db.query(CategoryModelConstants.tableName, orderBy: orderBy);
  //   return json.map((e) => CategoryModel.fromJson(e)).toList();
  // }
  //
  // static Future<CategoryModel> getCategoryByName(String name) async {
  //   final db = await databaseInstance.database;
  //   String orderBy = "${CategoryModelConstants.id} DESC"; //"_id DESC"
  //   List json = await db.query(
  //     CategoryModelConstants.tableName,
  //     orderBy: orderBy,
  //     where: "${CategoryModelConstants.name} = ?",
  //     whereArgs: [name],
  //   );
  //   return json.map((e) => CategoryModel.fromJson(e)).toList()[0];
  // }

  // static Future<CategoryModel> getCategoryById(int id) async {
  //   final db = await databaseInstance.database;
  //   String orderBy = "${CategoryModelConstants.id} DESC"; //"_id DESC"
  //   List json = await db.query(
  //     CategoryModelConstants.tableName,
  //     orderBy: orderBy,
  //     where: "${CategoryModelConstants.id} = ?",
  //     whereArgs: [id],
  //   );
  //   return json.map((e) => CategoryModel.fromJson(e)).toList()[0];
  // }

  void function() {
    //000000 => Color(0xFF000000)
    var color = Colors.black;
    Color(int.parse("000000"));
    color.value.toString();
  }
}
