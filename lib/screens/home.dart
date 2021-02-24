import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lawyers/assets.dart';
import 'package:lawyers/models/categories.dart';
import 'package:lawyers/models/lawyers.dart';
import 'package:lawyers/screens/lawyer.dart';

class Home extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final selectedCategory = useState(categories[0]);

    const bottomNavItems = const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today),
        label: 'Calendar',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ];
    final selectedIcon = useState(0);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _topContainer(context, selectedCategory),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: List.generate(
                        topLawyers.length,
                        (index) => _buildLawyerCard(context, index),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: selectedIcon.value,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: (index) => selectedIcon.value = index,
        unselectedItemColor: Colors.grey[400],
        showSelectedLabels: false,
      ),
    );
  }

  Column _topContainer(BuildContext context, ValueNotifier<Category> selectedCategory) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Greetings
        Text(
          "Hello Israel,",
          style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.grey[500]),
        ),
        SizedBox(height: 10),
        Text("Let's help you find a lawyer", style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        // Searchbox
        TextField(
          decoration: new InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            hintText: "Search Lawyer",
            filled: true,
            fillColor: Colors.white,
            prefixIcon: new Icon(
              Icons.search,
              size: 32,
            ),
            suffixIcon: Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.09),
                borderRadius: BorderRadius.circular(8),
              ),
              child: RotatedBox(
                quarterTurns: 3,
                child: (Image.asset(
                  Assets.filter,
                  height: 32,
                  width: 32,
                )),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Category",
              style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              "See all",
              style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.grey[500]),
            ),
          ],
        ),
        SizedBox(height: 10),
        // Top Lawyers
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              categories.length,
              (index) => GestureDetector(
                onTap: () => selectedCategory.value = categories[index],
                child: Container(
                  padding: const EdgeInsets.fromLTRB(4, 4, 12, 4),
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      selectedCategory.value.title == categories[index].title
                          ? BoxShadow(
                              color: Theme.of(context).primaryColor.withOpacity(0.09),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: Offset(0, 3),
                            )
                          : BoxShadow(
                              color: Colors.transparent,
                              spreadRadius: 0,
                              blurRadius: 0,
                              offset: Offset(0, 0),
                            ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: (Image.asset(
                          categories[index].imagePath,
                          height: 32,
                          width: 32,
                        )),
                      ),
                      Text(
                        categories[index].title,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.w700, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Top Lawyers",
                  style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                )
              ],
            ),
            Text(
              "View all",
              style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.grey[500]),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }

  InkWell _buildLawyerCard(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Lawyer(lawyer: topLawyers[index]),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                child: (Image.network(
                  topLawyers[index].avatar,
                  height: 100,
                  width: 100,
                )),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topLawyers[index].name,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.w900),
                    ),
                    Row(
                      children: [
                        Chip(
                          label: Text(
                            topLawyers[index].category,
                            style: Theme.of(context).textTheme.bodyText1.copyWith(color: chipColors(topLawyers[index].category, context)),
                          ),
                          backgroundColor: chipColors(topLawyers[index].category, context).withOpacity(0.09),
                        ),
                        SizedBox(width: 10),
                        Container(
                          child: Icon(
                            Icons.circle,
                            color: Colors.grey[500],
                            size: 6,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          topLawyers[index].firm,
                          style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.grey[500]),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          topLawyers[index].rating.toString(),
                          style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.grey[500]),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.star,
                          color: Colors.yellow[600],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[200],
      leading: Icon(
        Icons.menu,
        size: 32,
        color: Colors.grey[800],
      ),
      elevation: 0,
      actions: [
        Icon(
          Icons.notifications_none_outlined,
          size: 32,
          color: Colors.grey[800],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            child: Image.network("https://randomuser.me/api/portraits/men/1.jpg"),
          ),
        ),
      ],
    );
  }

  Color chipColors(category, context) {
    switch (category) {
      case "Criminal":
        return Colors.yellow[800];
      case "Intellectual":
        return Colors.green;
      case "Child Protection":
        return Theme.of(context).primaryColor;
      default:
        return Colors.blue;
    }
  }
}
