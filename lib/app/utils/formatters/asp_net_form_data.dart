import 'package:dio/dio.dart';

enum AspNetCase { unchanged, pascal }

class AspNetFormData {

  final FormData form;
  final AspNetCase caseStyle;

  AspNetFormData._(this.form, this.caseStyle);

  static FormData fromMap(Map<String, dynamic> data, {AspNetCase caseStyle = AspNetCase.pascal}) {
    return AspNetFormData._(FormData(), caseStyle)._fromMap(data);
  }

  FormData _fromMap(Map<String, dynamic> data){
    data.forEach((k, v) {
      final k2 = transformKey(k);
      flatten(v, k2);
    });

    return form;
  }

  void addField(String key, Object value) {
    form.fields.add(MapEntry(key, value.toString()));
  }

  String transformKey(String key) {
    if (caseStyle == AspNetCase.unchanged) return key;
    // PascalCase simples: primeira letra maiúscula
    // (Se quiser algo mais sofisticado, adapte aqui)
    if (key.isEmpty) return key;
    return key[0].toUpperCase() + key.substring(1);
  }

  // Tenta extrair Map de objetos com toJson/toMap
  Map<String, dynamic>? tryToMap(dynamic obj) {
    if (obj is Map<String, dynamic>) return obj;
    try {
      final toJson = (obj as dynamic).toJson;
      final map = (toJson as Function)();
      if (map is Map<String, dynamic>) return map;
    } catch (_) {}
    try {
      final toMap = (obj as dynamic).toMap;
      final map = (toMap as Function)();
      if (map is Map<String, dynamic>) return map;
    } catch (_) {}
    return null;
  }

  void flatten(dynamic value, String prefix) {
    if (value == null) return;

    // Arquivo → files
    if (value is MultipartFile) {
      form.files.add(MapEntry(prefix, value));
      return;
    }

    // Lista → [i]
    if (value is List) {
      for (var i = 0; i < value.length; i++) {
        final idxPrefix = '$prefix[$i]';
        flatten(value[i], idxPrefix);
      }
      return;
    }

    // Map (ou objeto com toJson/toMap)
    final asMap = value is Map ? value : tryToMap(value);
    if (asMap != null) {
      asMap.forEach((k, v) {
        final k2 = transformKey(k);
        final nextPrefix = prefix.isEmpty ? k2 : '$prefix.$k2';
        flatten(v, nextPrefix);
      });
      return;
    }

    // Primitivo → field
    addField(prefix, value);

  }
}