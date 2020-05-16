import 'package:flutter/material.dart';
import '../widget/meal_item.dart';
import '../model/meal.dart';

class CategoryMealsScreen extends StatefulWidget {

  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {  //context property is available globally in our State object

  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;


  @override
  void initState()
  {
    super.initState();
  }

  @override
  void didChangeDependencies() {  // lines 30-36 had to be shifted to didUpdate method from initState because intiState is loaded foremost and there we cannot access ModalRoute, which can be accessed in didUpdate. Refer to stateful widget lifecycle
    if(!_loadedInitData)
      {
        final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
        categoryTitle = routeArgs['title'];
        final categoryId = routeArgs['id'];

        displayedMeals = widget.availableMeals.where((meal) {  //where method returns in iterable which can later be converted to a List
          return meal.categories.contains(categoryId);
        }).toList();
        _loadedInitData = true;
      }
    super.didChangeDependencies();
  }


  void _removeMeal(String mealID)
  {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealID);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),),
      body: ListView.builder(
        itemBuilder: (ctx,index) {
          return MealItem(
            id : displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            removeItem: _removeMeal,);
        },
        itemCount: displayedMeals.length ,
      ) ,
    );
  }
}
