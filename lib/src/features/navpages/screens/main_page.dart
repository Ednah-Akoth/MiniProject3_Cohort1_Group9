import 'package:flutter/material.dart';
import 'package:job_application/src/features/navpages/screens/profile_page.dart';

import '../../../constants/colors.dart';
import 'applied_jobs.dart';
import 'home_page.dart';
import 'myjobs_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // List pages = [HomePage(), ChatPage(), MyJobsPage(), ProfilePage()];
  List pages = [HomePage(), MyJobsPage(), AppliedJobs(), ProfilePage()];
  int currentIndex = 0;
  void onTap(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: tPrimaryColor,
        unselectedItemColor: tTextAccentColor.withOpacity(0.6),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        elevation: 70.0,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "Saved", icon: Icon(Icons.bookmark_add_rounded)),
          BottomNavigationBarItem(label: "Applied", icon: Icon(Icons.work)),
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person))
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
