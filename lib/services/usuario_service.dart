


import 'package:estados/models/usuario_model.dart';
import 'package:flutter/material.dart';

class UsuarioService with ChangeNotifier {
  Usuario _usuario;
  
  Usuario get usuario => this._usuario;

  bool get isExUsuario => (this._usuario != null ? true : false);

  set usuario(Usuario user){
    this._usuario= user;
    notifyListeners();
  }

  void cambiarEdad(int edad ){
    this._usuario.edad=edad;
    notifyListeners();
  }

  void removerUsuario(){
    this._usuario=null;
    notifyListeners();
  }

  void agregarProfesion(){
    this.usuario.profesiones.add('Profesion ${this.usuario.profesiones.length+1}');
    notifyListeners();
  }


}