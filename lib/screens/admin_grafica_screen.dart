import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabajo_cop_flutter/models/ciclos_models.dart';
import 'package:trabajo_cop_flutter/models/orders_models.dart';
import 'package:trabajo_cop_flutter/services/buscar_catalogo_service.dart';
import 'package:trabajo_cop_flutter/services/ciclos_service.dart';
import 'package:trabajo_cop_flutter/ui/input_decorations.dart';


class adminGraficaScreen extends StatefulWidget {
  adminGraficaScreen({Key? key}) : super(key: key);
  
  @override
  State<adminGraficaScreen> createState() => adminGrafica();
    
}

class adminGrafica extends State<adminGraficaScreen> {
    int? cicleId;
    reacompany_id() async {

      return cicleId;

    }
        
  @override
  Widget build(BuildContext context) {
    // final getCicles=Provider.of<BuscarCatalogoService>(context);
    // List<Datum2> allCiclos= getCicles.listPedidos2;

    final getCicles=Provider.of<GetCiclos>(context);
    List<Ciclos> allCiclos= getCicles.listciclos;
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        
        appBar: AppBar(
            leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacementNamed(context, 'home'),
            
          ),
            title: Text("Gestion admin"),
            backgroundColor: Color.fromARGB(255, 93, 109, 236),
            
          ),
          
          body: Column(
          children: <Widget>[
            
          DropdownButtonFormField(
      
            decoration: InputDecorations.authInputDecoration(
            prefixIcon: Icons.view_week_outlined,
            hintText: 'Elige Cicle',
            labelText: 'Cicle'),
          
            // value: selectedItem,
            
            items: allCiclos
                .map(
                  
                  (courseName) => DropdownMenuItem(
                    value: courseName,
                    child: Text(courseName.name.toString()),
                  ),
                )
                .toList(),
            onChanged: (value) { setState(() {
                        
                      
              cicleId  = (value?.id.toInt())!;

              Navigator.pushReplacementNamed(context, 'grafica');
            });}
            )]
          )
      )
    
  );
  }
}