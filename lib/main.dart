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
              String childName = getChildName(index);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChildDashboard(childName)),
              );
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

  // Function to determine child's name (replace with your logic)
  String getChildName(int index) {
    // You can replace this with your logic to get child's name
    return 'Child $index';
  }
}

class ChildDashboard extends StatelessWidget {
  final String childName;

  ChildDashboard(this.childName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(childName),
      ),
      body: Center(
        child: Text('Dashboard for $childName'),
        // Customize dashboard UI for each child...
      ),
      bottomNavigationBar: BottomNavigationBar(
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
          // Handle bottom navigation item taps for each child
          // Based on the index and child's data, navigate or perform actions
        },
      ),
    );
  }
}
