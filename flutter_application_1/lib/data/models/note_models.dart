// // To parse this JSON data, do
// //
// //     final dataModel = dataModelFromJson(jsonString);

// import 'dart:convert';

// Note dataModelFromJson(String str) =>
//     Note.fromJson(json.decode(str));

// String dataModelToJson(Note data) => json.encode(data.toJson());

// final tableData = 'tableNote';

// class ResultField {
//   static final List<String> values = [
//     id,
//     title,
//     description,
//     number,
//     isImportant,
//     dateTime
//   ];
//   static final String id = '_id';
//   static final String title = 'title';
//   static final String description = 'description';
//   static final String number = 'number';
//   static final String isImportant = 'isImportant';
//   static final String dateTime = 'dateTime';
// }

// class Note {
//   final int id;
//   final String title;
//   final String description;
//   final int number;
//   final bool isImportant;
//   final DateTime dateTime;

//   Note(
//       { required this.id,
//        required this.title,
//        required this.description,
//        required this.number,
//        required this.dateTime,
//        required this.isImportant});
//   Note copy({
//      int? id,
//      String? title,
//      String? description,
//      int? number,
//      bool? isImportant,
//      DateTime? dateTime,
//   }) =>
//       Note(
//           id: id ?? this.id,
//           title: title ?? this.title,
//           description: description ?? this.description,
//           number: number ?? this.number,
//           isImportant: isImportant ?? this.isImportant,
//           dateTime: dateTime ?? this.dateTime);

//   static Note fromJson(Map<String, Object?> json) => Note(
//         id: json[ResultField.id] as int,
//         title: json[ResultField.title] as String,
//         description: json[ResultField.description] as String,
//         isImportant: json[ResultField.isImportant] == 1,
//         number: json[ResultField.number] as int,
//         dateTime: json[ResultField.dateTime] as DateTime,
//       );
//   Map<String, Object?> toJson() => {
//         ResultField.id: id,
//        ResultField.title:title,
//        ResultField.description:description,
//        ResultField.number:number,
//        ResultField.isImportant:isImportant?1:0,
//        ResultField.dateTime:dateTime,
//       };
// }

final tableData = 'data';

class ResultField {
  static final List<String> values = [
    id,
    title,
    desc,
  ];
  static final String id = '_id';
  static final String title = 'title';
  static final String desc = 'desc';
}

class Note {
  int? id;
  String? title;
  String? desc;

  Note({
    this.id,
    this.title,
    this.desc,
  });
  Note copy({
    int? id,
    String? title,
    String? desc,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        desc: desc ?? this.desc,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[ResultField.id] as int,
        title: json[ResultField.title] as String,
        desc: json[ResultField.desc] as String,
      );
  Map<String, Object?> toJson() => {
        ResultField.id: id,
        ResultField.title: title,
        ResultField.desc: desc,
      };
}
