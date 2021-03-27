import 'dart:async';

import 'package:flutter/services.dart';
import 'rules.dart';

class RabbitxConverter {
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
