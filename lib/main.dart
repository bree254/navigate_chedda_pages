import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Age Group App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChildrenPage(),
    );
  }
}

class ChildrenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Children Profiles'),
      ),
      body: GridView.builder(
        itemCount: 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              String childAgeGroup = getChildAgeGroup(index);
              navigateToAgeGroupPage(context, childAgeGroup);
            },
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Child $index',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Function to determine child's age group (replace with your logic)
  String getChildAgeGroup(int index) {
    if (index == 0) {
      return 'AgeGroup1';
    } else if (index == 1) {
      return 'AgeGroup2';
    } else {
      return 'AgeGroup3';
    }
  }

  // Function to navigate to age-specific pages based on age group
  void navigateToAgeGroupPage(BuildContext context, String ageGroup) {
    Widget pageToNavigate;

    switch (ageGroup) {
      case 'AgeGroup1':
        pageToNavigate = AgeGroup1Page();
        break;
      case 'AgeGroup2':
        pageToNavigate = AgeGroup2Page();
        break;
      case 'AgeGroup3':
        pageToNavigate = AgeGroup3Page();
        break;
      default:
        pageToNavigate = AgeGroup1Page(); // Default to AgeGroup1Page
    }

    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => pageToNavigate),
    );
  }
}

// Age Group 1 Page
class AgeGroup1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age Group 1'),
      ),
      body: Center(
        child: Text('Content for Age Group 1'),
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 0),
    );
  }
}

// Age Group 2 Page
class AgeGroup2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age Group 2'),
      ),
      body: Center(
        child: Text('Content for Age Group 2'),
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 1),
    );
  }
}

// Age Group 3 Page
class AgeGroup3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age Group 3'),
      ),
      body: Center(
        child: Text('Content for Age Group 3'),
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 2),
    );
  }
}

// Shared Bottom Navigation Bar Widget
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  CustomBottomNavBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_fire_department),
          label: 'Quest',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.emoji_people),
          label: 'Profile',
        ),
      ],
      onTap: (index) {
        // Handle bottom navigation item taps if needed
      },
    );
  }
}
