 
import 'package:flutter/material.dart';
import 'package:fuego_cafe/confirm_order.dart';
import 'package:fuego_cafe/main_menu.dart';
import 'package:fuego_cafe/login_screen.dart';
import 'package:fuego_cafe/design_utils/constants.dart';
import 'dart:ui';

 
class Table {
  Table({required this.name, required this.checked});
  final String name;
  bool checked;
}

class TableItem extends StatelessWidget {
  TableItem({
    required this.table,
    required this.onTableChanged,
  }) : super(key: ObjectKey(table));

  final Table table;
  final onTableChanged;

  TextStyle? _getTextStyle(bool checked){
    if (!checked) return null;
    return const TextStyle(
      color: Color.fromARGB(137, 209, 41, 41),
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTableChanged(table);
        Navigator.push(
          context,MaterialPageRoute(
          builder: (context) => Total()),
        );         
      },
      leading: CircleAvatar(
        child: Text(table.name[0]),
      ),
      title: Text(table.name, 
        style: const TextStyle (
          fontWeight: FontWeight.bold,fontSize: 19
        )
      ),
      subtitle: const Text("Orders: ", 
        style: TextStyle(fontSize: 16)
      ),
      trailing: Wrap(
        children: [
          FlatButton(
            child: Icon(Icons.add, size: 30.0),
            onPressed: () 
            { //Put Fatini's page
              Navigator.push( context,MaterialPageRoute(builder: (context) => Menu()));              
            },   
          ),
        ],
      ),
    );
  }
}

class TableList extends StatefulWidget {

  @override
  _TableListState createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  
  final TextEditingController _textFieldController = TextEditingController();
  final List<Table> _tables = <Table>[];

  @override
  Widget build(BuildContext context) {

    const double padding = 25;
    final ThemeData themeData = Theme.of(context);
  
    return Scaffold(
      resizeToAvoidBottomInset: false, //To prevent overflow, can scroll

      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.black,
              size: 35,          
            ),
            onPressed: () {
              Navigator.push(
                context,MaterialPageRoute(builder: (context) => 
                const LoginPage(title:'Login Page')),
              );                     
            },
          )
        ], 
        title: Text('Table', style: themeData.textTheme.headline1,
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFEEEEEE),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: _tables.map((Table table) {
          return TableItem(
            table: table,
            onTableChanged: _handleTableChange,
          );
        }).toList(),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(),
          tooltip: 'Add Item',
          child: Icon(Icons.add)
      ),
    );
  }

  void _handleTableChange(Table table) {
    setState(() {
      table.checked = !table.checked;
    });
  }

  void _addTableItem(String name) {
    setState(() {
      _tables.add(Table(name: name, checked: false));
    });
    _textFieldController.clear();
  }

  Future<void> _displayDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter table no/name'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Type your new table name'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.pop(context)
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                _addTableItem(_textFieldController.text);
              },
            ),
          ],
        );
      },
    );
  }
}

class TableApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    double screenWidth = window.physicalSize.width; //Come from dart:ui class

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Table',
      theme: ThemeData(
        primaryColor: white, accentColor: yellow, textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,fontFamily: "Montserrat"
      ),
      home: TableList(),
    );
  }
}

void main() => runApp(TableApp());
