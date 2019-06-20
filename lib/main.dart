import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    )
);

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  List _toDoList = [];

  //Obter dados
  Future<String> _readData() async{
    try{
      final file = await _getFile();
      return file.readAsString();
    }catch (e){
      return null;
    }
  }

  //Salvar os dados
  Future<File> _saveData() async{
    String data = json.encode(_toDoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  //Ler o arquivo de dados
  Future<File> _getFile() async{
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/dados_tarefa.json");
  }

  @override
  Widget build(BuildContext context){

    //Configurando a AppBar
    AppBar appBar = AppBar(
      title: Text("Lista de Tarefas"),
      backgroundColor: Colors.black26,
      centerTitle: true,
    );

    TextField textField = TextField(
      decoration: InputDecoration(
        labelText: "Nova Tarefa",
        labelStyle: TextStyle(color: Colors.black)
      ),
    );

    RaisedButton btnAdd = RaisedButton(
      onPressed: null,
      color: Colors.black,
      child: Text("ADD"),
      textColor: Colors.white,
    );

    //Configurando a linha do input e button
    Row row = Row(
      children: <Widget>[
        Expanded(
          child: textField,
        ),
        btnAdd,
      ],
    );

    //Configurando o container do topo
    Container containerTop = Container(
      padding: EdgeInsets.fromLTRB(18.0, 1.0, 6.0, 1.0),
      child: row,
    );

    //Configurando as colunas
    Column column = Column(
      children: <Widget>[
        containerTop
      ],
    );

    //Configurando os elementos na tela
    Scaffold scaffold = Scaffold(
      appBar: appBar,
      body: column,
    );

    return scaffold;
  }
}