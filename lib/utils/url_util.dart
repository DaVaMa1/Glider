import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:glider/utils/scaffold_messenger_state_extension.dart';
import 'package:native_launcher/native_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlUtil {
  UrlUtil._();

  static Future<bool> tryLaunch(BuildContext context, String urlString) async {
    final bool success = await _tryLaunchNonBrowser(urlString) ||
        await _tryLaunchCustomTab(context, urlString) ||
        await _tryLaunchPlatform(urlString);

    if (!success) {
      ScaffoldMessenger.of(context).showSnackBarQuickly(
        const SnackBar(content: Text('Could not open URL')),
      );
    }

    return success;
  }

  static Future<bool> _tryLaunchNonBrowser(String urlString) async {
    try {
      return await NativeLauncher.launchNonBrowser(urlString) ?? false;
    } on MissingPluginException {
      return false;
    }
  }

  static Future<bool> _tryLaunchCustomTab(
      BuildContext context, String urlString) async {
    final AppBarTheme appBarTheme = Theme.of(context).appBarTheme;

    try {
      await FlutterWebBrowser.openWebPage(
        url: urlString,
        customTabsOptions: CustomTabsOptions(
          toolbarColor: appBarTheme.color,
          addDefaultShareMenuItem: true,
          showTitle: true,
        ),
        safariVCOptions: SafariViewControllerOptions(
          barCollapsingEnabled: true,
          preferredBarTintColor: appBarTheme.color,
          preferredControlTintColor: appBarTheme.iconTheme?.color,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
      return true;
    } on MissingPluginException {
      return false;
    } on PlatformException {
      return false;
    }
  }

  static Future<bool> _tryLaunchPlatform(String urlString) async {
    if (await canLaunch(urlString)) {
      return launch(urlString);
    }

    return false;
  }
}
