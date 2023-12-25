import 'package:drift/drift.dart';
import 'package:flutter_starter/platform/database/tables/mixin.dart';

@DataClassName('SyncDataTable')
class SyncDatas extends Table with AutoIncrementingPrimaryKey {
  TextColumn get objectID => text().nullable()();
  TextColumn get className => text()();
  TextColumn get data => text().nullable()();
  BlobColumn get blobImage => blob().nullable()();
  DateTimeColumn get createTime => dateTime()();
  TextColumn get action => text()();
  TextColumn get parameter => text().nullable()();
  TextColumn get method => text().nullable()();
}
