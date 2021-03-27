import 'dart:async';
// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'rules.dart';

/// A web implementation of the RabbitxConverter plugin.
class RabbitxConverterWeb {
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'rabbitx_converter',
      const StandardMethodCodec(),
      registrar,
    );

    final pluginInstance = RabbitxConverterWeb();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
  }

  /// Handles method calls over the MethodChannel of this plugin.
  /// Note: Check the "federated" architecture for a new way of doing this:
  /// https://flutter.dev/go/federated-plugins
  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'getPlatformVersion':
        return getPlatformVersion();
        break;

      default:
        throw PlatformException(
          code: 'Unimplemented',
          details:
              'rabbitx_converter for web doesn\'t implement \'${call.method}\'',
        );
    }
  }

  /// Returns a [String] containing the version of the platform.
  Future<String> getPlatformVersion() {
    final version = html.window.navigator.userAgent;
    return Future.value(version);
  }

  /// Converts Myanmar Unicode Encoded Strings to Zawgyi Encoding.
  static String uni2zg(String input) {
    return _replaceWithRule(Rules.uni2zg, input);
  }

  /// Converts Zawgyi Encoded Strings to Myanmar Unicode Encoding.
  static String zg2uni(String input) {
    return _replaceWithRule(Rules.zg2uni, input);
  }

  static String _replaceWithRule(
    List<Map<String, String>> rules,
    String input,
  ) {
    var output = input;

    for (final rule in rules) {
      output = output.replaceAllMapped(RegExp(rule['from']!), (match1) {
        return rule['to']!.replaceAllMapped(RegExp(r'#(\d{1})'), (match2) {
          return match1.group(int.parse(match2.group(1)!)) ?? '';
        });
      });
    }

    return output;
  }
}
