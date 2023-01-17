import 'package:flutter/material.dart';

class ListadoPedidos extends StatelessWidget {
  final String title ="";
  final String description="";
  final String date="";

  // OrderCard({this.title, this.description, this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 8.0),
            Text(description),
            SizedBox(height: 8.0),
            Text(date),
          ],
        ),
      ),
    );
  }
}

class OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListadoPedidos(
          
        ),
        ListadoPedidos(
        
        ),
      ],
    );
  }
}