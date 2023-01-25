import 'package:flutter/material.dart';
import 'package:movies/Presentation/UI/Home/Tabs/BrowseTab/BrowseTab.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/HomeTab.dart';
import 'package:movies/Presentation/UI/Home/Tabs/SearchTab/SearchTab.dart';
import 'package:movies/Presentation/UI/Home/Tabs/WatchListTab/WatchListTab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> Tabs = [HomeTab() , SearchTab() , BrowseTab() , WatchListTab()];

  int selectedIndex =  0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tabs[selectedIndex],
      bottomNavigationBar: SizedBox (
        height: 70,
        child: BottomNavigationBar(
          onTap: (index){
            setState(() {
              selectedIndex = index ;
            });
          },
          currentIndex: selectedIndex,
          items:const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/home.png'),),
              label: "HOME",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/search.png')),
              label: "SEARCH",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/browse.png')),
              label: "BROWSE",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/watchlist.png')),
              label: "WATCHLIST",
            ),
          ],
        ),
      ),
    );
  }
}
