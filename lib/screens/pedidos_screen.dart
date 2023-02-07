import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabajo_cop_flutter/models/pedidos_models.dart';
import 'package:trabajo_cop_flutter/services/pedidos_service.dart';
import '../models/users.dart';
import '../services/services.dart';

class PedidosScreen extends StatefulWidget {
  PedidosScreen({Key? key}) : super(key: key);


  @override
    State<PedidosScreen> createState() => _PedidosScreenState();
}

class _PedidosScreenState extends State<PedidosScreen> {
  final articleservice = GetPedidos();

  @override
  Widget build(BuildContext context) {
    final getPedidos = Provider.of<GetPedidos>(context);
    
    List<Pedidos> listPedidos = getPedidos.listPedidos;
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacementNamed(context, 'home')
          ),
            title: Text("Pedidos"),
            backgroundColor: Color.fromARGB(255, 93, 109, 236)
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
               Navigator.pushReplacementNamed(context, 'addpedidos');
            },
            child: const Icon(Icons.add),
          ),
        
        body: ListView.builder(
          itemCount: listPedidos.length,
          itemBuilder: (BuildContext context, int index) {
            
              return Card(
    

              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
             
              margin: EdgeInsets.all(15),
              
              elevation: 10,

              child: Column(
                children: <Widget>[

                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 10, 35, 10),
                    title: Text('Numero de Pedido: '+listPedidos[index].num.toString()),
                    subtitle: Text('Empresa: '+listPedidos[index].target_company_name+'\nExpedicion: '+listPedidos[index].created_at+'\nEntrega: '+listPedidos[index].issue_date),
                    
                    leading: Icon(Icons.send_sharp),
                    iconColor: Color.fromARGB(255, 0, 167, 200),
                    
                    // iconColor: (listPedidos[index].delivery_notes==0) ? Color.fromRGBO(200, 0, 0, 1) : Color.fromARGB(255, 59, 193, 73),

                   
                    
                    // leading: (listPedidos[index].delivery_notes==0) ? 'Eligible for license' : 'Not eligible'
                    
                    // if(listPedidos[index].delivery_notes==0) {

                    // }
                  ),
                  
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      (listPedidos[index].delivery_notes==0) ? Icon(Icons.short_text, color: Color.fromRGBO(200, 0, 0, 1)) : Icon(Icons.short_text, color: Color.fromARGB(255, 59, 193, 73)),
                      (listPedidos[index].invoices==0) ? Icon(Icons.speaker_notes_rounded, color: Color.fromRGBO(200, 0, 0, 1)) : Icon(Icons.speaker_notes_rounded, color: Color.fromARGB(255, 59, 193, 73)),
                      // Icon(icon): (listPedidos[index].delivery_notes==0) ? Color.fromRGBO(200, 0, 0, 1) : Color.fromARGB(255, 59, 193, 73),

                      // FlatButton(onPressed: () => {}, child: Text('Aceptar')),
                      // FlatButton(onPressed: () => {}, child: Text('Cancelar'))
                    ],
                  )
                ],
              ),
            );
            
          },
        ),
      ),
    );
  }
}

