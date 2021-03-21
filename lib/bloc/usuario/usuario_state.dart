part of 'usuario_cubic.dart';

@immutable
abstract class UsuarioState{}

class UsuarioInitial extends UsuarioState{
  final existeUsuario = false;



  // @override
  // String toString() {
  // return 'Usuario Inicial: ExisteUsuario:false';
  //  }
}

class UsuarioActivo extends UsuarioState {
    final existeUsuario = true;

    final Usuario usuario;

  UsuarioActivo(this.usuario); 
}


