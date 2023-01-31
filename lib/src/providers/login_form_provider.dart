import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{
// lo utilizo para validar y redibujar el estado de la UI cambio de vista del BTN
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();

  String email = '';
  String password = '';
 
  bool _isLoanding = false;
  
  bool get isLoanding => _isLoanding;

  set isLoanding( bool value ){
    _isLoanding = value;
    notifyListeners();
  }

  bool isValidForm(){// validamos 
    print(formKey.currentState?.validate());
    print( '$email - $password' );
    return formKey.currentState?.validate() ?? false;
  }

}