import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationX on BuildContext {
  AppLocalizations get localizations {
    final appLocalization = AppLocalizations.of(this);

    if (appLocalization != null) {
      return appLocalization;
    } else {
      throw FlutterError(
        'Requested the Locale of a context that does not include '
        'a Localizations ancestor.\n To request the Locale, '
        'the context used to retrieve the Localizations widget must '
        'be that of a widget that is a descendant of a Localizations widget.',
      );
    }
  }
}
