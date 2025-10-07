import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:smaservicos/app/data/models/objectbox/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

const _path = 'objectbox';

class ObjectBox {
  late final Store store;
  late final Admin? admin;

  ObjectBox._create(this.store){
    admin = kDebugMode && Admin.isAvailable() ? Admin(store) : null;
  }

  static Future<ObjectBox> create() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = '${dir.path}/$_path';

    // dropDatabase();

    final store = await openStore(directory: dbPath);

    return ObjectBox._create(store);
  }

  static Future<void> dropDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = '${dir.path}/$_path';

    final dbDir = Directory(dbPath);
    if (await dbDir.exists()) {
      await dbDir.delete(recursive: true);
    }
  }

}