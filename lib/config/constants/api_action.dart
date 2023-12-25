class ApiAction {
  static const String authentication = 'authentication';
  static const String assignedProps = 'assignedProps';
  static const String getPropNotes = 'propNotes';
  static const String propSavePropertyNote = 'propSavePropertyNote';
  static const String propInspectionDetails = 'propInspectionDetails';
  static const String propConstructionDetails = 'propConstructionDetails';
  static const String logout = 'logout';
  static const String propConstructionQCAndMIRFailDetails = 'propConstructionQCAndMIRFailDetails';
  static const String propSaveConstructionQCAndMIRFailInfo = 'propSaveConstructionQCAndMIRFailInfo';
  static const String propGetPhotoDDLOptions = 'propGetPhotoDDLOptions';
  static const String uploadDocManagerImage = 'uploadDocManagerImage';
  static const String propSaveConstructionStatusInfo = 'propSaveConstructionStatusInfo';
  static const String propConstructionStatusDetails = 'propConstructionStatusDetails';
  static const String saveInspectionRoom = 'saveInspectionRoom';
  static const String saveInspectionUtility = 'saveInspectionUtility';
  static const String saveInspectionRoomSquareFootage = 'saveInspectionRoomSquareFootage';
  static const String saveEstimateItem = 'saveEstimateItem';
}

class ResponseStatus {
  static const int quit = 221;
  static const int success = 200;
}

class ApiConsts {
  static const int offlineTake = 50;
}
