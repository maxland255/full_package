import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:full_package/class.dart';
import 'package:full_package/full_package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _fullPackagePlugin = FullPackage();

  AppInformation? appInformation;

  @override
  void initState() {
    super.initState();

    initialiseState();
  }

  Future<void> initialiseState() async {
    try {
      // _fullPackagePlugin.getAppInformation().then((value) {
      //   setState(() {
      //     appInformation = value;
      //   });
      // });
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(appInformation?.appVersion ?? "Error"),
              Text(appInformation?.appBuild ?? "Error"),
              Text(appInformation?.appName ?? "Error"),
              TextButton(
                onPressed: () {
                  _fullPackagePlugin.alertMessage(
                    "Error",
                    "Une erreur est survenue",
                    AlertStyle.informational,
                  );
                },
                child: const Text("Show alert"),
              ),
              TextButton(
                onPressed: () {
                  _fullPackagePlugin.alertButton(
                      "Error",
                      "Une erreur est survenue",
                      AlertStyle.informational,
                      ["Cancel", "Yess", "Ok"]).then((value) {
                    if (kDebugMode) {
                      print(value?.button);
                      print(value?.message);
                    }
                  });
                },
                child: const Text("Show alert button"),
              ),
              TextButton(
                onPressed: () {
                  _fullPackagePlugin
                      .filePicker(
                    "Open",
                    "Select file",
                    ["png, jpeg, jpg"],
                    true,
                    false,
                    false,
                    true,
                  )
                      .then((value) {
                    if (kDebugMode) {
                      print(value);
                    }
                  });
                },
                child: const Text("Choose file"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
