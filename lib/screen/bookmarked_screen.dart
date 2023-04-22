import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_mobile/constant/app_constant.dart';
import 'package:uts_mobile/model/search_model.dart';
import 'package:uts_mobile/provider/bookmarkedlist_provider.dart';

class BookmarkedScreen extends StatelessWidget {
  static String routeName = '/bookmarked-screen';
  @override
  Widget build(BuildContext context) {
    List<Search> bookmarkedlistProvider = Provider.of<BookmarkedlistProvider>(
      context,
      listen: false,
    ).getBookmarkedlist();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarked'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          Search place = bookmarkedlistProvider[index];
          Image image = place.poster == 'N/A'
              ? Image.asset(AppConstant.imagenotfoundPath)
              : Image.network(place.poster);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            child: Column(
              children: <Widget>[
                Card(
                  elevation: 5,
                  child: Row(
                    children: <Widget>[
                      Hero(
                        tag: place.imdbId,
                        child: Container(
                          height: 150,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              topLeft: Radius.circular(5),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: image.image,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              place.title.length > 20
                                  ? place.title.replaceRange(
                                      20, place.title.length, '...')
                                  : place.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.movie),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  place.type,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.calendar_today),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  place.year,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: bookmarkedlistProvider.length,
      ),
    );
  }
}
