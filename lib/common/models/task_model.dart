// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
  int? id;
  String? title;
  String? desc;
  String? date;
  int? isCompleted;
  String? startTime;
  String? endTime;
  int? remind;
  String? repeat;

  Task({
    this.id,
    this.title,
    this.desc,
    this.date,
    this.isCompleted,
    this.startTime,
    this.endTime,
    this.remind,
    this.repeat,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"],
    title: json["title"],
    desc: json["desc"],
    date: json["date"],
    isCompleted: json["isCompleted"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    remind: json["remind"],
    repeat: json["repeat"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "desc": desc,
    "date": date,
    "isCompleted": isCompleted,
    "startTime": startTime,
    "endTime": endTime,
    "remind": remind,
    "repeat": repeat,
  };
}
