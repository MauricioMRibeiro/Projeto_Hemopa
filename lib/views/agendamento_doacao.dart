import 'package:flutter/material.dart';
import 'package:hemopa_app/routes/app_routes.dart';

class AgendamentoDoacao extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<AgendamentoDoacao> {
  String nomeUnidade = "";
  var _unidades = [
    'Batista Campos',
    'Castanheira',
    'Patio Belém',
    'Movel',
    'Agra Campos'
  ];
  var _unidadeSelecionada = 'Batista Campos';
  var _horarios = [
    '07:30',
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00'
  ];
  var _horarioSelecionado = '07:30';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Agendamento",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: criaDropDownButton(),
    );
  }

  criaDropDownButton() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 200,
            height: 200,
            child: Image.asset('imagem/logo.png'),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Unidade de Coleta:",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          DropdownButton<String>(
            //dropdownColor: Color.fromARGB(255, 255, 50, 0),
            items: _unidades.map((String dropDownStringItem) {
              return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Text(dropDownStringItem,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    )),
              );
            }).toList(),
            onChanged: (String novoItemSelecionado) {
              _dropDownItemSelected(novoItemSelecionado);
              setState(() {
                this._unidadeSelecionada = novoItemSelecionado;
              });
            },
            value: _unidadeSelecionada,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Horário:",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          DropdownButton<String>(
            items: _horarios.map((String dropDownStringHorario) {
              return DropdownMenuItem<String>(
                value: dropDownStringHorario,
                child: Text(dropDownStringHorario,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    )),
              );
            }).toList(),
            onChanged: (String novoHorarioSelecionado) {
              _dropDownHorarioSelected(novoHorarioSelecionado);
              setState(() {
                this._horarioSelecionado = novoHorarioSelecionado;
              });
            },
            value: _horarioSelecionado,
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            height: 60,
            width: 300,
            child: FlatButton(
              child: Text(
                "Agendar",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () => {
                Navigator.of(context).pushNamed(
                  AppRoutes.DADOS_USARIO,
                ),
              },
            ),
          ),
        ],
      ),
    );
  }

  void _dropDownItemSelected(String novoItem) {
    setState(() {
      this._unidadeSelecionada = novoItem;
    });
  }

  void _dropDownHorarioSelected(String novoHorario) {
    setState(() {
      this._horarioSelecionado = novoHorario;
    });
  }
}
