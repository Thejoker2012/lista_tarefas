import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _toDoList = [];

  @override
  Widget build(BuildContext context) {
    return Container();
  }
  Future<File> _pegarArquivo() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/data.json");
  }

  Future<File> _salvarArquivo() async{
    String data = json.encode(_toDoList);
    final file = await _pegarArquivo();
    return file.writeAsString(data);

  }
  Future<String> _lerArquivo() async{
    try{
      final file = await _pegarArquivo();
      return file.readAsString();
    }catch(e){
      return null;
    }
  }
}

