import 'package:exam_app/pages/favourite_page.dart';
import 'package:exam_app/pages/home_page.dart';
import 'package:exam_app/pages/profile_page.dart';
import 'package:flutter/material.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  PageController controller = PageController();
  int currentIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    const FavouritePage(),
    const ProfilePage()
  ];

  void nextPage(int index){
    currentIndex = index;
    controller.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: nextPage,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: ""
          ),

          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_outlined,
                color: Colors.black,
              ),
              label: ""
          ),

          BottomNavigationBarItem(
              icon: Icon(
                Icons.contact_page_outlined,
                color: Colors.black,
              ),
              label: ""
          ),
        ],
      ),
    );
  }
}
