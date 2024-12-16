import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sep/firebase_options.dart';
import 'package:flutter_sep/screens/dashboard.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Request location permission before starting the app
  await requestLocationPermission();

  runApp(const MyApp());
}

Future<void> requestLocationPermission() async{
  //check the current permission status
  var status = await Permission.location.request();

  if (status.isGranted){
    print("Location permission granted"); // dont use print in production code
  } else if (status.isDenied) {
    print("Location permission denied");
  } else if (status.isPermanentlyDenied) {
    print("Location permission permanently denied. Open settings to enable");
    await openAppSettings();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Dashboard(),
    );
  }
}

class _MainNavigationState extends StatefulWidget {
  const _MainNavigationState({super.key});

  @override
  State<_MainNavigationState> createState() => __MainNavigationStateState();
}

class __MainNavigationStateState extends State<_MainNavigationState> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Dashboard',
      style:optionStyle
    ),
    Text(
      'Index 1: Dashboard',
      style:optionStyle
    ),
    Text(
      'Index 2: Dashboard',
      style:optionStyle
    ),
    Text(
      'Index 3: Dashboard',
      style:optionStyle
    ),
    Text(
      'Index 4: Dashboard',
      style:optionStyle
    ),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample')
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex)
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [ 
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: 'Profile'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Schedule'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: 'Report'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings'
          ),   
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

