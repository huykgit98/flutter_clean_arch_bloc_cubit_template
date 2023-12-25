import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class SecureStorage {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  SecureStorage();

  Future<String?> read(String key) async {
    return await secureStorage.read(key: key);
  }

  Future<Map<String, String>> readAll(String key) async {
    return await secureStorage.readAll();
  }

  Future<void> delete(String key) async {
    await secureStorage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await secureStorage.deleteAll();
  }

  Future<void> write(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<void> writeInt(String key, int value) async {
    await secureStorage.write(key: key, value: value.toString());
  }

  Future<int> readInt(String key) async {
    String? value = await secureStorage.read(key: key);
    if (value != null) {
      return int.parse(value);
    }
    return -1;
  }

  Future<void> writeBool(String key, bool value) async {
    await secureStorage.write(key: key, value: value == true ? 'true' : 'false');
  }

  Future<bool?> readBool(String key) async {
    String? value = await secureStorage.read(key: key);
    if (value != null) {
      return value == 'true';
    }
    return null;
  }
}
