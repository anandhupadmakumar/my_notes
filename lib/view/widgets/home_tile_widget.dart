import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/home_controller.dart';

import '../edit_screen/edit_screen.dart';
import 'utils_widgets.dart';

class HomeTileWidget extends StatelessWidget {
  final int index;
  const HomeTileWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GetBuilder<HomeController>(builder: (data) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.primaries[index],
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(45))),
              width: Utils.findratio(height: 100, width: 414).width,
              height: Utils.findratio(height: 100, width: 414).height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Utils.findratio(height: 200, width: 200).width,
                        child: Text(
                          data.noteList[index].title.toString(),
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize:
                                  Utils.findratio(height: 18, width: 18).width,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Row(children: [
                        CircleAvatar(
                          child: IconButton(
                              onPressed: () {
                                noteController.contentController.text =
                                    noteController.noteList[index].content
                                        .toString();
                                noteController.titleController.text =
                                    noteController.noteList[index].title
                                        .toString();
                                Get.to(EditScreen(
                                  title: 'Edit',
                                  index: index,
                                ));
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.primaries[index],
                              )),
                        ),
                        SizedBox(
                          width: Utils.findratio(height: 10, width: 10).width,
                        ),
                        CircleAvatar(
                          child: IconButton(
                              onPressed: () {
                                data.deleteNote(
                                    data.noteList[index].id!, index);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.primaries[index],
                              )),
                        )
                      ]),
                    ],
                  ),
                  SizedBox(
                    width: Utils.findratio(height: 200, width: 200).width,
                    height: Utils.findratio(height: 20, width: 20).height,
                    child: Text(
                      data.noteList[index].content.toString(),
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize:
                              Utils.findratio(height: 16, width: 18).width,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
