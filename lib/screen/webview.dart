import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/foundation.dart';

class Webview extends StatelessWidget {
  static const routeName = '/webview';

  final String url;

  const Webview({required this.url});

  @override
  Widget build(BuildContext context) {
    Widget body = (kIsWeb)
        ? const Text('Web Platform not supported yet')
        : WebView(
            initialUrl: url,
          );
    return Scaffold(
      appBar: AppBar(
        title: const Text('omdbapi.com'),
      ),
      body: body,
    );
  }
}
