// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_data_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$SyncDatasDaoMixin on DatabaseAccessor<AppDatabase> {
  Selectable<int> count() {
    return customSelect('SELECT COUNT(*) AS _c0 FROM sync_datas',
        variables: [],
        readsFrom: {}).map((QueryRow row) => row.read<int>('_c0'));
  }
}
