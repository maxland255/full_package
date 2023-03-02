import 'package:full_package/class.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'full_package_method_channel.dart';

abstract class FullPackagePlatform extends PlatformInterface {
  /// Constructs a FullPackagePlatform.
  FullPackagePlatform() : super(token: _token);

  static final Object _token = Object();

  static FullPackagePlatform _instance = MethodChannelFullPackage();

  /// The default instance of [FullPackagePlatform] to use.
  ///
  /// Defaults to [MethodChannelFullPackage].
  static FullPackagePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FullPackagePlatform] when
  /// they register themselves.
  static set instance(FullPackagePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<AppInformation?> getAppInformation() async {
    throw UnimplementedError('getAppInformation() has not been implemented.');
  }

  Future<String?> alertMessage(
      String title, String message, AlertStyle alertStyle) async {
    throw UnimplementedError('alertMessage() has not been implemented.');
  }

  Future<AlertReturn?> alertButton(String title, String message,
      AlertStyle alertStyle, List<String> button) async {
    throw UnimplementedError('alertButton() has not been implemented.');
  }

  Future<List<dynamic>?> filePicker(
      String prompt,
      String message,
      List<String> allowedFileTypes,
      bool canChooseFiles,
      bool canChooseDirectories,
      bool allowsMultipleSelection,
      bool canCreateDirectories) async {
    throw UnimplementedError('filePicker() has not been implemented.');
  }
}
