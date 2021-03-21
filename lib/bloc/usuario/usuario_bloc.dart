import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:estados/models/usuario_model.dart';

part 'usuario_state.dart';

part 'usuario_events.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState());

  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    // TODO: implement mapEventToState
    if(event is ActivarUsuario){
     yield state.copyWith(usuario: event.usuario); 
    }else if (event is CambiarEdad){
      yield state.copyWith(usuario: state.usuario.copyWidth(edad: event.edad));
    }else if (event is AgregarProfesion){
      final profesiones = [...state.usuario.profesiones, '${event.profesion} ${state.usuario.profesiones.length+1}'];
      yield state.copyWith(usuario: state.usuario.copyWidth(profesiones: profesiones));
    }else if (event is BorrarUsuario){
      yield state.estadoInicial();
    }
  }
}
