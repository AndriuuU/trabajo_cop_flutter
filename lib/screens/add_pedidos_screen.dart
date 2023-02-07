import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabajo_cop_flutter/ui/input_decorations.dart';

import '../models/models.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';


class AddPedidosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        appBar: AppBar(
            leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacementNamed(context, 'pedidos'),
            
          ),
            title: Text("Add pedidos"),
            backgroundColor: Color.fromARGB(255, 93, 109, 236),
            
          ),
          
         
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              
            },
            child: const Icon(Icons.add),
          ),
          body: Center(
            heightFactor: 1,
            child: _ContrainsCiclos(),
          ),
      ),
      
    );

  }
}
class _ContrainsCiclos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Container(
        child: _CiclosAll()

    );
  }
}

class _CiclosAll extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final getCicles=Provider.of<GetCiclos>(context);
    List<Ciclos> allCiclos= getCicles.listciclos;
    int cicleId=0;
    return DropdownButtonFormField<Ciclos>(
      decoration: InputDecorations.authInputDecoration(
          prefixIcon: Icons.view_week_outlined,
          hintText: 'Elige Cicle',
          labelText: 'Cicle'),
      // value: selectedItem,
      items: allCiclos
          .map(
            (courseName) => DropdownMenuItem(
              value: courseName,
              child: Text(courseName.name),
            ),
          )
          .toList(),
      onChanged: (value) {
        cicleId  = (value?.id.toInt())!;
        
      },

    );
  }
}

class _HacerPedidos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Container(
       

    );
  }
}

