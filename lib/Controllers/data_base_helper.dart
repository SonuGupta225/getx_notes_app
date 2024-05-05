import 'package:get/get.dart';
import 'package:getx_notes_app/Database/db_helper.dart';
import 'package:getx_notes_app/Models/notes_model.dart';

class DatabaseHelper extends GetxController {
  var notes = <NotesModel>[].obs;

  final DbHelper dbHelper = Get.put(DbHelper());

  Future<void> addNotes(NotesModel newnote) async {
    await dbHelper.addNotes(newnote);
    notes.add(newnote);
  }

  Future<void> fetchNotes() async {
    await dbHelper.initDb();
    notes.assignAll(await dbHelper.getNotes());
  }
}
