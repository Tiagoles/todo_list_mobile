import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/exceptions/core_exceptions.dart';

part 'anexo.g.dart';

@JsonSerializable(createToJson: false)
class Anexo{
  final int? id;
  final String name;
  final String path;
  final String type;
  final int size;
  final String geolocation;
  final DateTime createdAt;

  Anexo({
    this.id,
    required this.name,
    required this.path,
    required this.type,
    required this.size,
    required this.geolocation,
    required this.createdAt,
  });

  factory Anexo.fromJson(Map<String, dynamic> json) => _$AnexoFromJson(json);

  AsyncResult<File> toFile() async {
    final file = File(path);
    if(await file.exists()) return Success(file);
    return Failure(AppFileSystemException('Arquivo não encontrado: $path'));
  }

  Map<String, dynamic> get metadata{
    return {
      'name': name,
      'type': type,
      'size': size,
      'geolocation': geolocation,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  AsyncResult<MultipartFile> toMultipartFile() async {
    return toFile().flatMap((file) async {
      return Success(await MultipartFile.fromFile(
        file.path,
        filename: name,
        contentType: MediaType.parse(type),
      ));
    });
  }

  @override
  String toString() {
    return 'Anexo{id: $id, name: $name, url: $path, type: $type, size: $size}';
  }
}