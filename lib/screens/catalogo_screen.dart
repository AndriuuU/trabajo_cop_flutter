import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../services/services.dart';

// void main() => runApp(const MyApp());

class CatalogoScreens extends StatelessWidget {
  // const MyApp({super.key});

  static const String _title = 'Catálogo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: CatalogoStateWidget(),
    );
  }
}

class CatalogoStateWidget extends StatefulWidget {
  const CatalogoStateWidget({super.key});

  @override
  State<CatalogoStateWidget> createState() => CatalogoStateWidgetState();
}

class CatalogoStateWidgetState extends State<CatalogoStateWidget> {
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();
  
  
  Widget _listViewBody() {
    final getArticle=Provider.of<articulosService>(context);
    List<Articles> allArticles= getArticle.GetArticulos();

    return ListView.builder(
        controller: _homeController,
        itemCount: allArticles.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 5),
              color: Colors.amberAccent,
              child: ListTile(
                title: Text(
                  allArticles[index].name,
                  style: const TextStyle(fontSize: 24),
                ),
                trailing: Text(
                  allArticles[index].description,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
          );

        },
          
          
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo'),
      ),
      body: _listViewBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add article',
            // onPressed: addArticulo(),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          switch (index) {
            case 0:
              // only scroll to top when current index is selected.
              if (_selectedIndex == index) {
                _homeController.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              }
              break;
            case 1:
              showModal(context);
              break;
          }
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }

  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Example Dialog'),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          )
        ],
      ),
    );
  }

  // void addArticulo() {
  //   setState(() {
  //     articles.add(articles[0]);
  //   });
  // }
}
