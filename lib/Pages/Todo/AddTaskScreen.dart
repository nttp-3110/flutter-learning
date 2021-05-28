import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  // Mình đặt id dùng trong routes
  static const id = 'add_task_screen';

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _taskController = TextEditingController();
  bool _inSync = false;
  late String _taskError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add task'),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          // Nút back trên appbar sẽ không nhấn được khi đang lưu dữ liệu
          onPressed: !_inSync
              ? () {
            Navigator.pop(context);
          }
              : null,
        ),
        actions: <Widget>[
          // Tương tự, như nút back tránh trường hợp user nhấn 2 lần
          !_inSync
              ? IconButton(
            icon: Icon(Icons.done),
            onPressed: () {

            },
          )
              : Icon(Icons.refresh),
        ],
        elevation: 0.0,
        textTheme: TextTheme(
          title: Theme.of(context).textTheme.title,
        ),
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
      ),
      body: WillPopScope(
        // Ngăn nút người dùng nhấn back trên android khi đang lưu dữ liệu
        onWillPop: () async {
          if (!_inSync) return true;
          return false;
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: _taskController,
            decoration: InputDecoration(
              labelText: 'Task',
              errorText: _taskError,
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}