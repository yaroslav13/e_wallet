///By default, flutter test only uses a single "test" font called Ahem.
///This font is designed to show black spaces for every character.
///This helps to avoid errors associated with anti-aliasing algorithms
///of different platforms on which they were generated "goldens".
///To make Goldens more useful, we can use [loadAppFonts] function.
///
/// To generate a "golden" files run [fvm flutter test --update-goldens]
/// To run test [fvm flutter test]
///
/// If you are testing whole screen use [multiScreenGolden] function.
/// If you testing separated widget use [screenMatchesGolden] function.
///
/// You can combine flutter widget test with Golden test.
///
/// If you need to test cubit you can use [bloc_test]
///
/// One widget or golden test equals one file. NOT combine to the [grope]
/// Issue: [https://github.com/flutter/flutter-intellij/issues/1249]

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

const devices = [
  Device.iphone11,
  Device(
    name: '412 x 846 (Pixel 3xl)',
    size: Size(412, 846),
  ),
  Device(
    name: '393 x 786 (Pixel 3)',
    size: Size(393, 786),
  ),
  Device(
    name: '393 x 830 (Pixel 4-5)',
    size: Size(393, 830),
  ),
  Device(
    name: '375 x 812 (iPhone 10)',
    size: Size(375, 812),
  ),
  Device(
    name: '390 x 844 (iPhone 12)',
    size: Size(390, 844),
  ),
];

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      await loadAppFonts();

      await testMain();
    },
    config: GoldenToolkitConfiguration(
      defaultDevices: devices,
      enableRealShadows: true,
      skipGoldenAssertion: () => !Platform.isMacOS,
    ),
  );
}
