

import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class AnotherWords {

  static Database? _db ;

  Future<Database?> getDatabase () async{

    _db ??= await initEnglishDb();

    return _db;
  }


  initEnglishDb ()async {

    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'another_words.db');
    Database database = await openDatabase(path,onCreate: _onCreate , version: 1);

    return database;
  }

  _onCreate(Database db , int version ){
    db.execute('''
     CREATE TABLE words (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        en_word TEXT,
        ar_word TEXT,
        image TEXT,
        sound TEXT,
        id_word INTEGER
      )
    ''');
  }

  Future< List<Map>? > readWords() async{
    Database? myDb = await getDatabase();
    List<Map>? response = await myDb!.query('words');
    return response;
  }

  Future<int> insertWord({required String englishWord , required String arabicWord  ,
    required String image , required String sound , required int id
  } ) async{
    Database? myDb = await getDatabase();
    Map<String, dynamic> data = {
      'en_word': englishWord,
      'ar_word': arabicWord,
      'image': image,
      'sound': sound,
      'id_word': id,
    };
    int  response = await myDb!.insert('words' , data);

    return response;
  }

  Future<int> deleteWord({required String en_word}) async {
    final Database? db = await getDatabase();
    return await db!.delete('words', where: 'en_word = ?', whereArgs: [en_word]);
  }

  Future<bool> searchWord({required String en_word}) async {
    final Database? db = await getDatabase();
    List<Map>?  result =  await db!.query('words', where: 'en_word = ?', whereArgs: [en_word]);

    return result.isNotEmpty ;
  }

  Future<bool> searchById({required int id }) async {
    final Database? db = await getDatabase();
    List<Map>?  result =  await db!.query('words', where: 'id = ?', whereArgs: [id]);

    return result.isNotEmpty ;
  }



}