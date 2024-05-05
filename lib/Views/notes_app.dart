import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_notes_app/Controllers/data_base_helper.dart';
import 'package:getx_notes_app/Views/add_screen.dart';

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  final DatabaseHelper databaseHelper = Get.put(DatabaseHelper());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Notesapp'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddScreen());
          },
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: databaseHelper.notes.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text("${index + 1}"),
              title: Text("${databaseHelper.notes[index].title}"),
              subtitle: Text(databaseHelper.notes[index].desc),
            );
          },
        ),
      ),
    );
  }
}
