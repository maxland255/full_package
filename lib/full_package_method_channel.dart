import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:full_package/class.dart';

import 'full_package_platform_interface.dart';

/// An implementation of [FullPackagePlatform] that uses method channels.
class MethodChannelFullPackage extends FullPackagePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('full_package');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<AppInformation?> getAppInformation() async {
    final appInformations =
        await methodChannel.invokeMethod<String>("getAppInformation");

    if (appInformations != null) {
      final AppInformation appInformation =
          AppInformation.fromJson(jsonDecode(appInformations));

      return appInformation;
    }

    return null;
  }

  @override
  Future<String?> alertMessage(
      String title, String message, AlertStyle alertStyle) async {
    final errorMessage = await methodChannel.invokeMethod<String?>(
      "alertMessage",
      {
        "title": title,
        "message": message,
        "alertStyle": alertStyle.name,
      },
    );

    return errorMessage;
  }

  @override
  Future<AlertReturn?> alertButton(String title, String message,
      AlertStyle alertStyle, List<String> button) async {
    final response = await methodChannel.invokeMethod(
      "alertButton",
      {
        "title": title,
        "message": message,
        "alertStyle": alertStyle.name,
        "button": button,
      },
    );

    if (response == "1000") {
      return AlertReturn(ButtonPressed.firstButton, null);
    } else if (response == "1001") {
      return AlertReturn(ButtonPressed.secondButton, null);
    } else if (response == "1002") {
      return AlertReturn(ButtonPressed.thirdButton, null);
    }

    return AlertReturn(null, response);
  }

  @override
  Future<List<dynamic>?> filePicker(
      String prompt,
      String message,
      List<String> allowedFileTypes,
      bool canChooseFiles,
      bool canChooseDirectories,
      bool allowsMultipleSelection,
      bool canCreateDirectories) async {
    final response = await methodChannel.invokeMethod<String>("filePicker", {
      "prompt": prompt,
      "message": message,
      "allowedFileTypes": allowedFileTypes,
      "canChooseFiles": canChooseFiles,
      "canChooseDirectories": canChooseDirectories,
      "allowsMultipleSelection": allowsMultipleSelection,
      "canCreateDirectories": canCreateDirectories,
    });

    if (response != null && response != "Error") {
      try {
        return jsonDecode(response);
      } catch (_) {
        return null;
      }
    }

    return null;
  }

  @override
  Future<bool?> openAppSettingsURL() async {
    final opened = await methodChannel.invokeMethod<bool>("openAppSettingsURL");
    return opened;
  }

  @override
  Future<bool?> openNotificationSettingsURL() async {
    final opened =
        await methodChannel.invokeMethod<bool>("openNotificationSettingsURL");
    return opened;
  }
}
