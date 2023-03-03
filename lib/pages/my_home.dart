import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:audio_player/app_colors.dart' as AppColors;
import 'package:audio_player/widget/app_tabs.dart';
import 'package:audio_player/widget/list_items.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List popularBooks = [];
  List books = [];
  ScrollController? _scrollController;
  TabController? _tabController;

  Future readJson() async {
    // popular books
    await DefaultAssetBundle.of(context).loadString('assets/json/popularBooks.json').then((value) {
      setState(() {
        popularBooks = json.decode(value);
      });
    });

    // books
    await DefaultAssetBundle.of(context).loadString('assets/json/books.json').then((value) {
      setState(() {
        books = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageIcon(
                      AssetImage('assets/img/menu.png'),
                      size: 24,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(Icons.notifications)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Popular Books',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 180,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        left: -25,
                        right: 0,
                        child: Container(
                          height: 180,
                          width: MediaQuery.of(context).size.width,
                          // margin: const EdgeInsets.only(right: 10),
                          child: PageView.builder(
                            controller: PageController(viewportFraction: 0.8),
                            itemCount:
                                popularBooks == null ? 0 : popularBooks.length,
                            itemBuilder: (_, i) {
                              return Container(
                                height: 180,
                                margin: const EdgeInsets.only(right: 15.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(popularBooks[i]['img']),
                                      fit: BoxFit.cover),
                                ),
                              );
                            },
                          ),
                        ))
                  ],
                ),
              ),
              Expanded(
                child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder: (context, isScrolled) {
                    return [
                      SliverAppBar(
                        backgroundColor: AppColors.silverBackground,
                        pinned: true,
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(50),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20, left: 10),
                            child: TabBar(
                              indicatorPadding: const EdgeInsets.all(0),
                              indicatorSize: TabBarIndicatorSize.label,
                              labelPadding: const EdgeInsets.only(right: 10),
                              isScrollable: true,
                              controller: _tabController,
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      offset: Offset(0, 0),
                                      blurRadius: 7,
                                    )
                                  ]),
                              tabs: [
                                AppTab(
                                    color: AppColors.menu1Color, text: 'Home'),
                                AppTab(
                                    color: AppColors.menu2Color,
                                    text: 'Popular'),
                                AppTab(
                                    color: AppColors.menu3Color,
                                    text: 'Trending')
                              ],
                            ),
                          ),
                        ),
                      )
                    ];
                  },
                  body: TabBarView(
                    controller: _tabController,
                    children: [
                      ListItems(books: books),
                      ListItems(books: popularBooks),
                      ListItems(books: books),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
