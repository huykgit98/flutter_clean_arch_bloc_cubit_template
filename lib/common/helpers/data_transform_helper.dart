class DataTransformHelper {
  static List<bool> getTwoRadioValues(bool? value) {
    if (value == true) {
      return [true, false];
    } else if (value == false) {
      return [false, true];
    }
    return [false, false];
  }

  static List<bool> getRadioListValues(int length, int? value) {
    if (value == null) {
      return List<bool>.generate(length, (index) => false);
    }
    return List<bool>.generate(length, (index) => index == value - 1 ? true : false);
  }
}
