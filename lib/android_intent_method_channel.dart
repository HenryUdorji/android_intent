import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_intent_platform_interface.dart';

/// An implementation of [AndroidIntentPlatform] that uses method channels.
class MethodChannelAndroidIntent extends AndroidIntentPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('android_intent');

  @override
  Future<String?> performKeyExchange() async {
    final status = await methodChannel.invokeMethod<String>('keyExchange');
    return status;
  }

  @override
  Future<String?> printReceipt(String receiptData) async {
    return await methodChannel.invokeMethod<String>('printer', {'argument': receiptData});
  }

  @override
  Future<String?> performTransaction(String requestData) async {
    return await methodChannel.invokeMethod<String>('transaction', {'argument': requestData});
  }

  @override
  Future<String?> fetchParameters() async {
    return await methodChannel.invokeMethod<String>('parameters');
  }

  @override
  Future<String?> fetchCardBalance(String requestData) async {
    return await methodChannel.invokeMethod<String>('balance', {'argument': requestData});
  }
}
