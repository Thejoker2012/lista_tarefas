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

  List _toDoList = ["Daniel","Marcos"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Nova Tarefa",
                        labelStyle: TextStyle(color: Colors.indigo)
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.indigo,
                  child: Text("ADD"),
                  textColor: Colors.white,
                  onPressed: (){},
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0),
              itemCount: _toDoList.length,
              itemBuilder: (context, index){
                return CheckboxListTile(
                  title: Text(_toDoList[index]["title"]),
                  value: _toDoList[index]["ok"],
                  secondary: CircleAvatar(
                    child:Icon(_toDoList[index]["ok"] ?
                    Icons.check : Icons.error
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ) ,

    );
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

