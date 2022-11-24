import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabajo_cop_flutter/models/models.dart';
import 'package:trabajo_cop_flutter/providers/login_form_provider.dart';
import 'package:trabajo_cop_flutter/services/services.dart';
import 'package:trabajo_cop_flutter/widgets/widgets.dart';
import 'package:trabajo_cop_flutter/models/models.dart';
import '../ui/input_decorations.dart';


class RegisterScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 205),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 3),
                    Text('Crear cuenta', style: Theme.of(context).textTheme.headline4),
                    SizedBox(height: 9),

                    ChangeNotifierProvider(
                      create: ( _ ) => LoginFormProvider(),
                      child: _RegisterForm()
                    ),

                  ],
                )
              ),

              SizedBox( height: 25),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(StadiumBorder())
                ),
                child: Text('¿Deseas iniciar sesion?', style: TextStyle(fontSize:18, color: Colors.black87)),
              ),
              SizedBox( height: 50),

            ],
          ),
        )
      )
    );
  }
}

class _RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final getCicles=Provider.of<GetCiclos>(context);
    // List<Ciclos> allCiclos= getCicles.getListCicles().cast<List<Ciclos>>();
    // for(int a=0;a<allCiclos.;a++){
    
    final getCicles=Provider.of<GetCiclos>(context);
    List<Ciclos> allCiclos= getCicles.listciclos;
    
    // for(var a in allCiclos) {
    //   print(a.name);
    // }
    
    // }
    final loginForm=Provider.of<LoginFormProvider>(context);
    //const List<Ciclos> listCiclos = authService.getCicles();
    return Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Nombre..',
                labelText: 'Tu nombre',
                prefixIcon: Icons.account_circle_outlined
              ),
              onChanged: (value) => loginForm.name=value,
              validator: (value) {
              },
            ),
            SizedBox(height:4),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Apellido...',
                labelText: 'Tu apellido',
                prefixIcon: Icons.add_task_outlined
              ),
              onChanged: (value) => loginForm.surname=value,
              validator: (value) {
              },
            ),
            SizedBox(height:4),

            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'prueba@gmail.com',
                labelText: 'Correo electronico',
                prefixIcon: Icons.alternate_email_rounded
              ),
              onChanged: (value) => loginForm.email=value,
              validator: (value) {

                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                  ? null
                  : 'Escribe un correo valido';
              },
            ),

            SizedBox(height:4),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*******',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline
              ),
              onChanged: (value) => loginForm.password=value,
              validator: (value) {

                return(value != null && value.length>=6 )
                ? null
                : 'La contraseña tiene que tener mas de 6 caracteres';

              },
            ),
            SizedBox(height:4),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*******',
                labelText: 'Repite la contraseña',
                prefixIcon: Icons.lock_outline
              ),
              onChanged: (value) => loginForm.cpassword=value,
              validator: (value) {

                return(value != null && value == loginForm.password)
                ? null
                : 'Tiene que ser la misma contraseña';

              },
            ),
            
            
            SizedBox(height:10),

            DropdownButtonExample(),
            // DropdownButton<Ciclos>(
            //   value: 'Primero',
            //   icon: const Icon(Icons.arrow_downward),
            //   elevation: 16,
            //   style: const TextStyle(color: Colors.deepPurple),
            //   underline: Container(
            //     height: 2,
            //     color: Colors.deepPurpleAccent,
            //   ),
            //   onChanged: (Ciclos? value) {
            //     // This is called when the user selects an item.
            //     setState(() {
            //       allCiclos = value.name!;
            //     });
            //   },
            //   items: list.map<DropdownMenuItem<Ciclos>>((Ciclos value) {
            //     return DropdownMenuItem<Ciclos>(
            //       value: value,
            //       child: Text(value.name),
            //     );
            //   }).toList(),
            // ),

            SizedBox(height:10),
            
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical:15),
                child:Text(
                  loginForm.isLoading
                    ? 'Espere'
                    : 'Ingresar',
                  style: TextStyle( color: Colors.white),
                )
              ),
              
              onPressed: loginForm.isLoading ? null : () async {
                FocusScope.of(context).unfocus();
                final authService=Provider.of<AuthService>(context, listen: false);

                if( !loginForm.isValidForm() ) return;

                loginForm.isLoading = true;
                
                final String? errorMessage =await authService.createUser(loginForm.name,loginForm.surname,loginForm.email, loginForm.password, loginForm.password);

                
                if(errorMessage==null) {
                  Navigator.pushReplacementNamed(context, 'home');

                }else {
                  print(errorMessage);
                  loginForm.isLoading = false;
                }    
              },
            )
          ],
        )
      
    );
  }
}

// const List<Ciclos> list = AuthService.getCicles();
// const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
 
  
  
  @override
  Widget build(BuildContext context) {
    
    final getCicles=Provider.of<GetCiclos>(context);
    List<Ciclos> allCiclos= getCicles.listciclos;
    //  for(var a in allCiclos) {
    //   ciclo=a;
    // }
    Ciclos ciclo;
    int a=0;
    
    
    return DropdownButton<Ciclos>(
      hint: Text(allCiclos[0].name),
      icon: const Icon(Icons.arrow_downward),
      elevation: 30,
      style: const TextStyle(color: Colors.purple),
      underline: Container(
        width: double.infinity,
        height: 1,
        color: Colors.purple,
        
      ),
      onChanged: (dynamic value) {
        // This is called when the user selects an item.
        setState(() {
          ciclo = value!;
        });
      },
      items: allCiclos.map<DropdownMenuItem<Ciclos>>((Ciclos value) {
        return DropdownMenuItem<Ciclos>(
          value: value,
          child: Text(value.name), 
        );
      }).toList(),
    );
  }
}