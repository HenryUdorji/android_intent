import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:android_intent/android_intent_method_channel.dart';

void main() {
  MethodChannelAndroidIntent platform = MethodChannelAndroidIntent();
  const MethodChannel channel = MethodChannel('android_intent');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '00';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });


}
