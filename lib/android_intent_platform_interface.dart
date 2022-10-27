import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_intent_method_channel.dart';

abstract class AndroidIntentPlatform extends PlatformInterface {
  /// Constructs a AndroidIntentPlatform.
  AndroidIntentPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidIntentPlatform _instance = MethodChannelAndroidIntent();

  /// The default instance of [AndroidIntentPlatform] to use.
  ///
  /// Defaults to [MethodChannelAndroidIntent].
  static AndroidIntentPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AndroidIntentPlatform] when
  /// they register themselves.
  static set instance(AndroidIntentPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  // This should only be called when the Platform is Android
  /// and also when running on a NexGo BaseApp else it could
  /// crash the app.
  Future<String?> performKeyExchange() {
    throw UnimplementedError('performKeyExchange() has not been implemented.');
  }

  /// This should only be called when the Platform is Android
  /// and also when running on a NexGo BaseApp else it could
  /// crash the app.
  Future<String?> fetchParameters() {
    throw UnimplementedError('fetchParameters() has not been implemented.');
  }

  /// This should only be called when the Platform is Android
  /// and also when running on a NexGo BaseApp else it could
  /// crash the app.
  Future<String?> performTransaction(String requestData) {
    throw UnimplementedError('performTransaction() has not been implemented.');
  }

  /// This should only be called when the Platform is Android
  /// and also when running on a NexGo BaseApp else it could
  /// crash the app.
  Future<String?> printReceipt(String receiptData) {
    throw UnimplementedError('printReceipt() has not been implemented.');
  }

  /// This should only be called when the Platform is Android
  /// and also when running on a NexGo BaseApp else it could
  /// crash the app.
  Future<String?> fetchCardBalance(String requestData) {
    throw UnimplementedError('fetchCardBalance() has not been implemented.');
  }
}
