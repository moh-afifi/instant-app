import 'package:cv/task_local/task_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class TaskHome extends StatefulWidget {
  @override
  _TaskHomeState createState() => _TaskHomeState();
}

class _TaskHomeState extends State<TaskHome> {
  TextEditingController _textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    var taskProvider = Provider.of<TaskLogic>(context, listen: false);
    taskProvider.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('My Tasks'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showMaterialModalBottomSheet(
              context: context,
              expand: true,
              builder: (context) => SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  controller: ModalScrollController.of(context),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) {
                            if (_textController.text.isEmpty) {
                              return 'enter task';
                            }
                            return null;
                          },
                          controller: _textController,
                          decoration: InputDecoration(
                            labelText: 'task',
                            hintText: 'enter your task..',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.green, elevation: 10),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              TaskLogic _taskLogic = TaskLogic();
                              var date = DateTime.now();
                              var dateNew = DateFormat('dd/MM/yyyy , hh:mm a')
                                  .format(date);
                              await _taskLogic.insertData(
                                  dateNew, _textController.text);
                              _textController.clear();
                              var taskProvider = Provider.of<TaskLogic>(context,
                                  listen: false);
                              taskProvider.getData();
                              Navigator.pop(context);
                            }
                          },
                          child: Icon(
                            Icons.check_circle_outline,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Consumer<TaskLogic>(
          builder: (context, myProvider, child) {
            return ListView.builder(
              itemCount: myProvider.dataList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  onDismissed: (dir) {
                    myProvider.deleteData(myProvider.dataList[index]['id']);
                  },
                  key: Key(UniqueKey().toString()),
                  direction: DismissDirection.startToEnd,
                  background: Container(
                    color: Colors.red,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.delete,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  child: Card(
                    margin: EdgeInsets.all(10),
                    elevation: 10,
                    child: ExpansionTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text(myProvider.dataList[index]['date']),
                      children: [
                        Text(
                          myProvider.dataList[index]['note'],
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

