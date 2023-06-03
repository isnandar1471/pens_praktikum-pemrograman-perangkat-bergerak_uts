import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_mobile/constant/app_constant.dart';
import 'package:uts_mobile/model/search_model.dart';
import 'package:uts_mobile/provider/bookmarkedlist_provider.dart';
import '/model/detail_model.dart';

class DetailScreen extends StatelessWidget {
  static String routeName = '/detail-screen';
  DetailModel detailModel;

  DetailScreen(this.detailModel);

  @override
  Widget build(BuildContext context) {
    Image hero = detailModel.poster == 'N/A'
        ? Image.asset(AppConstant.imagenotfoundPath)
        : Image.network(detailModel.poster);
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        backgroundColor: const Color(0xfff4f4f4),
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: <Widget>[
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Card(
                    elevation: 5,
                    child: Hero(
                      tag: detailModel.imdbId,
                      child: Container(
                        height: 450,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: hero.image,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Consumer<BookmarkedlistProvider>(
                    builder: (context,
                        BookmarkedlistProvider bookmarkedlistProvider, child) {
                      IconData icon = bookmarkedlistProvider
                              .haveItem(Search.fromDetailModel(detailModel))
                          ? Icons.bookmark
                          : Icons.bookmark_border;
                      return Padding(
                        padding: const EdgeInsets.all(14),
                        child: SizedBox.fromSize(
                          size: const Size(56, 56),
                          child: ClipOval(
                            child: Material(
                              child: InkWell(
                                onTap: () {
                                  BookmarkedlistProvider
                                      bookmarkedlistProvider =
                                      Provider.of<BookmarkedlistProvider>(
                                          context,
                                          listen: false);
                                  bool isBookmarked =
                                      bookmarkedlistProvider.haveItem(
                                          Search.fromDetailModel(detailModel));
                                  print('64 ${isBookmarked}');
                                  if (isBookmarked) {
                                    bookmarkedlistProvider.removeItem(
                                        Search.fromDetailModel(detailModel));
                                  } else {
                                    bookmarkedlistProvider.addItem(
                                        Search.fromDetailModel(detailModel));
                                  }

                                  inspect(bookmarkedlistProvider
                                      .getBookmarkedlist());
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(icon),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(Icons.movie),
                const SizedBox(width: 5),
                Text(
                  detailModel.director,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              detailModel.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Icon(Icons.flag),
                const SizedBox(width: 5),
                Text(
                  detailModel.country,
                ),
                const SizedBox(width: 20),
                const Icon(Icons.timer),
                const SizedBox(width: 5),
                Text(
                  detailModel.runtime,
                  style: const TextStyle(fontSize: 14),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              detailModel.plot,
              style: const TextStyle(
                fontSize: 18,
                height: 1.5,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Year',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        detailModel.year,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Rating',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        detailModel.imdbRating,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Released',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        detailModel.released,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Votes',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        detailModel.imdbVotes,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Genre',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              detailModel.genre,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Actors',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              detailModel.actors,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Writers',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              detailModel.writer,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Writers',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              detailModel.writer,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Language',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              detailModel.language,
            ),
          ],
        ),
      ),
    );
  }
}
