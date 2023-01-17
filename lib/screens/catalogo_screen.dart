import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../services/services.dart';

class CatalogoScreen extends StatefulWidget {
  CatalogoScreen({Key? key}) : super(key: key);

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();
  final articleservice = GetArticulos();
  // List<Articles> listArticulos =[];

  Widget _listViewBody(BuildContext context) {
    final getArticle = Provider.of<GetArticulos>(context);
    List<Articles> listArticulos = getArticle.listArticulos;

    return ListView.builder(
      controller: _homeController,
      itemCount: listArticulos.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          color: Theme.of(context).colorScheme.surfaceVariant,
          child: ListTile(
            title: Text(
              listArticulos[index].name,
              style: const TextStyle(fontSize: 24),
            ),
            trailing: Text(
              listArticulos[index].description,
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
      body: _listViewBody(context),
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
