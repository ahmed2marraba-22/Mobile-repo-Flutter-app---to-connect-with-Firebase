import 'dart:io';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'field_database.dart';

Future<FieldDatabase> openFieldDatabase() async {
  final dir = await getApplicationDocumentsDirectory();
  final file = File(p.join(dir.path, 'geoflow_field.sqlite'));
  return FieldDatabase(NativeDatabase.createInBackground(file));
}
