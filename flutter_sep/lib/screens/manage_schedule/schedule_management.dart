import 'package:flutter/material.dart';

void main() {
  runApp(ScheduleManagementApp());
}

class ScheduleManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScheduleManagementScreen(),
    );
  }
}

class ScheduleManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Schedule",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Apply Schedule Button
            CustomButton(
              text: "Apply Schedule",
              onPressed: () {
                // Navigate or implement Apply Schedule functionality
                print("Apply Schedule Clicked");
              },
            ),
            SizedBox(height: 20),
            // Update Schedule Button
            CustomButton(
              text: "Update Schedule",
              onPressed: () {
                // Navigate or implement Update Schedule functionality
                print("Update Schedule Clicked");
              },
            ),
            SizedBox(height: 20),
            // Delete Schedule Button
            CustomButton(
              text: "Delete Schedule",
              onPressed: () {
                // Navigate or implement Delete Schedule functionality
                print("Delete Schedule Clicked");
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.yellow[700],
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "",
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          backgroundColor: Colors.yellow[600],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
