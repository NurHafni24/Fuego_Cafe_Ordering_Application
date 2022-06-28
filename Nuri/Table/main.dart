 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
 
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

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTableChanged(table);
      },
      leading: CircleAvatar(
        child: Text(table.name[0]),
      ),
      title: Text(table.name, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
      subtitle: Text("Orders: ", style: TextStyle(fontSize: 16),),
      trailing: Wrap(
        children: [
          FlatButton(
            child: Icon(Icons.add, size: 30.0),
            onPressed: () {},
            
          ),
        ],
      ),
    );
  }
}

class TableList extends StatefulWidget {

  @override
  _TableListState createState() => new _TableListState();
}

class _TableListState extends State<TableList> {
 
  
  final TextEditingController _textFieldController = TextEditingController();
  final List<Table> _tables = <Table>[];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Table', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30, color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
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
          child: Icon(Icons.add)),
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
              child: Text('Cancel'),
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
    return new MaterialApp(
      title: 'Table',
      home: new TableList(),
    );
  }
}

void main() => runApp(new TableApp());
