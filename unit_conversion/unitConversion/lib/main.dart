import 'package:bizzcard/ui/home.dart';
import 'package:bizzcard/ui/pressure.dart';
import 'package:bizzcard/ui/temperature.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Pressure(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List list = [UnitConversion(), Temperature(), Pressure()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: 'Length',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tablet),
            label: 'Temp',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Pressure',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedFontSize: 20,
        unselectedFontSize: 20,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.green,
        backgroundColor: Color.fromARGB(255, 78, 101, 236),
        selectedIconTheme: IconThemeData(
          color: Colors.black,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
    );
  }
}
