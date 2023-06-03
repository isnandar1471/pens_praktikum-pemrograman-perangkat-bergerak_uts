import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_mobile/constant/app_constant.dart';
import 'package:uts_mobile/model/detail_model.dart';
import 'package:uts_mobile/provider/apitoken_provider.dart';
import 'package:uts_mobile/provider/getdetailmodel_provider.dart';
import 'package:uts_mobile/screen/detail_screen.dart';
import '/model/search_model.dart';

class FilmcardWidget extends StatelessWidget {
  Search search;

  FilmcardWidget(this.search);

  @override
  Widget build(BuildContext context) {
    Image hero = search.poster == 'N/A'
        ? Image.asset(AppConstant.imagenotfoundPath, fit: BoxFit.cover)
        : Image.network(search.poster, fit: BoxFit.cover);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      child: Column(
        children: <Widget>[
          GestureDetector(
            // onTap: () async {
            //   DetailModel detail =
            //       await ApiService.get_detailbyid(search.imdbId);
            //   BookmarkedlistProvider bookmarkedlistProvider =
            //       Provider.of<BookmarkedlistProvider>(context, listen: false);
            //   Navigator.pushNamed(
            //     context,
            //     DetailScreen.routeName,
            //     arguments: detail,
            //   );
            // },
            onTap: () async {
              String apikey =
                  Provider.of<ApikeyProvider>(context, listen: false)
                      .getApikey();
              DetailModel detail = await Provider.of<GetdetailmodelProvider>(
                      context,
                      listen: false)
                  .getDetailModel(search.imdbId, apikey);
              Navigator.pushNamed(
                context,
                DetailScreen.routeName,
                arguments: detail,
              );
            },
            child: Card(
              elevation: 5,
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: search.imdbId,
                    child: Container(
                      height: 150,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          topLeft: Radius.circular(5),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: hero.image,
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
                          search.title.length > 20
                              ? search.title
                                  .replaceRange(20, search.title.length, '...')
                              : search.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.movie),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              search.type,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              search.year,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
