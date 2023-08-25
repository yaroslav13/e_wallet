part of 'dependencies_provider.dart';

final class _DependenciesInitializationErrorStub extends StatelessWidget {
  const _DependenciesInitializationErrorStub();

  @override
  Widget build(BuildContext context) {
    final themeCreator = DependenciesProvider.of(context).get<ThemeCreator>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeCreator.create(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const _ErrorStub(),
    );
  }
}

///TODO: made it more beautiful
final class _ErrorStub extends StatelessWidget {
  const _ErrorStub();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(AppLocalizations.of(context)!.sorryRestartApp),
        ),
      ),
    );
  }
}
