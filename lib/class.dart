class AppInformation {
  final String appVersion;
  final String appBuild;
  final String appName;

  AppInformation(this.appVersion, this.appBuild, this.appName);

  AppInformation.fromJson(Map<String, dynamic> json)
      : appVersion = json["appVersion"],
        appBuild = json["appBuild"],
        appName = json["appName"];
}

enum AlertStyle { informational, critical, warning }

class AlertReturn {
  ButtonPressed? button;
  String? message;

  AlertReturn(this.button, this.message);
}

enum ButtonPressed { firstButton, secondButton, thirdButton }
