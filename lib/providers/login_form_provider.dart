import 'package:flutter/material.dart';
import 'package:trabajo_cop_flutter/providers/CiclesResponse.dart';

class LoginFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String name='';
  String surname='';
  String email='';
  String password='';
  String c_password='';
  String cicle_id='';

  // List<CiclesResponse> listCicles= [];

  bool _isLoading = false;
  bool get isLoading =>_isLoading;
  
  set isLoading( bool value) {
    _isLoading=value;
    notifyListeners();
  }


  bool isValidForm() {
    
    return formKey.currentState?.validate() ?? false;
  }
}