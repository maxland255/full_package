// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'dart:html';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'full_package_platform_interface.dart';

/// A web implementation of the FullPackagePlatform of the FullPackage plugin.
class FullPackageWeb extends FullPackagePlatform {
  /// Constructs a FullPackageWeb
  FullPackageWeb();

  static void registerWith(Registrar registrar) {
    FullPackagePlatform.instance = FullPackageWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }

  @override
  Future<List<String>?> filePicker(
      String prompt,
      String message,
      List<String> allowedFileTypes,
      bool canChooseFiles,
      bool canChooseDirectories,
      bool allowsMultipleSelection,
      bool canCreateDirectories) async {
    FileUploadInputElement inputElement = FileUploadInputElement();

    inputElement.accept = allowedFileTypes
        .toString()
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(",", "");

    inputElement.multiple = allowsMultipleSelection;
    inputElement.name = message;
    inputElement.click();

    var _ = await inputElement.onChange.first;

    final file = inputElement.files;

    List<String>? fileStringURL;

    if (file != null && file.isNotEmpty) {
      fileStringURL = [];
      for (var f in file) {
        if (f.relativePath != null) {
          fileStringURL.add(f.relativePath!);
        }
      }
    }

    return fileStringURL;
  }
}
