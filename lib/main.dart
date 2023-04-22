import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/model/detail_model.dart';
import '/provider/getdetailmodel_provider.dart';
import '/provider/searchlist_provider.dart';
import '/screen/bookmarked_screen.dart';
import '/screen/detail_screen.dart';

import '/provider/bookmarkedlist_provider.dart';
import '/screen/search_screen.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookmarkedlistProvider()),
        ChangeNotifierProvider(create: (context) => SearchlistProvider()),
        ChangeNotifierProvider(create: (context) => GetdetailmodelProvider()),
      ],
      child: MaterialApp(
        initialRoute: SearchScreen.routeName,
        routes: {
          SearchScreen.routeName: (context) => SearchScreen(),
          DetailScreen.routeName: (context) => DetailScreen(
              ModalRoute.of(context)?.settings.arguments as DetailModel),
          BookmarkedScreen.routeName: (context) => BookmarkedScreen(),
        },
      ),
    );
  }
}
