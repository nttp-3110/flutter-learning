import 'package:flutter/material.dart';
import './AddTaskScreen.dart';
class TodoPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddTaskScreen.id);
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        // Mình demo với 9 item nha
        // Phần sau mình sẽ lấy data từ database sau
        itemCount: 9,
        itemBuilder: (context, index) {
          // Mỗi item là một ListTile
          return ListTile(
            title: Text('Task $index'),
            trailing: PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 0,
                    child: Text('Edit'),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Text('Delete'),
                  ),
                ];
            },
              onSelected: (i) {
                if (i == 0) {
                  // Code chuyển sang màn hình edit
                } else if (i == 1) {
                  // Hiện dialog
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Confirm your deletion'),
                        content: Text(
                            'This task will be deleted permanently. Do you want to do it?'),
                        actions: <Widget>[
                          // Nút hủy, nhấn vào chỉ pop cái dialog đi thôi không làm gì thêm
                          FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('CANCEL'),
                          ),
                          FlatButton(
                            onPressed: () {
                              // Xóa task...
                              Navigator.pop(context);
                            },
                            child: Text(
                              'DELETE',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              },

            ),
          );
        },
      ),
    );
  }
}