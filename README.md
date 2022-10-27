# android_intent

A Flutter Plugin for Starting Android Intent for Result

* This Android Plugin enables communication with the Base App from the Flutter app using intents while also returning response where appropriate.

* Response would be returned back as a JsonString for Card Transaction and Parameter Fetching, this jsonString can now be decoded to dart.

## Sample Usage

<pre><code>
  if (platform.isAndroid) {
    var status = await AndroidIntentPlatform.instance.performKeyExchange();
    print(status)
    //where status contains the result gotten back from this intent
  }
</code></pre>
