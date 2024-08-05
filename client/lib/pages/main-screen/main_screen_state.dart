import 'package:client/pages/color.dart';
import 'package:client/pages/home-page/home_page.dart';
import 'package:client/pages/item-page/item_page.dart';
import 'package:client/pages/main-screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ItemPage(),
    const Center(child: Text('Fuck You Content'))
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorNotifier = Provider.of<ColorNotifier>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (String result) {
                print(result);
                if (result == "Dark") {
                  colorNotifier.background = Colors.black;
                  colorNotifier.textColor = Colors.white;
                } else {
                  colorNotifier.background = Colors.white;
                  colorNotifier.textColor = Colors.black;
                  print("chaging color");
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'Dark',
                      child: Text('Dark'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Light',
                      child: Text('Light'),
                    ),
                  ])
        ],
        automaticallyImplyLeading: false,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Items',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
