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
    return Container();
  }
}