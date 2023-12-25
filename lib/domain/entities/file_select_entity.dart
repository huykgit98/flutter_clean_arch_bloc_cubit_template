import 'package:image_picker/image_picker.dart';

abstract class FileSelectEntity {
  final XFile file;
  late bool isSelected;

  FileSelectEntity({required this.file, this.isSelected = false});
}
