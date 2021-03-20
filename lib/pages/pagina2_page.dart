import 'package:estados/models/usuario_model.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
       appBar: AppBar(
        title: usuarioService.isExUsuario ? Text('Nombre: ${usuarioService.usuario.nombre}') : Text('Pagina2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(onPressed: (){
              final usuario = new Usuario(nombre: "julio", edad: 22, profesiones: ['Developer', 'Gamer']);
              usuarioService.usuario=(usuario);
            },
            color: Colors.blue,
            child: Text('Establecer usuario', style: TextStyle(color: Colors.white),),
            ),
            MaterialButton(onPressed: () => usuarioService.cambiarEdad(23),
            color: Colors.blue,
            child: Text('Cambiar Edad', style: TextStyle(color: Colors.white),),
            ),
            MaterialButton(onPressed: () =>usuarioService.agregarProfesion(),
            color: Colors.blue,
            child: Text('Añadir Profesion', style: TextStyle(color: Colors.white),),
            ),
          ],
        )
     ),
   );
  }
}