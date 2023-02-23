import 'dart:io';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabajo_cop_flutter/PdfGenerator.dart';
import 'package:trabajo_cop_flutter/ui/input_decorations.dart';

import '../models/Productos_model.dart';
import '../models/models.dart';
import '../models/pedidos_models.dart';
import '../models/user_data_models.dart';
import '../services/buscar_catalogo_service.dart';
import '../services/producto_service.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;


class AddPedidosScreen extends StatefulWidget {
  AddPedidosScreen({Key? key}) : super(key: key);
  @override
    State<AddPedidosScreen> createState() => AddPedidosScreen1();
    
}
class AddPedidosScreen1 extends State<AddPedidosScreen> {
    int? cicleId;
   reacompany_id() async {
      
          return cicleId;

        }
  @override
  Widget build(BuildContext context) {
     
    final getUser=Provider.of<UsersListService>(context);
    Data? datauser= getUser.ListDataUsers;  
    final getCicles=Provider.of<GetCiclos>(context);
    List<Ciclos> allCiclos= getCicles.listciclos;
    List<Ciclos> CiclosMenos=[];
    

    for(Ciclos c in allCiclos) { 
      if(c.id!=datauser?.companyId){
        CiclosMenos.add(c);
      }
    }
    
    final getCatalogo=Provider.of<BuscarCatalogoService>(context);
    final getProductos=Provider.of<ProductoService>(context);
    List<Datum> allProduct= [];
    // getProductos.listPedidos
    print(cicleId);
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
            onPressed: () async {
              // await PdfGenerator().generate('path/to/your/pdf/file.pdf');
              // await sendPdf('path/to/your/pdf/file.pdf');
              
            
            },
            child: const Icon(Icons.add),
          ),

          
          body: Column(
            
            children: [
              
              DropdownButtonFormField(
            decoration: InputDecorations.authInputDecoration(
          prefixIcon: Icons.view_week_outlined,
          hintText: 'Elige Cicle',
          labelText: 'Cicle'),
          
      // value: selectedItem,
      items: CiclosMenos
          .map(
            (courseName) => DropdownMenuItem(
              value: courseName,
              child: Text(courseName.name),
            ),
          )
          .toList(),
      onChanged: (value) { setState(() {
                  
                
        cicleId  = (value?.id.toInt())!;
        print(cicleId);
      
        allProduct= getCatalogo.listPedidos;
        print("object");
        for(Datum a in allProduct) {
          print(a.compamyName);
        }
         print(getCatalogo.isLoading);

        });

         if(getCatalogo.isLoading==false)

      
       SizedBox(
        
            height: MediaQuery.of(context).size.height*0.759,
            child: ListView.builder(
            itemCount: allProduct.length,
            itemBuilder: (BuildContext context, int index) {

              return Card(
              
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
             
              margin: EdgeInsets.all(15),
              
              elevation: 10,

              child: Column(
                children: <Widget>[
                  SizedBox(height: 30),
                ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 10, 35, 10),
                    title: Text(allProduct[index].compamyName),
                    subtitle: Text(allProduct[index].price+'€'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                        checkColor: Colors.black,
                        value: false,
                        onChanged: (bool? value) {
                          setState(() {
                            
                          
                          });
                        },
                    ),
                    Checkbox(
                        checkColor: Colors.black,
                        value: false,
                        onChanged: (bool? value) {
                          setState(() {
                            
                          
                          });
                        },
                    )
                  ],
                ),
                ]
              )
              );
            
        
            

            
            
          }
          ),
       );
       
      
      })
      

     
      
            ]
       ),
      ),
      
    );

  }
}
class ContrainsCiclos extends StatelessWidget {
  int? cicleId;

  
  @override
  Widget build(BuildContext context) {
    
    final getUser=Provider.of<UsersListService>(context);
    Data? datauser= getUser.ListDataUsers;  
    final getCicles=Provider.of<GetCiclos>(context);
    List<Ciclos> allCiclos= getCicles.listciclos;
    List<Ciclos> CiclosMenos=[];


    for(Ciclos c in allCiclos) { 
      if(c.id!=datauser?.companyId){
        CiclosMenos.add(c);
      }
    }

    final getProductos=Provider.of<ProductoService>(context);
    List<Datum> allProduct= getProductos.listPedidos;
    for(Datum d in allProduct){
      print(d.compamyName);
    }

    return Container(
      
      // alignment: Alignment.center,
      // width: double.infinity,
      // height: double.infinity,
      // margin: const EdgeInsets.all(10),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   border: Border.all(
      //   color: const Color(0xFF616161),
      //   width: 0.65,
      //   ),
      //   borderRadius: BorderRadius.circular(8),
      //   ),
        child: Column(
        children: <Widget>[ 
          // _CiclosAll(),
          

          DropdownButtonFormField(
            decoration: InputDecorations.authInputDecoration(
          prefixIcon: Icons.view_week_outlined,
          hintText: 'Elige Cicle',
          labelText: 'Cicle'),
      // value: selectedItem,
      items: CiclosMenos
          .map(
            (courseName) => DropdownMenuItem(
              value: courseName,
              child: Text(courseName.name),
            ),
          )
          .toList(),
      onChanged: (value) {
        cicleId  = (value?.id.toInt())!;
        
        _CiclosAll();
      },
            ),
            
            
          SizedBox(height: 30),
          
          
           
          // (cicleId!=null)? _CiclosAll(): SizedBox(height: 30),
        
      //     MaterialApp( 
      //       home: Scaffold(
      //       body: ListView.builder(
      //       itemCount: allProduct.length,
      //       itemBuilder: (BuildContext context, int index) {
              
      //         return Card(
      //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
             
      //         margin: EdgeInsets.all(15),
              
      //         elevation: 10,

      //         child: Column(
      //           children: <Widget>[
      //           ListTile(
      //               contentPadding: EdgeInsets.fromLTRB(15, 10, 35, 10),
      //               title: Text('Numero de Pedido: '),
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.end,
      //             children: <Widget>[
      //               Text("hola"),
      //             ],
      //           ),
      //           ]
      //         )
      //         );
      //     }
      //     ),
      // ),
      //     ),
          // _HacerPedidos(),
        ]
        )
        // child: _HacerPedidos(),

    );
  }
  

}



// class _IgualCatalogo {



// }
class _CiclosAll extends ContrainsCiclos {
  
  @override
  Widget build(BuildContext context) {
    
    final getProductos=Provider.of<ProductoService>(context);
    List<Datum> allProduct= getProductos.listPedidos;
    print("nacho");
    for(Datum d in allProduct){
      print(d.compamyName);
    }
    return MaterialApp( 
            home: Scaffold(
            body: ListView.builder(
            itemCount: allProduct.length,
            itemBuilder: (BuildContext context, int index) {
              
              return Card(
                
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
             
              margin: EdgeInsets.all(15),
              
              elevation: 10,

              child: Column(
                children: <Widget>[
                  SizedBox(height: 30),
                ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 10, 35, 10),
                    title: Text('Numero de Pedido: '),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("hola"),
                  ],
                ),
                ]
              )
              );
          }
          ),
            )
          );
  }
}

// class _HacerPedidos extends StatelessWidget {
//   final _CiclosAll ciclosMe =_CiclosAll();
//   @override
//   Widget build(BuildContext context) {
    
//     ciclosMe.
//     return Container(
      
  

//     );
//   }
// }

