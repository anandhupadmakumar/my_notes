import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/main.dart';

import 'package:note_app/view/edit_screen/edit_screen.dart';
import 'package:note_app/view/widgets/utils_widgets.dart';

import '../../controller/home_controller.dart';
import '../../core/constants/constants.dart';
import '../widgets/home_tile_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log(noteDb.isEmpty.toString());
    return SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              homeTitle,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
          ),
          body: SizedBox(
            child: GetBuilder<HomeController>(
                init: HomeController(),
                builder: (noteData) {
                  return noteDb.isEmpty
                      ? const Center(
                          child: Text('Add new notes'),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(
                              left:
                                  Utils.findratio(height: 20, width: 20).width,
                              right:
                                  Utils.findratio(height: 20, width: 20).width,
                              top: Utils.findratio(height: 20, width: 20)
                                  .height),
                          itemBuilder: (context, index) {
                            return HomeTileWidget(
                              index: index,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height:
                                  Utils.findratio(height: 20, width: 20).height,
                            );
                          },
                          itemCount: noteData.noteList.length,
                        );
                }),
          ),
          floatingActionButton: SizedBox(
            height: Utils.findratio(height: 60, width: 60).height,
            width: Utils.findratio(height: 60, width: 60).width,
            child: FloatingActionButton(
              onPressed: () {
                noteController.contentController.clear();
                noteController.titleController.clear();

                Get.to(() => const EditScreen(
                      title: addScreenTitle,
                    ));
              },
              child: Icon(
                Icons.add,
                size: Utils.findratio(height: 38, width: 38).width,
              ),
            ),
          ),
        );
      }),
    );
  }
}
