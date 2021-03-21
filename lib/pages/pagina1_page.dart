import 'package:estados/bloc/usuario/usuario_cubic.dart';
import 'package:estados/models/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina1'),
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => context.read<UsuarioCubic>().borrarUsuario())
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubic, UsuarioState>(builder: (_, state) {
      switch (state.runtimeType) {
        case UsuarioInitial:
          return Center(
            child: Text('No hay informacion del Usuario'),
          );
          break;
        case UsuarioActivo:
          return InformacionUsuario(usuario: (state as UsuarioActivo).usuario);
          break;
        default:
          return Center(
            child: Text('Esado no reconocido'),
          );
      }

      //  if(state is UsuarioInitial){
      //    return Center(child: Text('No hay informacion del Usuario'),);
      //  }else if (state is UsuarioActivo){
      //     return InformacionUsuario(usuario:state.usuario);
      //  }else{
      //    return Center(child: Text('Esado no reconocido'),);
      //  }
    });
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario({this.usuario});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(
            title: Text('Nombre : ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad ${usuario.edad}'),
          ),
          Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ...usuario.profesiones
              .map((profesion) => ListTile(
                    title: Text(profesion),
                  ))
              .toList()
        ],
      ),
    );
  }
}
