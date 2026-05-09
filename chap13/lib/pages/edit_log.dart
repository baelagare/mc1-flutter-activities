import 'package:flutter/material.dart';
import 'package:local_inventory_logger/classes/database.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class EditLog extends StatefulWidget {
  final bool add;
  final int index;
  final LogEdit logEdit;

  const EditLog({Key? key, required this.add, required this.index, required this.logEdit})
      : super(key: key);

  @override
  _EditLogState createState() => _EditLogState();
}

class _EditLogState extends State<EditLog> {
  late LogEdit _logEdit;
  late String _title;
  late DateTime _selectedDate;
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _stockDetailsController = TextEditingController();
  final FocusNode _itemNameFocus = FocusNode();
  final FocusNode _stockDetailsFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _logEdit = LogEdit(action: 'Cancel', log: widget.logEdit.log);
    _title = widget.add ? 'Add' : 'Edit';

    if (widget.add) {
      _selectedDate = DateTime.now();
      _itemNameController.text = '';
      _stockDetailsController.text = '';
    } else {
      _selectedDate = DateTime.parse(_logEdit.log.date);
      _itemNameController.text = _logEdit.log.itemName;
      _stockDetailsController.text = _logEdit.log.stockDetails;
    }
  }

  @override
  void dispose() {
    _itemNameController.dispose();
    _stockDetailsController.dispose();
    _itemNameFocus.dispose();
    _stockDetailsFocus.dispose();
    super.dispose();
  }

  Future<void> _selectDate(DateTime selectedDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        _selectedDate = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            selectedDate.hour,
            selectedDate.minute,
            selectedDate.second,
            selectedDate.millisecond,
            selectedDate.microsecond);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_title Inventory Log'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.calendar_today,
                      size: 22.0,
                      color: Colors.black54,
                    ),
                    const SizedBox(width: 16.0),
                    Text(
                      DateFormat.yMMMEd().format(_selectedDate),
                      style: const TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black54,
                    ),
                  ],
                ),
                onPressed: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  await _selectDate(_selectedDate);
                },
              ),
              TextField(
                controller: _itemNameController,
                autofocus: true,
                textInputAction: TextInputAction.next,
                focusNode: _itemNameFocus,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Item Name / SKU',
                  icon: Icon(Icons.inventory),
                ),
                onSubmitted: (submitted) {
                  FocusScope.of(context).requestFocus(_stockDetailsFocus);
                },
              ),
              TextField(
                controller: _stockDetailsController,
                textInputAction: TextInputAction.newline,
                focusNode: _stockDetailsFocus,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: 'Stock Details / Notes',
                  icon: Icon(Icons.subject),
                ),
                maxLines: null,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.grey.shade100),
                    child: const Text('Cancel', style: TextStyle(color: Colors.black87)),
                    onPressed: () {
                      _logEdit.action = 'Cancel';
                      Navigator.pop(context, _logEdit);
                    },
                  ),
                  const SizedBox(width: 8.0),
                  TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.teal.shade100),
                    child: const Text('Save', style: TextStyle(color: Colors.teal)),
                    onPressed: () {
                      _logEdit.action = 'Save';
                      String id = widget.add
                          ? Random().nextInt(9999999).toString()
                          : _logEdit.log.id;
                      _logEdit.log = InventoryLog(
                        id: id,
                        date: _selectedDate.toString(),
                        itemName: _itemNameController.text,
                        stockDetails: _stockDetailsController.text,
                      );
                      Navigator.pop(context, _logEdit);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}