// To parse this JSON data, do
//
//     final showFile = showFileFromJson(jsonString);

import 'dart:convert';

ShowFile showFileFromJson(String str) => ShowFile.fromJson(json.decode(str));

class ShowFile {
  ShowFile({
    this.message,
    this.result,
  });

  String? message;
  Result? result;

  factory ShowFile.fromJson(Map<String, dynamic> json) => ShowFile(
        message: json['message'],
        result: Result.fromJson(json['result']),
      );
}

class Result {
  Result({
    this.fileId,
    this.file,
  });

  int? fileId;
  String? file;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        fileId: json['file_id'],
        file: json['file'],
      );
}
