import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Consumer<SearchlistProvider>(
                        builder: (context,
                                SearchlistProvider searchlistProvider, child) =>
                            TextField(
                          onSubmitted: searchlistProvider.doSearch,
                          decoration: InputDecoration(
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
                          style: TextStyle(
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
                        child: Icon(Icons.bookmark_border),
                        onTap: () => Navigator.pushNamed(
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
                  return Center(child: CircularProgressIndicator());
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
