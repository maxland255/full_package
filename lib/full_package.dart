import 'package:full_package/class.dart';

import 'full_package_platform_interface.dart';

class FullPackage {
  Future<String?> getPlatformVersion() {
    return FullPackagePlatform.instance.getPlatformVersion();
  }

  Future<AppInformation?> getAppInformation() async {
    return FullPackagePlatform.instance.getAppInformation();
  }

  Future<String?> alertMessage(
      String title, String message, AlertStyle alertStyle) async {
    return FullPackagePlatform.instance
        .alertMessage(title, message, alertStyle);
  }

  Future<AlertReturn?> alertButton(String title, String message,
      AlertStyle alertStyle, List<String> button) async {
    return FullPackagePlatform.instance
        .alertButton(title, message, alertStyle, button);
  }

  Future<List<dynamic>?> filePicker(
      String prompt,
      String message,
      List<String> allowedFileTypes,
      bool canChooseFiles,
      bool canChooseDirectories,
      bool allowsMultipleSelection,
      bool canCreateDirectories) async {
    return FullPackagePlatform.instance.filePicker(
      prompt,
      message,
      allowedFileTypes,
      canChooseFiles,
      canChooseDirectories,
      allowsMultipleSelection,
      canCreateDirectories,
    );
  }

  Future<bool?> openAppSettingsURL() async {
    return FullPackagePlatform.instance.openAppSettingsURL();
  }

  Future<bool?> openNotificationSettingsURL() async {
    return FullPackagePlatform.instance.openNotificationSettingsURL();
  }
}
