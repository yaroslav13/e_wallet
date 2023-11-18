import 'package:e_wallet/src/data/api/authorization_api.dart';
import 'package:e_wallet/src/data/repositories/authorization_repository_impl.dart';
import 'package:e_wallet/src/di/injectable.dart';
import 'package:e_wallet/src/domain/business_domain/interactors/check_is_current_user_authorized_interactor.dart';
import 'package:e_wallet/src/domain/business_domain/repositories/authorization_repository.dart';
import 'package:e_wallet/src/presentation/features/dependencies/dependencies_provider.dart';
import 'package:e_wallet/src/presentation/features/welcome/welcome_cubit.dart';
import 'package:e_wallet/src/presentation/theme/theme_creator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'fakes/fake_authorization_api.dart';

WidgetWrapper wrapWithMaterial() {
  return materialWrapper;
}

Widget materialWrapper(Widget child) {
  return DependenciesProvider(
    dependenciesContainer: _TestDependenciesContainer(),
    child: Builder(
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: DependenciesProvider.of(context).get<ThemeCreator>().create(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: child,
        );
      },
    ),
  );
}

Future<void> pumpWidgetTwice(
  Widget widget,
  WidgetTester tester, {
  double textScaleSize = 1.0,
  Size? surfaceSize,
  WidgetWrapper? wrapper,
}) async {
  await tester.runAsync(() async {
    await tester.pumpWidgetBuilder(
      widget,
      wrapper: wrapper ?? wrapWithMaterial(),
      textScaleSize: textScaleSize,
      surfaceSize: surfaceSize ?? Device.phone.size,
    );

    await tester.pumpAndSettle();
  });
}

final class _TestDependenciesContainer implements DependenciesContainer {
  @override
  late final Future<GetIt> dependencies = _init();

  Future<GetIt> _init() async {
    final authorizationApi = FakeAuthorizationApi();
    final authorizationRepository =
        AuthorizationRepositoryImpl(authorizationApi);
    final checkIsCurrentUserAuthorizedInteractor =
        CheckIsCurrentUserAuthorizedInteractor(authorizationRepository);
    final welcomeCubit = WelcomeCubit(checkIsCurrentUserAuthorizedInteractor);
    final themeCreator = ThemeCreator.required();

    final getIt = GetIt.asNewInstance()
      ..registerFactory<AuthorizationApi>(() => authorizationApi)
      ..registerFactory<AuthorizationRepository>(() => authorizationRepository)
      ..registerFactory<CheckIsCurrentUserAuthorizedInteractor>(
        () => checkIsCurrentUserAuthorizedInteractor,
      )
      ..registerFactory<WelcomeCubit>(() => welcomeCubit)
      ..registerFactory<ThemeCreator>(() => themeCreator);

    return getIt;
  }
}
