import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_notes_app/Controllers/data_base_helper.dart';
import 'package:getx_notes_app/Models/notes_model.dart';
import 'package:getx_notes_app/Views/Widgets/uIhelper.dart';
import 'package:sqflite/sqflite.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final DatabaseHelper databaseHelper = Get.put(DatabaseHelper());
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add data Screen'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Uihelper.CustomTextField(titleController, "Enter Title", Icons.title),
          Uihelper.CustomTextField(
              descController, "Enter Desc", Icons.description),
          ElevatedButton(
              onPressed: () {
                final newnote = NotesModel(
                    title: titleController.text.toString(),
                    desc: descController.text.toString());
                databaseHelper.addNotes(newnote);
                Get.back();
              },
              child: Text('Add Data'))
        ],
      ),
    );
  }
}
