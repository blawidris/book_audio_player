import 'package:flutter/material.dart';
import 'package:audio_player/app_colors.dart' as AppColors;


class ListItems extends StatelessWidget {
  List books = [];

  ListItems({required this.books});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        itemCount: books == null ? 0 : books.length,
        itemBuilder: (_, i) {
          return Container(
            margin:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.tabVarViewColors,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        offset: Offset(0, 0),
                        color: Colors.grey.withOpacity(0.2))
                  ]),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Row(children: [
                  Container(
                    width: 90,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(books[i]['img']),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star,
                              size: 24, color: AppColors.starColor),
                          SizedBox(height: 10),
                          Text(
                            books[i]['rating'],
                            style: TextStyle(
                              color: AppColors.menu1Color,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            books[i]['title'],
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            books[i]['text'],
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Avenir',
                              color: AppColors.starColor,
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 15,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: AppColors.loveColor),
                            child: Text(
                              'Love',
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Avenir',
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
