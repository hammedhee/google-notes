import 'package:hive/hive.dart';
     part 'notemode.g.dart';
     
@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? subNote;
  Note({required this.title, required this.subNote});
}
