abstract class Synchronize {
  Future<void> pullData(); // pull data when opening the app
  Future<void> pushData(); // push local data to server when internet back to online
  Future<void> pullMasterData(); // rarely change, maybe pull after login
}