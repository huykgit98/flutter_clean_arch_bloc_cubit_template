import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../config/themes/pallete.dart';
import '../../config/themes/space_distance.dart';
import '../../gen/fonts.gen.dart';
import '../../platform/models/file_select.dart';

class DialogUtils {
  static final DialogUtils _instance = DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static _getTitle(BuildContext context, String? title) {
    final defaultTitle = title?.isNotEmpty ?? false ? title : AppLocalizations.of(context)?.appTitle ?? '';
    return Text(defaultTitle!,
        style: Theme.of(context).textTheme.headline6?.apply(fontFamily: FontFamily.sourceSansProBold));
  }

  static _getMessage(BuildContext context, String? message) {
    return message?.isNotEmpty ?? false ? Text(message!, style: Theme.of(context).textTheme.titleMedium) : null;
  }

  static _getOKButton(BuildContext context, String? okTitle, VoidCallback? onConfirm) {
    return TextButton(
      child: Text(okTitle ?? AppLocalizations.of(context)?.ok ?? '',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.apply(fontFamily: FontFamily.sourceSansProBold, color: Colors.blue)),
      onPressed: () {
        Navigator.pop(context);
        if (onConfirm != null) {
          onConfirm();
        }
      },
    );
  }

  static _getCancelButton(BuildContext context, String? cancelTitle, VoidCallback? onCancel) {
    return TextButton(
      child: Text(cancelTitle ?? AppLocalizations.of(context)?.cancel ?? '',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.apply(fontFamily: FontFamily.sourceSansProBold, color: Colors.red)),
      onPressed: () {
        Navigator.pop(context);
        if (onCancel != null) {
          onCancel();
        }
      },
    );
  }

  static void showAlertDialog(BuildContext context,
      {String? title, String? message, String? okTitle, VoidCallback? onConfirm}) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: _getTitle(context, title),
              content: _getMessage(context, message),
              actions: <Widget>[
                _getOKButton(context, okTitle, onConfirm),
              ],
            ));
  }

  static void showConfirmDialog(BuildContext context,
      {String? title,
      String? message,
      String? okTitle,
      String? cancelTitle,
      VoidCallback? onConfirm,
      VoidCallback? onCancel}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: _getTitle(context, title),
            content: _getMessage(context, message),
            actions: <Widget>[
              _getCancelButton(context, cancelTitle, onCancel),
              _getOKButton(context, okTitle, onConfirm),
            ],
          );
        });
  }

  static void showImagePicker(
      BuildContext mainContext, ValueChanged<List<FileSelect>> onSuccess, VoidCallback onFailure,
      {bool isSingleFile = false, String? title}) {
    final ImagePicker picker = ImagePicker();

    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      context: mainContext,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              const SizedBox(
                width: AppSpaceDistance.sp16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpaceDistance.sp16),
                child: Row(
                  children: [
                    Text(title ?? (AppLocalizations.of(context)?.chooseImage ?? ''),
                        style: Theme.of(context).textTheme.titleMedium),
                    const Spacer(),
                    TextButton(
                      onPressed: () => onFailure(),
                      child: Text(
                        AppLocalizations.of(context)?.cancel ?? '',
                        style: Theme.of(context).textTheme.titleMedium?.apply(color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: Text(
                  AppLocalizations.of(context)?.camera ?? '',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                onTap: () async {
                  try {
                    final XFile? pickedFile = await picker.pickImage(
                      source: ImageSource.camera,
                      maxWidth: 1000,
                      maxHeight: null,
                      imageQuality: 50,
                    );
                    if (pickedFile != null) {
                      final fileSelected = <FileSelect>[];
                      fileSelected.add(FileSelect(file: pickedFile, isSelected: false));
                      onSuccess(fileSelected);
                    } else {
                      onFailure();
                    }
                  } catch (error) {
                    Navigator.pop(context);
                    if (error is PlatformException) {
                      DialogUtils.showAlertDialog(
                        context,
                        message: error.message,
                        onConfirm: () => {Navigator.of(context).pop()},
                      );
                    }
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(
                  AppLocalizations.of(context)?.gallery ?? '',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                onTap: () async {
                  try {
                    List<XFile>? pickedFileList = [];
                    if (isSingleFile == false) {
                      pickedFileList = await picker.pickMultiImage(
                        maxWidth: 1000,
                        maxHeight: null,
                        imageQuality: 50,
                      );
                    } else {
                      XFile? pickedFile = await picker.pickImage(
                        source: ImageSource.gallery,
                        maxWidth: 1000,
                        maxHeight: null,
                        imageQuality: 50,
                      );
                      if (pickedFile != null) {
                        pickedFileList.add(pickedFile);
                      }
                    }
                    if (pickedFileList != null) {
                      final fileSelected = <FileSelect>[];
                      fileSelected.addAll(pickedFileList.map((e) => FileSelect(file: e, isSelected: false)).toList());
                      onSuccess(fileSelected);
                    } else {
                      onFailure();
                    }
                  } catch (error) {
                    Navigator.pop(context);
                    if (error is PlatformException) {
                      DialogUtils.showAlertDialog(
                        context,
                        message: error.message,
                        onConfirm: () => {Navigator.of(context).pop()},
                      );
                    }
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  static CancelFunc showToast(String message, {Color? contentColor}) {
    return BotToast.showText(
        text: message,
        contentColor: contentColor ?? Palette.complete,
        contentPadding: const EdgeInsets.all(AppSpaceDistance.sp16));
  }

  static showPickerModal(BuildContext context, List<String> options, {PickerConfirmCallback? onConfirm}) {
    Picker(
            adapter: PickerDataAdapter<String>(pickerdata: options),
            changeToFirst: true,
            hideHeader: false,
            cancelText: AppLocalizations.of(context)?.cancel ?? '',
            confirmText: AppLocalizations.of(context)?.done ?? '',
            onConfirm: onConfirm)
        .showModal(context);
  }
}
