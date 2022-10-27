package com.globalaccelerex.android_intent

import android.app.Activity
import android.content.Intent
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry

/** AndroidIntentPlugin */
class AndroidIntentPlugin: FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.ActivityResultListener {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private var activity: Activity? = null
  private lateinit var result: Result
  private lateinit var channel: MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "android_intent")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    this.result = result
    when (call.method) {
      "keyExchange" -> {
        val intent = Intent(Constants.KEY_EXCHANGE_INTENT)
        activity?.startActivityForResult(intent, Constants.RC_KEY_EXCHANGE)
      }
      "parameters" -> {
        val jsonString = "{ \"action\":\"PARAMETER\" }"
        val intent = Intent(Constants.PARAMETERS_INTENT)
        intent.putExtra("requestData", jsonString)
        activity?.startActivityForResult(intent, Constants.RC_PARAMETERS)
      }
      "transaction" -> {
        val jsonString = call.argument<String>("argument");
        val intent = Intent(Constants.TRANSACTION_INTENT)
        intent.putExtra("requestData", jsonString)
        activity?.startActivityForResult(intent, Constants.RC_TRANSACTION)
      }
      "balance" -> {
        val jsonString = call.argument<String>("argument");
        val intent = Intent(Constants.TRANSACTION_INTENT)
        intent.putExtra("requestData", jsonString)
        activity?.startActivityForResult(intent, Constants.RC_TRANSACTION)
      }
      "printer" -> {
        val jsonString = call.argument<String>("argument");
        val intent = Intent(Constants.PRINTER_INTENT)
        intent.putExtra("jsonData", jsonString)
        activity?.startActivityForResult(intent, Constants.RC_PRINTER)
      }
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
    binding.addActivityResultListener(this)
  }

  override fun onDetachedFromActivityForConfigChanges() {
    activity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    activity = binding.activity
    binding.addActivityResultListener(this)
  }

  override fun onDetachedFromActivity() {
    activity = null
  }

  override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
    val status = data?.getStringExtra("status")
    val responseData = data?.getStringExtra("data")

    when (requestCode) {
      Constants.RC_KEY_EXCHANGE -> {
        if (resultCode == Activity.RESULT_OK) {
          result.success(status)
          return true
        }
      }
      Constants.RC_PARAMETERS -> {
        if (resultCode == Activity.RESULT_OK) {
          result.success(responseData)
          return true
        }
      }
      Constants.RC_TRANSACTION -> {
        if (resultCode == Activity.RESULT_OK) {
          result.success(responseData)
          return true
        }
      }
      Constants.RC_PRINTER -> {
        if (resultCode == Activity.RESULT_OK) {
          result.success(status)
          return true
        }
      }
    }
    return false
  }
}
