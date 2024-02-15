import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
@HiveType(typeId: 01)
class Todo{
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? desc;
  @HiveField(2)
  bool? isDone;
  @HiveField(3)
  int? priority;
 @HiveField(4)
  String? id;
 

  Todo({

    this.title,
    this.desc,
    this.isDone,
    this.priority,
    this.id

  });
  
}

// dart run build_runner watch --delete-conflicting-outputs