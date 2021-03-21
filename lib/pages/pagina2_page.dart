
import 'package:estados/bloc/usuario/usuario_cubic.dart';
import 'package:estados/models/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final usuarioCubic = context.read<UsuarioCubic>();
    return Scaffold(
       appBar: AppBar(
        title: Text('Pagina2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(onPressed: (){
              final newUser = Usuario(nombre: "Julio", edad: 35, profesiones: ["Developer"]);
              usuarioCubic.seleccionarUsuario(newUser);
            },
            color: Colors.blue,
            child: Text('Establecer usuario', style: TextStyle(color: Colors.white),),
            ),
            MaterialButton(onPressed: () =>usuarioCubic.cambiarEdad(22),
            color: Colors.blue,
            child: Text('Cambiar Edad', style: TextStyle(color: Colors.white),),
            ),
            MaterialButton(onPressed: () => usuarioCubic.agregarProfesion(),
            color: Colors.blue,
            child: Text('Añadir Profesion', style: TextStyle(color: Colors.white),),
            ),
          ],
        )
     ),
   );
  }
}