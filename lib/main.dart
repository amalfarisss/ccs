import 'package:flutter/material.dart';
import 'package:flutter_sep/screens/manage_schedule/schedule_management.dart';
import 'package:flutter_sep/screens/manage_schedule/schedule_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sep/firebase_options.dart';
import 'package:flutter_sep/screens/dashboard.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DrawerMenu(),
    );
  }
}

class ScheduleScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScheduleScreen(),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  // Move the menuItems list as a class-level variable
  final List<MenuItem> menuItems = [
    MenuItem(
        title: "Profile", icon: Icons.person, destination: ProfileScreen()),
    MenuItem(
        title: "Schedule",
        icon: Icons.schedule,
        destination: ScheduleManagementScreen()),
    MenuItem(
        title: "Activity", icon: Icons.group, destination: ActivityScreen()),
    MenuItem(
        title: "Report", icon: Icons.bar_chart, destination: ReportScreen()),
    MenuItem(
        title: "Rating/Complaint",
        icon: Icons.feedback,
        destination: RatingScreen()),
    MenuItem(
        title: "Payment",
        icon: Icons.attach_money,
        destination: PaymentScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Text('CCS', style: TextStyle(color: Colors.black)),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.yellow[600],
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.yellow[600]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cleaning_services,
                        size: 50, color: Colors.black),
                    SizedBox(height: 10),
                    Text(
                      'CCS',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              DrawerItem(
                title: 'Home',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              DrawerItem(
                title: 'About Us',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUsScreen()),
                  );
                },
              ),
              DrawerItem(
                title: 'Activity',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ActivityScreen()),
                  );
                },
              ),
              DrawerItem(
                title: 'Schedule',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScheduleScreen()),
                  );
                },
              ),
              DrawerItem(
                title: 'Complaint/Rating',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RatingScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item.destination),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellow[600],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item.icon, size: 50, color: Colors.black),
                    SizedBox(height: 8.0),
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule), label: "Schedule"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Report"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
        ],
        selectedItemColor: Colors.yellow[700],
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  DrawerItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
      onTap: onTap,
    );
  }
}

class DashboardPage extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(
        title: "Profile", icon: Icons.person, destination: ProfileScreen()),
    MenuItem(
        title: "Schedule", icon: Icons.schedule, destination: ScheduleScreen()),
    MenuItem(
        title: "Activity", icon: Icons.group, destination: ActivityScreen()),
    MenuItem(
        title: "Report", icon: Icons.bar_chart, destination: ReportScreen()),
    MenuItem(
        title: "Rating/Complaint",
        icon: Icons.feedback,
        destination: RatingScreen()),
    MenuItem(
        title: "Payment",
        icon: Icons.attach_money,
        destination: PaymentScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Text("Dashboard"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Back to Drawer Menu
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item.destination),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellow[600],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item.icon, size: 50, color: Colors.black),
                    SizedBox(height: 8.0),
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MenuItem {
  final String title;
  final IconData icon;
  final Widget destination;

  MenuItem(
      {required this.title, required this.icon, required this.destination});
}

// Placeholder screens
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(child: Text("Profile Screen")),
    );
  }
}

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Us")),
      body: Center(child: Text("About Us Screen")),
    );
  }
}

class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Activity")),
      body: Center(child: Text("Activity Screen")),
    );
  }
}

class RatingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rating/Complaint")),
      body: Center(child: Text("Rating/Complaint Screen")),
    );
  }
}

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment")),
      body: Center(child: Text("Payment Screen")),
    );
  }
}

class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Report")),
      body: Center(child: Text("Report Screen")),
    );
  }
}
