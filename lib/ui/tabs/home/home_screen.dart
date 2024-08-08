import 'package:flutter/material.dart';
import 'package:task_auvnet/my_theme.dart';
import 'package:task_auvnet/ui/tabs/home/cubit/home_screen_view_model.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: MyTheme.primaryColor),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
            child: BottomNavigationBar(
              currentIndex: homeScreenViewModel.selectIndex,
              onTap: (index) {
                homeScreenViewModel.changeBottomNavBar(index);
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: homeScreenViewModel.selectIndex == 0
                        ? selectedItem("assets/images/list.png")
                        : unselectedItem("assets/images/list.png"),
                    label: ""),
                BottomNavigationBarItem(
                    icon: homeScreenViewModel.selectIndex == 1
                        ? selectedItem("assets/images/Frame80.png")
                        : unselectedItem("assets/images/Frame80.png"),
                    label: ""),
              ],
            ),
          ),
        ),
        body: homeScreenViewModel.tabs[homeScreenViewModel.selectIndex],
      ),
    );
  }
}

Widget selectedItem(String image) {
  return CircleAvatar(
      backgroundColor: Colors.white,
      child: ImageIcon(
        AssetImage(image),
        size: 50,
      ));
}

Widget unselectedItem(String image) {
  return ImageIcon(
    AssetImage(image),
    size: 50,
  );
}
