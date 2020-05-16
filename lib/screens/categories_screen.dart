import 'package:flutter/material.dart';
import '../dummy_data.dart';
import 'package:meals_app_flutter/widget/category_item.dart';

class CategoriesScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(20),
          children: DUMMY_CATEGORIES.map((catData) => CategoryItem(
              catData.id,
              catData.title,
              catData.color))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent( ////Slivers are scrollable areas in the screen
              maxCrossAxisExtent: 300, //, maxCrossAxisContent is the max width of the tiles
              childAspectRatio: 3 / 2, //for 200 width, 300 height
              mainAxisSpacing: 20,
              crossAxisSpacing: 20
          ),
        );
  }
}