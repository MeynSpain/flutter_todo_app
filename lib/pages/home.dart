import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List todoList = [];
  String userToDo = "";

  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    todoList.addAll(['1 case', '2 case', '3 case']);
  }

  ///Удаляет элемент из списка дел (todoList) через setState
  void deleteTodoList(List list, int index) {
    setState(() {
      list.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Список дел'),
        centerTitle: true,
      ),

      //Лист из списка карточек с делами
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todoList[index]),
              child: Card(
                child: ListTile(
                  title: Text(todoList[index]),
                  //Удаление путем нажатия на иконку
                  trailing: IconButton(
                    onPressed: () {
                      deleteTodoList(todoList, index);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content:Text('Запись удалена')));
                      print('List count:${todoList.length}');
                    },
                    icon: Icon(Icons.delete_sweep),
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
              //Удаление свайпом
              onDismissed: (direction) {
                //if (direction == DismissDirection.endToStart)  //смахивание справа на лево
                deleteTodoList(todoList, index);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content:Text('Запись удалена')));
                print('List count:${todoList.length}');
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Добавить элемент'),
                  content: TextField(
                    controller: textController,
                    onChanged: (String value) {
                      userToDo = value;
                    },
                  ),
                  actions: [
                    //Кнопка добавления записи
                    ElevatedButton(
                      child: Text('Добавить'),
                      onPressed: () {
                        setState(() {
                          if (textController.text.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content:Text('Поле пусто')));
                          } else {
                            todoList.add(userToDo);
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content:Text('Запись успешно добавлена')));
                          }
                        });

                        //Скрываем окно с добавлением
                        Navigator.of(context).pop();
                      },
                    ),
                    //Кнопка Отмены записи
                    ElevatedButton(
                        onPressed: () {
                          //Скрываем окно с добавлением
                          Navigator.of(context).pop();
                        },
                        child: Text('Отменить'))
                  ],
                );
              });
        },
        child: Icon(
          Icons.add_box,
          color: Colors.white,
        ),
      ),
    );
  }
}
