import 'package:flutter/material.dart';

class ScheduleScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScheduleScreen(),
    );
  }
}

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  final List<int> years =
      List.generate(101, (index) => 2020 + index); // From 2020 to 2120
  final List<int> days =
      List.generate(31, (index) => index + 1); // From 1 to 31

  int selectedDay = 30;
  String selectedMonth = "October";
  int selectedYear = 2024;

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
          "Select Date",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Scrollable Date Pickers
          Container(
            color: Colors.yellow[600],
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Day Picker
                Flexible(
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 40,
                    diameterRatio: 1.5,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedDay = days[index];
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return Center(
                          child: Text(
                            days[index].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        );
                      },
                      childCount: days.length,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                // Month Picker
                Flexible(
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 40,
                    diameterRatio: 1.5,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedMonth = months[index];
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return Center(
                          child: Text(
                            months[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        );
                      },
                      childCount: months.length,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                // Year Picker
                Flexible(
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 40,
                    diameterRatio: 1.5,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedYear = years[index];
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return Center(
                          child: Text(
                            years[index].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        );
                      },
                      childCount: years.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          // Display Selected Date
          Text(
            "Selected Date: $selectedDay $selectedMonth $selectedYear",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 16),
          // Task List
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                ScheduleCard(
                  name: "Amin Bin Rosli",
                  address:
                      "No. 13 Lorong Makmur Beruas Jaya 7,\nTaman Makmur Beruas Jaya,\n26060 Pecan, Pahang",
                  task: "Dusting surfaces, vacuuming floors.",
                  phone: "013-4786547",
                  price: "RM 20",
                  status: "Decline",
                ),
                ScheduleCard(
                  name: "Aminah Binti Rosli",
                  address:
                      "No. 9 Lorong Makmur Beruas Jaya 7,\nTaman Makmur Beruas Jaya,\n26060 Pecan, Pahang",
                  task: "Mopping, wiping windows.",
                  phone: "012-4356547",
                  price: "RM 30",
                  status: "Accepted",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String name;
  final String address;
  final String task;
  final String phone;
  final String price;
  final String status;

  ScheduleCard(
      {required this.name,
      required this.address,
      required this.task,
      required this.phone,
      required this.price,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow[600],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      margin: EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(phone, style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              address,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              "Task: $task",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            status == "Accepted" ? Colors.green : Colors.red,
                      ),
                      child: Text(status),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
