import 'package:drift/drift.dart';
import 'package:flutter_starter/platform/database/database.dart';
import 'package:injectable/injectable.dart';

part 'sync_data_dao.g.dart';

@Injectable()
@DriftAccessor(tables: [SyncDataTable], queries: {'count': 'SELECT COUNT(*) FROM sync_datas;'})
class SyncDatasDao extends DatabaseAccessor<AppDatabase> with _$SyncDatasDaoMixin {
  SyncDatasDao(AppDatabase db) : super(db);

  Future<List<SyncDataTable>> getSyncData() => select(db.syncDatas).get();
  Future<int> getTotalRecords() => count().getSingle();
  Future deleteSyncData(SyncDataTable syncDataTable) => delete(db.syncDatas).delete(syncDataTable);
  Future deleteSyncDataTable() => delete(db.syncDatas).go();
  Future updateSyncData(SyncDataTable syncDataTable) => update(db.syncDatas).replace(syncDataTable);

  Future<int> insertSyncData(
      {required String className,
      String? data,
      Uint8List? image,
      required DateTime createTime,
      String? objectID,
      required String action,
      String? parameter,
      String? method}) {
    return db.syncDatas.insertOne(SyncDatasCompanion.insert(
      className: className,
      data: Value(data),
      blobImage: Value(image),
      createTime: createTime,
      objectID: Value(objectID),
      action: action,
      parameter: Value(parameter),
      method: Value(method),
    ));
  }
}
