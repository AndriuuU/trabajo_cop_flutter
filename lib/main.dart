import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabajo_cop_flutter/screens/listado_pedidos.dart';
import 'package:trabajo_cop_flutter/screens/screens.dart';
import 'package:trabajo_cop_flutter/services/pedidos_service.dart';
import 'package:trabajo_cop_flutter/services/services.dart';

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
        
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginScreen(),
        'register': (_) => RegisterScreen(),
        'home': (_) => HomeScreen(),
        'admin': (_) => AdminScreen(),
        'catalogo': (_) => CatalogoScreen(),
        'pedidos': (_) => PedidosScreen(),
        'listadoPedidos': (_) => ListadoPedidos(),
      },
      theme:
          ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.grey[300]),
    );
  }
}
