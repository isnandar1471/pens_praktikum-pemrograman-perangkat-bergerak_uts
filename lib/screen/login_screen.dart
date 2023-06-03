// ignore_for_file: unused_import

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_mobile/constant/app_constant.dart';
import 'package:uts_mobile/provider/apitoken_provider.dart';
import 'package:uts_mobile/screen/bookmarked_screen.dart';
import 'package:uts_mobile/screen/search_screen.dart';
import 'package:uts_mobile/screen/webview.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = '/login-screen';

  TextEditingController inputApitoken = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Input Your OMDB API Token'),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: inputApitoken,
            onSubmitted: (String apitoken) {
              Provider.of<ApikeyProvider>(
                context,
                listen: false,
              ).setApikey(apitoken);
              print(Provider.of<ApikeyProvider>(
                context,
                listen: false,
              ).getApikey());

              Navigator.pushNamed(context, BookmarkedScreen.routeName);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: const Text('Login'),
            onPressed: () {
              String apitoken = inputApitoken.text;
              Provider.of<ApikeyProvider>(
                context,
                listen: false,
              ).setApikey(apitoken);
              print(Provider.of<ApikeyProvider>(
                context,
                listen: false,
              ).getApikey());
              Navigator.pushNamed(context, BookmarkedScreen.routeName);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
            children: [
              const TextSpan(
                text: "Don't have API Key yet? ",
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: "Get API Key now!",
                style: const TextStyle(color: Colors.blue),
                recognizer: new TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, Webview.routeName,
                        arguments: '${AppConstant.baseUrl}apikey.aspx');
                  },
              ),
            ],
          )),
        ],
      ),
    ));
  }
}
