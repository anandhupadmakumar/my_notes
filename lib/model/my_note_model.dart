import 'package:hive/hive.dart';
 part 'my_note_model.g.dart';

@HiveType(typeId: 1)
class MyNoteModel extends HiveObject {
  MyNoteModel({required this.id,required this.title,required this.content});
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? content;
}
