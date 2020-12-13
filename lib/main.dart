import 'package:flutter/material.dart';
import 'package:hemopa_app/provider/users.dart';
import 'package:hemopa_app/routes/app_routes.dart';
import 'package:hemopa_app/views/tela_login.dart';
import 'package:provider/provider.dart';
import 'package:hemopa_app/views/dados_usuario.dart';
import 'package:hemopa_app/views/agendamento_doacao.dart';
import 'package:hemopa_app/views/atualizar_cadastro.dart';
import 'package:hemopa_app/views/cadastro.dart';
import 'package:hemopa_app/views/users_list.dart';
import 'dart:io';
import 'dart:convert';
import 'package:postgres/postgres.dart';

//import 'data/conexao.dart';

void main()  {
  //conecta();
  runApp(Hemopa());
  // NOTE Do this as part of DB setup not in application code!
}

class Hemopa extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        )
      ],
      child: MaterialApp(
        title: 'Hemopa Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: TelaLogin(),
        routes: {
          AppRoutes.HOME: (ctx) => TelaLogin(),
          AppRoutes.USER_LIST: (ctx) => UserList(),
          // AppRoutes.USER_FORM: (ctx)=>UserForm(),
          AppRoutes.DADOS_USARIO: (ctx) => DadosUsuario(),
          AppRoutes.AGENDAMENTO_DOACAO: (ctx) => AgendamentoDoacao(),
          AppRoutes.CADASTRO: (ctx) => Cadastro(),
          AppRoutes.ATUALIZAR_CADASTRO: (ctx) => AtualizarCadastro(),
          // AppRoutes.DATAS_DISPONIVEIS: (ctx ) => DatasDisponiveis(),
        },
      ),
    );
  }
}
