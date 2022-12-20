import 'package:flutter/material.dart';
import 'package:trabajo_cop_flutter/screens/catalogo_screen.dart';

class HomeScreen extends StatelessWidget{

  static const String _title = 'Home';

  // const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: HomeStateWidget(),
    );
  }
}

class HomeStateWidget extends StatefulWidget {
  const HomeStateWidget({super.key});

  @override
  State<HomeStateWidget> createState() => _HomeStateWidgetState();
}

class _HomeStateWidgetState extends State<HomeStateWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Catálogo',
      style: optionStyle,
    ),
    Text(
      'Index 1: Vacío',
      style: optionStyle,
    ),
    Text(
      'Index 2: Vacío',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Catálogo',
            // onPressed: () => (
            //   Navigator.pushReplacementNamed(context, 'home')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Vacío',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Vacío',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
