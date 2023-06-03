import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_mobile/provider/bookmarkedlist_provider.dart';
import 'package:uts_mobile/screen/search_screen.dart';
import 'package:uts_mobile/screen/widget/filmcard_widget.dart';

class BookmarkedScreen extends StatelessWidget {
  static String routeName = '/bookmarked-screen';
  @override
  Widget build(BuildContext context) {
    // List<Search> bookmarkedlistProvider = Provider.of<BookmarkedlistProvider>(
    //   context,
    //   listen: false,
    // ).getBookmarkedlist();

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Expanded(
                flex: 5,
                child: Text('Your Bookmarked Film'),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  child: const Icon(Icons.search),
                  onTap: () => Navigator.popAndPushNamed(
                    context,
                    SearchScreen.routeName,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Consumer<BookmarkedlistProvider>(
        builder:
            (context, BookmarkedlistProvider bookmarkedlistProvider, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return FilmcardWidget(
                  bookmarkedlistProvider.getBookmarkedlist()[index]);
            },
            itemCount: bookmarkedlistProvider.getBookmarkedlist().length,
          );
        },
      ),
    );
  }
}
