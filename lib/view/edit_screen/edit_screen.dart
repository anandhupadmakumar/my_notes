import 'package:flutter/material.dart';
import 'package:note_app/controller/home_controller.dart';
import 'package:note_app/model/my_note_model.dart';
import 'package:note_app/view/widgets/utils_widgets.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key, required this.title, this.index = 0});
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                final data = MyNoteModel(
                    id: 1,
                    title: noteController.titleController.text,
                    content: noteController.contentController.text);
                if (title == 'Edit') {
                  noteController.updateNote(data, index);
                } else {
                  noteController.addNoteList(data);
                }
              },
              icon: const Icon(
                Icons.save,
                color: Colors.white,
              ))
        ],
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              TextFormField(
                controller: noteController.titleController,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: Utils.findratio(height: 18, width: 18).width),
              ),
              TextFormField(
                controller: noteController.contentController,
                maxLines: 1000,
                decoration: const InputDecoration(isDense: false),
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: Utils.findratio(height: 18, width: 18).width),
              )
            ],
          ),
        ),
      ),
    );
  }
}
