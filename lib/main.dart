import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabajo_cop_flutter/providers/product_form_provider.dart';
import 'package:trabajo_cop_flutter/screens/admin_grafica_screen.dart';
import 'package:trabajo_cop_flutter/screens/grafica_screen.dart';
import 'package:trabajo_cop_flutter/screens/graphs_screen.dart';
import 'package:trabajo_cop_flutter/screens/screens.dart';
import 'package:trabajo_cop_flutter/services/buscar_catalogo_service.dart';
import 'package:trabajo_cop_flutter/services/catalog_service.dart';
import 'package:trabajo_cop_flutter/services/catalog_service2.dart';
import 'package:trabajo_cop_flutter/services/graph_service.dart';
import 'package:trabajo_cop_flutter/services/orders_service.dart';
import 'package:trabajo_cop_flutter/services/pedidos_service.dart';
import 'package:trabajo_cop_flutter/services/producto_service.dart';
import 'package:trabajo_cop_flutter/services/services.dart';
import 'package:trabajo_cop_flutter/services/user_service.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => GetCiclos()),
        ChangeNotifierProvider(create: (_) => UsersListService()),
        ChangeNotifierProvider(create: (_) => GetArticulos()),
        ChangeNotifierProvider(create: (_) => GetPedidos()),
        ChangeNotifierProvider(create: (_) => ProductoService()),
        ChangeNotifierProvider(create: (_) => BuscarCatalogoService()),
        ChangeNotifierProvider(create: (_) => OrderService()),
        
        
        ChangeNotifierProvider(
          create: (_) => UserService(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => GetCompanies(),
          lazy: false,
        ),
        
        ChangeNotifierProvider(
          create: (_) => CatalogService(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => CatalogService2(),
          lazy: false,
        ),
        
        ChangeNotifierProvider(
          create: (_) => ProductFormProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GraphService(),
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginScreen(),
        'register': (_) => RegisterScreen(),
        'home': (_) => HomeScreen(),
        'admin': (_) => AdminScreen(),
        'catalogo': (_) => CatalogoScreen(),
        'pedidos': (_) => PedidosScreen(),
        'addpedidos': (_) => AddPedidosScreen(),
        'gestion': (_)=> adminGraficaScreen(),
        'graphs': (_)=> GraphsScreen(),
      },
      theme:
          ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.grey[300]),
    );
  }
}
