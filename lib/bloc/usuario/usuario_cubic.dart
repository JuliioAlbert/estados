import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:estados/models/usuario_model.dart';

part 'usuario_state.dart';

class UsuarioCubic extends Cubit<UsuarioState>{
  UsuarioCubic() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario user){
    emit(UsuarioActivo(user));
  }  

  void cambiarEdad(int edad){
    final currentState = state;
    if(currentState is UsuarioActivo){
      final newUser= currentState.usuario.copyWidth(edad: edad);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion(){
      final currentState = state;
      if(currentState is UsuarioActivo){
      
      final newProfesiones = [...currentState.usuario.profesiones, "Profesion ${currentState.usuario.profesiones.length+1}"];
      final newUser= currentState.usuario.copyWidth(profesiones: newProfesiones );
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario(){
    emit(UsuarioInitial());
  }

}