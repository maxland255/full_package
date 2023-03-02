import 'package:flutter_test/flutter_test.dart';
import 'package:full_package/class.dart';
import 'package:full_package/full_package.dart';
import 'package:full_package/full_package_platform_interface.dart';
import 'package:full_package/full_package_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFullPackagePlatform
    with MockPlatformInterfaceMixin
    implements FullPackagePlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<AppInformation?> getAppInformation() {
    // TODO: implement getAppInformation
    throw UnimplementedError();
  }

  @override
  Future<String?> alertMessage(
      String title, String message, AlertStyle alertStyle) {
    // TODO: implement alertMessage
    throw UnimplementedError();
  }

  @override
  Future<AlertReturn?> alertButton(String title, String message,
      AlertStyle alertStyle, List<String> button) {
    // TODO: implement alertButton
    throw UnimplementedError();
  }

  @override
  Future<List<String>?> filePicker(
      String prompt,
      String message,
      List<String> allowedFileTypes,
      bool canChooseFiles,
      bool canChooseDirectories,
      bool allowsMultipleSelection,
      bool canCreateDirectories) {
    // TODO: implement filePicker
    throw UnimplementedError();
  }
}

void main() {
  final FullPackagePlatform initialPlatform = FullPackagePlatform.instance;

  test('$MethodChannelFullPackage is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFullPackage>());
  });

  test('getPlatformVersion', () async {
    FullPackage fullPackagePlugin = FullPackage();
    MockFullPackagePlatform fakePlatform = MockFullPackagePlatform();
    FullPackagePlatform.instance = fakePlatform;

    expect(await fullPackagePlugin.getPlatformVersion(), '42');
  });
}
