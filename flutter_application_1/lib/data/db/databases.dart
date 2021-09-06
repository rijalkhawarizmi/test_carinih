import 'dart:convert';
import 'package:flutter_application_1/data/models/note_models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('notes.db');

    return _database!;
  }

  Future<Database> _initDB(String filepath) async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, filepath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';

    final textType = 'TEXT NOT NULL';

    await db.execute('''CREATE TABLE  $tableData (
      ${ResultField.id} $idType,
      ${ResultField.title} $textType,
      ${ResultField.desc} $textType
    )''');
  }

  Future<Note> create(Note note) async {
    final db = await instance.database;
    // final json = note.toJson();
    // final columns='${NoteField.title},${NoteField.description},${NoteField.time}';
    // final values='${json[NoteField.title]},${json[NoteField.description]},${json[NoteField.time]}';
    // final id=await db.rawInsert('INSERT INTO table_name ');
    final id = await db.insert(tableData, note.toJson());
    return note.copy(id: id);
  }

  Future<Note> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(tableData,
        columns: ResultField.values,
        where: '${ResultField.id}=?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw Exception(' $id not found');
    }
  }

  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;

    // final orderBy = '${ResultField.time} ASC';

    final result = await db.query(tableData);

    List<String> comments = ["1st", "2nd", "3rd"];
    Map<String, dynamic> args = {"comments": comments};
    String url = "myurl.com";
    var body = json.encode(args);
    print(body);
    return result.map((e) => Note.fromJson(e)).toList();
  }

  Future<bool> update(Note resultOffline) async {
    final db = await instance.database;

    db.update(tableData, resultOffline.toJson(),
        where: '${ResultField.id}= ?', whereArgs: [resultOffline.id]);

    return Future.value(true);
  }

  Future<bool> delete(int id) async {
    final db = await instance.database;

    db.delete(tableData, where: '${ResultField.id} = ?', whereArgs: [id]);

    return Future.value(true);
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
