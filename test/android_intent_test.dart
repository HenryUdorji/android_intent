import 'package:flutter_test/flutter_test.dart';
import 'package:android_intent/android_intent.dart';
import 'package:android_intent/android_intent_platform_interface.dart';
import 'package:android_intent/android_intent_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAndroidIntentPlatform 
    with MockPlatformInterfaceMixin
    implements AndroidIntentPlatform {
  @override
  Future<String?> fetchCardBalance(String requestData) {
    // TODO: implement fetchCardBalance
    throw UnimplementedError();
  }

  @override
  Future<String?> fetchParameters() {
    // TODO: implement fetchParameters
    throw UnimplementedError();
  }

  @override
  Future<String?> performKeyExchange() {
    // TODO: implement performKeyExchange
    throw UnimplementedError();
  }

  @override
  Future<String?> performTransaction(String requestData) {
    // TODO: implement performTransaction
    throw UnimplementedError();
  }

  @override
  Future<String?> printReceipt(String receiptData) {
    // TODO: implement printReceipt
    throw UnimplementedError();
  }

}

void main() {
  final AndroidIntentPlatform initialPlatform = AndroidIntentPlatform.instance;

  test('$MethodChannelAndroidIntent is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAndroidIntent>());
  });
}
