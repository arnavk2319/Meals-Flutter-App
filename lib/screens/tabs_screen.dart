import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';
import '../widget/main_drawer.dart';
import '../model/meal.dart';


class TabsScreen extends StatefulWidget {

  final List<Meal> markedFavorite;

  TabsScreen(this.markedFavorite);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Map<String,Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState(){
    _pages = [
      {"page" : CategoriesScreen(),"title" : "Categories"},
      {"page" : FavoritesScreen(widget.markedFavorite), "title" : "Favorites"},
    ];
    super.initState();
  }

  void _selectPage(int index)
  {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
//    return DefaultTabController(
//      length: 2,
//      initialIndex: 1,  //initial index specifies which tab will be displayed on startup of the app, 0 is the default
//      child: Scaffold(
//        appBar: AppBar(
//          title: Text("Meals"),
//          bottom: TabBar(tabs: <Widget> [
//            Tab(
//              icon: Icon(Icons.category),
//              text: "Categories",),
//            Tab(
//              icon: Icon(Icons.star),
//              text: "Favorites",)
//          ],
//          ),
//        ),
//        body: TabBarView(children: <Widget>[  //TabBarView automatically controls the tap events on the respective tabs, on the order of the screens declared, no need for handling tap/press events
//          CategoriesScreen(),
//          FavoritesScreen(),
//        ],
//        ),
//      ),
//    );   // FOR DISPLAYING TABS AT THE TOP

    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"]), //map with index of items and key as arg
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(   // tap/press events need to be handled manually in case of bottom tabs
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,  //handling color changes, telling flutter which tab is actually active
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          )
        ],
      ),
    );
  }
}
