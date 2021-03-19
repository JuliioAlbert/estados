import 'package:estados/models/usuario_model.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream ,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot){
            return snapshot.hasData 
            ? Text('Nombre ${snapshot.data.nombre}')
            :Text('Pagina 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(onPressed: (){
              final nuevoUsuario = new Usuario(
                nombre: 'julio',
                edad: 22,
                profesiones: [
                  'Desarrollador',
                  'Admin Redes'
                ]
              );
              usuarioService.cargarUsuario(nuevoUsuario);
            },
            color: Colors.blue,
            child: Text('Establecer usuario', style: TextStyle(color: Colors.white),),
            ),
            MaterialButton(onPressed: (){
              usuarioService.cambiarEdad(24);
            },
            color: Colors.blue,
            child: Text('Cambiar Edad', style: TextStyle(color: Colors.white),),
            ),
            MaterialButton(onPressed: (){},
            color: Colors.blue,
            child: Text('Añadir Profesion', style: TextStyle(color: Colors.white),),
            ),
          ],
        )
     ),
   );
  }
}