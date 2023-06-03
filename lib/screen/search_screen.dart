// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_mobile/constant/app_constant.dart';
import 'package:uts_mobile/provider/apitoken_provider.dart';
import 'package:uts_mobile/provider/getdetailmodel_provider.dart';
import 'package:uts_mobile/screen/bookmarked_screen.dart';

import '/model/search_model.dart';
import '/provider/searchlist_provider.dart';
import '/screen/widget/filmcard_widget.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = '/search-screen';

  @override
  Widget build(BuildContext context) {
    return Consumer<GetdetailmodelProvider>(
      builder:
          (context, GetdetailmodelProvider getdetailmodelProvider, child) =>
              Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Consumer<SearchlistProvider>(
                        builder: (context,
                                SearchlistProvider searchlistProvider, child) =>
                            TextField(
                          onSubmitted: (value) {
                            String apikey = Provider.of<ApikeyProvider>(context,
                                    listen: false)
                                .getApikey();
                            searchlistProvider.doSearch(value, apikey);
                          },
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(
                              color: Colors.white54,
                            ),
                            hintText: 'Search film...',
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            prefixIconColor: Colors.white54,
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          showCursor: true,
                          cursorColor: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        child: const Icon(Icons.bookmark_border),
                        onTap: () => Navigator.popAndPushNamed(
                          context,
                          BookmarkedScreen.routeName,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            body: Consumer<SearchlistProvider>(
              builder: (context, SearchlistProvider searchlistProvider, child) {
                if (searchlistProvider.getOnProgress()) {
                  return const Center(child: CircularProgressIndicator());
                }
                List<Search> getList = searchlistProvider.getSearchlist();
                return ListView.builder(
                  itemCount: getList.length,
                  itemBuilder: (context, index) {
                    return FilmcardWidget(getList[index]);
                  },
                );
              },
            ),
          ),
          getdetailmodelProvider.getOnProgress()
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(child: CircularProgressIndicator()),
                )
              : Container(),
        ],
      ),
    );
  }
}
