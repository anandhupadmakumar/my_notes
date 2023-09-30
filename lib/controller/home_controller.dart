import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/main.dart';
import 'package:note_app/model/my_note_model.dart';

final noteController = Get.put(HomeController());

class HomeController extends GetxController {
  List<MyNoteModel> noteList = <MyNoteModel>[].obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  @override
  void onInit() {
    super.onInit();

    // noteList.addAll(noteDb.values);
  }

  Future<void> addNoteList(MyNoteModel data) async {
    final int id = await noteDb.add(data);
    final MyNoteModel idData = MyNoteModel(
      id: id,
      content: data.content,
      title: data.title,
    );
    await noteDb.put(id, idData);

    noteList.add(idData);
    Get.back();

    update();
    log(id.toString());
  }

  void deleteNote(int id, int index) {
    noteDb.delete(id);
    noteList.removeAt(index);
    update();
  }

  Future<void> updateNote(MyNoteModel editStudent, int index) async {
    await noteDb.put(noteController.noteList[index].id, editStudent);
    noteList.removeAt(index);
    noteList.insert(index, editStudent);
    update();
  }
}
