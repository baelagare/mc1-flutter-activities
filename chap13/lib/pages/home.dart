import 'package:flutter/material.dart';
import 'package:local_inventory_logger/pages/edit_log.dart';
import 'package:local_inventory_logger/classes/database.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Database _database = Database(logs: []);

  Future<List<InventoryLog>> _loadLogs() async {
    final String logsJson = await DatabaseFileRoutines().readLogs();
    if (logsJson.isNotEmpty) {
      _database = databaseFromJson(logsJson);
      _database.logs.sort((comp1, comp2) => comp2.date.compareTo(comp1.date));
    }
    return _database.logs;
  }

  void _addOrEditLog({required bool add, required int index, required InventoryLog log}) async {
    LogEdit _logEdit = LogEdit(action: '', log: log);
    final LogEdit? result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditLog(
                add: add,
                index: index,
                logEdit: _logEdit,
              ),
          fullscreenDialog: true),
    );

    if (result != null) {
      switch (result.action) {
        case 'Save':
          setState(() {
            if (add) {
              _database.logs.add(result.log);
            } else {
              _database.logs[index] = result.log;
            }
          });
          DatabaseFileRoutines().writeLogs(databaseToJson(_database));
          break;
        case 'Cancel':
          break;
        default:
          break;
      }
    }
  }

  Widget _buildListViewSeparated(List<InventoryLog> logs) {
    return ListView.separated(
      itemCount: logs.length,
      itemBuilder: (BuildContext context, int index) {
        String _titleDate = DateFormat.yMMMd().format(DateTime.parse(logs[index].date));
        String _subtitle = logs[index].itemName + "\n" + logs[index].stockDetails;

        return Dismissible(
          key: Key(logs[index].id),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16.0),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          secondaryBackground: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 16.0),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          child: ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  DateFormat.d().format(DateTime.parse(logs[index].date)),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24.0, color: Colors.teal),
                ),
                Text(DateFormat.E().format(DateTime.parse(logs[index].date))),
              ],
            ),
            title: Text(_titleDate, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(_subtitle),
            onTap: () {
              _addOrEditLog(add: false, index: index, log: logs[index]);
            },
          ),
          onDismissed: (direction) {
            setState(() {
              logs.removeAt(index);
            });
            DatabaseFileRoutines().writeLogs(databaseToJson(_database));
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(color: Colors.grey);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Logs'),
      ),
      body: FutureBuilder<List<InventoryLog>>(
        initialData: const [],
        future: _loadLogs(),
        builder: (BuildContext context, AsyncSnapshot<List<InventoryLog>> snapshot) {
          // Check if data is null or empty before rendering
          if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
            // Show loading indicator only if connection is waiting, otherwise show empty container
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return const Center(child: Text("No inventory logs found."));
          }
          return _buildListViewSeparated(snapshot.data!);
        },
      ),
      bottomNavigationBar: const BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(padding: EdgeInsets.all(24.0)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Inventory Log',
        child: const Icon(Icons.add),
        onPressed: () {
          _addOrEditLog(
              add: true,
              index: -1,
              log: InventoryLog(id: '', date: '', itemName: '', stockDetails: ''));
        },
      ),
    );
  }
}