import 'package:e_wallet/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

WidgetWrapper wrapWithMaterial() {
  return materialWrapper;
}

Widget materialWrapper(Widget child) {
  return GlobalServicesWrapper(
    app: MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Material(child: child),
    ),
    whenDependenciesInitComplete: () {},
  );
}

Future<void> pumpWidgetTwice(
  Widget widget,
  WidgetTester tester, {
  double textScaleSize = 1.0,
  Size? surfaceSize,
  WidgetWrapper? wrapper,
}) async {
  await tester.pumpWidgetBuilder(
    widget,
    wrapper: wrapper ?? wrapWithMaterial(),
    textScaleSize: textScaleSize,
    surfaceSize: surfaceSize ?? Device.phone.size,
  );

  await tester.pumpAndSettle();
}
