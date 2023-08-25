import 'package:device_preview/device_preview.dart';
import 'package:e_wallet/src/domain/application_domain/build_config/build_config.dart';
import 'package:e_wallet/src/presentation/features/dependencies/dependencies_provider.dart';
import 'package:e_wallet/src/presentation/navigation/router_configurator.dart';
import 'package:e_wallet/src/presentation/theme/theme_creator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final class EWalletApplication extends StatelessWidget {
  const EWalletApplication({super.key});

  @override
  Widget build(BuildContext context) {
    final routerConfigurator =
        DependenciesProvider.of(context).get<RouterConfigurator>();
    final themeCreator = DependenciesProvider.of(context).get<ThemeCreator>();
    final buildConfig = DependenciesProvider.of(context).get<BuildConfig>();

    return DevicePreview(
      enabled: buildConfig.enableMultiscreenPreview,
      builder: (_) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),

        // it's required for [DevicePreview] to work properly
        useInheritedMediaQuery: true,
        theme: themeCreator.create(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: routerConfigurator.config,
        builder: DevicePreview.appBuilder,
      ),
    );
  }
}
