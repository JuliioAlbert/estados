import 'package:estados/bloc/usuario/usuario_bloc.dart';
import 'package:estados/models/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);
    return Scaffold(
       appBar: AppBar(
        title: Text('Pagina2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(onPressed: (){
              final newUsuario = Usuario(nombre: "Julio",edad: 22, profesiones: ["Developer"]);
              usuarioBloc.add(ActivarUsuario(newUsuario));
            },
            color: Colors.blue,
            child: Text('Establecer usuario', style: TextStyle(color: Colors.white),),
            ),
            MaterialButton(onPressed: (){
              usuarioBloc.add(CambiarEdad(23));
            },
            color: Colors.blue,
            child: Text('Cambiar Edad', style: TextStyle(color: Colors.white),),
            ),
            MaterialButton(onPressed: (){
                usuarioBloc.add(AgregarProfesion('Nueva Profesion'));
            },
            color: Colors.blue,
            child: Text('Añadir Profesion', style: TextStyle(color: Colors.white),),
            ),
          ],
        )
     ),
   );
  }
}