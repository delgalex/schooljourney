import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_journey/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:school_journey/src/providers/login_form_provider.dart';
import 'package:school_journey/src/providers/login_service.dart';
import 'package:school_journey/src/ui/input_decorations.dart';
import 'package:school_journey/src/widgets/widgets.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground( // le vamos a esta clase un widget con el formulario
        child: SingleChildScrollView( // permite el scroll si su hijos superan el tamaño es parecido a ListView
          child: Column(
            children: [
             
            const SizedBox(height: 250),
             
             CardLoginContainer(
               child: Column(
                 children: [

                   const SizedBox( height: 10 ),
                   Text('Inicia tu experiencia', style: Theme.of(context).textTheme.headline5 ), 
                   const SizedBox( height: 30),

                  ChangeNotifierProvider(
                    create: ( _ ) => LoginFormProvider(),
                    child: _LoginForm()
                  )

                 ],
               )
             ), 
              /*
              const SizedBox( height: 50 ),
              const Text('Crear una nueva cuenta', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold) ),
              const SizedBox( height: 50),
              */
            ],
          ),
        )
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginFormProvider>(context);// necesitamos que busque la instamncia de Login...
    // ignore: avoid_unnecessary_containers
    return Container(
      // ignore: todo
      // TODO: matener la referencia al KEY
      child: Form(
        key: loginForm.formKey,
        autovalidateMode :  AutovalidateMode.onUserInteraction,
        
        child: Column(
          children: [

            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                hintText: '',
                labelText: 'Usuario',
                pefixIcon: Icons.alternate_email_rounded
              ),
              onChanged: (value) => loginForm.email = value,
               validator: ( value ) {
                
                return ( value != null && value.length >= 4 )
                  ? null
                  : 'Usuario no vàlido';

              }
            ),

            const SizedBox(height: 30),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType:  TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '******',
                labelText: 'Clave',
                pefixIcon: Icons.lock_outline
              ),
              onChanged: (value) => loginForm.password = value,
              validator: ( value ) {
                /* en if
                if( value != null && value.length >= 6 ) return null;
                return 'La contraseña no es válida';
                */
                return ( value != null && value.length >= 3 )
                  ? null
                  : 'La clave no es válida';

              }
            ),

            const SizedBox(height: 30),

            MaterialButton(
              shape: RoundedRectangleBorder( borderRadius:  BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.blue[900],
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  loginForm.isLoanding
                  ? 'Espere...'
                  : 'Ingresar',
                  style: TextStyle( color: Colors.white),

                )  
              ),
              onPressed: loginForm.isLoanding ? null : () async{

                FocusScope.of(context).unfocus(); // quita el teclado
                final loginService = Provider.of<LoginService>(context, listen: false); // listen false por estar dentro de un mètodo
            
                if( !loginForm.isValidForm()) return;

                loginForm.isLoanding = true;
                
                final String? errorMensaje = await loginService.login(loginForm.email, loginForm.password);

                if( errorMensaje == null  ){
                  Navigator.pushReplacementNamed(context, 'dashboard');// con este ya no puede regresar al login, destruye todo el origen
                }else{
                  //NotificationsService.showSnackbar(errorMensaje);
                  loginForm.isLoanding = false;
                  final snackBar = SnackBar( content: Text('Clave o usuario incorrecto'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                 //  print(errorMensaje);
                }

                
              },
            ),

            const SizedBox(height: 30),
            Text('Ver 1.0.8')

            
          ],
        ),
      ),     
    );
  }
}