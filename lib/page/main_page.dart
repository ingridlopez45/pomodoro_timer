import "package:flutter/material.dart";
import "package:pomodoro_timer/pomodoro_page.dart";

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  final screenNames = ["Timers", "Settings"];
  final pageController = PageController();

  final screens = [PomodoroPage(), PomodoroPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() => selectedIndex = index);
        },
        children: screens,
      ),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          title: Text(
            screenNames[selectedIndex],
            style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.pushNamed(context, "/profile");
              },
            ),
          ]),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (int value) {
            setState(() => selectedIndex = value);
            pageController.jumpToPage(value);
          },
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.punch_clock),
                activeIcon: Icon(Icons.punch_clock_outlined),
                label: "Timers"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                activeIcon: Icon(Icons.settings_applications),
                label: "Settings"),
          ]),
    );
  }
}
