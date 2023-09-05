part of 'dependencies_provider.dart';

final class _DependenciesInitializationErrorStub extends StatelessWidget {
  const _DependenciesInitializationErrorStub();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: _ErrorStub(),
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
          child: Text(context.localizations.sorryRestartApp),
        ),
      ),
    );
  }
}
