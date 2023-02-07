import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabajo_cop_flutter/ui/input_decorations.dart';

import '../models/Productos_model.dart';
import '../models/models.dart';
import '../models/pedidos_models.dart';
import '../models/user_data_models.dart';
import '../services/producto_service.dart';
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
            heightFactor: 2,     
            child: ContrainsCiclos(),
          ),
      ),
      
    );

  }
}
class ContrainsCiclos extends StatelessWidget {
    int cicleId=0;
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

    // final getProductos=Provider.of<ProductoService>(context);
    // List<Datum> allProduct= getProductos.listPedidos;

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
        
      },
            ),
          SizedBox(height: 30),
        
      //     MaterialApp( 
      //       home: Scaffold(
      //       body: ListView.builder(
      //       itemCount: allProduct.length,
      //       itemBuilder: (BuildContext context, int index) {
              
      //         return Card(
                
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

// class _CiclosAll extends StatelessWidget {
//   int cicleId=0;
//   int get cicle_id=>cicleId;
  

//   @override
//   Widget build(BuildContext context) {

//     return DropdownButtonFormField<Ciclos>(
//       decoration: InputDecorations.authInputDecoration(
//           prefixIcon: Icons.view_week_outlined,
//           hintText: 'Elige Cicle',
//           labelText: 'Cicle'),
//       // value: selectedItem,
//       items: CiclosMenos
//           .map(
//             (courseName) => DropdownMenuItem(
//               value: courseName,
//               child: Text(courseName.name),
//             ),
//           )
//           .toList(),
//       onChanged: (value) {
//         cicleId  = (value?.id.toInt())!;
//         print(cicleId);
        
//       },

//     );
//   }
// }

// class _HacerPedidos extends StatelessWidget {
//   final _CiclosAll ciclosMe =_CiclosAll();
//   @override
//   Widget build(BuildContext context) {
    
//     ciclosMe.
//     return Container(
      
  

//     );
//   }
// }

