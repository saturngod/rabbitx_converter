import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rabbitx_converter/rabbitx_converter.dart';

void main() {
  const MethodChannel channel = MethodChannel('rabbitx_converter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {});

  tearDown(() {});

  test('zawgyi2unicode', () async {
    expect(RabbitxConverter.zg2uni("ေနကာင္းလား"), 'နေကာင်းလား');
  });
  test('unicod2zawgyi', () {
    expect(RabbitxConverter.uni2zg("နေကာင်းလား"), 'ေနကာင္းလား');
  });
}
