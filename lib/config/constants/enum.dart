import 'package:json_annotation/json_annotation.dart';

enum AppMenu {
  @JsonValue(0)
  home,
  @JsonValue(1)
  map,
  @JsonValue(2)
  visit,
  @JsonValue(3)
  logout,
  @JsonValue(4)
  synchronize,
  @JsonValue(5)
  pushOfflineData,
}

enum Controls {
  utilities,
  meters,
  location,
  publicSewerOrPrivateSepticAnswers,
  lockBoxCode,
  dateOfInitialWalk,
  isThePropertyCurrentlyOccupiedAnswers,
  isPoolServiceRequiredAnswers,
  estimatedInstallYearOfExistingRoof,
  yearOfManufactureOfExistingHVACSystemOne,
  yearOfManufactureOfExistingHVACSystemTwo,
  yearOfManufactureOfExistingWaterHeater,
  isRepairsRequiredAnswers,
  isInspectionsRequiredAnswers,
  hasIllegalConnectionsAnswers,
  hasUnsafeConditionsAnswers,
  hasLockOnTheMetersOrTagsAnswers,
  photo,
}

enum Rooms {
  general,
  exterior,
  garage,
  foyer,
  familyRoom,
  diningRoom,
  breakfastRoom,
  kitchen,
  laundryRoom,
  formalLivingRoom,
  hallway,
  masterBedroom,
  guestBedroom,
  halfBath,
  masterBathroom,
  guestBathroom,
  basement;
}
