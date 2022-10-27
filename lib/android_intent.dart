
import 'android_intent_platform_interface.dart';

class AndroidIntent {
  Future<String?> performKeyExchange() {
    return AndroidIntentPlatform.instance.performKeyExchange();
  }

  Future<String?> performTransaction(String requestData) {
    return AndroidIntentPlatform.instance.performTransaction(requestData);
  }

  Future<String?> printReceipt(String receiptData) {
    return AndroidIntentPlatform.instance.printReceipt(receiptData);
  }

  Future<String?> fetchParameters() {
    return AndroidIntentPlatform.instance.fetchParameters();
  }

  Future<String?> fetchCardBalance(String requestData) {
    return AndroidIntentPlatform.instance.fetchCardBalance(requestData);
  }
}
