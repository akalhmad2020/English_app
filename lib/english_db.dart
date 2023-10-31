

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class EnglishDb {

  static Database? _db ;

  Future<Database?> getDatabase () async{

    _db ??= await initEnglishDb();

    return _db;
  }


  initEnglishDb ()async {

    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'english_db.db');
    Database database = await openDatabase(path,onCreate: _onCreate , version: 1);

    return database;
  }

  _onCreate(Database db , int version ){
    db.execute('''
     CREATE TABLE saved_words (
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
    List<Map>? response = await myDb!.query('saved_words');
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
    int  response = await myDb!.insert('saved_words' , data);

    return response;
  }

  Future<int> deleteWord({required String en_word}) async {
    final Database? db = await getDatabase();
    return await db!.delete('saved_words', where: 'en_word = ?', whereArgs: [en_word]);
  }

  Future<bool> searchWord({required String en_word}) async {
    final Database? db = await getDatabase();
    List<Map>?  result =  await db!.query('saved_words', where: 'en_word = ?', whereArgs: [en_word]);

    return result.isNotEmpty ;
  }




}