import 'package:flutter/material.dart';
import '../theme/colors.dart';
// Import your screens
import 'home/home_screen.dart';
import 'search/search_screen.dart';
import 'upload/upload_screen.dart';
import 'profile/profile_screen.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  // 1. Current Index for the Bottom Bar
  int _currentIndex = 0;

  // 2. PageController to handle swiping
  final PageController _pageController = PageController();

  // 3. List of Screens (Order matches Bottom Bar items)
  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const UploadScreen(),
    const ProfileScreen(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemTapped(int index) {
    // Animate the PageView when the Bottom Bar is tapped
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 4. PageView allows sliding between screens
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const BouncingScrollPhysics(), // Smooth bounce effect
        children: _screens,
      ),

      // 5. Persistent Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.white10, width: 0.5)),
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.background, // Match app background
          type: BottomNavigationBarType.fixed, // Needed for 4+ items
          currentIndex: _currentIndex,
          selectedItemColor: AppColors.primaryRed,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud_upload_outlined),
              activeIcon: Icon(Icons.cloud_upload),
              label: 'Upload',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
