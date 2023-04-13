import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Список дел'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text('Main Screen', style: TextStyle(color: Colors.white),),
          ElevatedButton(onPressed: () {
            // Navigator.pushNamed(context, '/todo');  //Перенаправит на заданную страницу и будет возможность перейти назад. Причем происходит наложение страниц
            // Navigator.pushNamedAndRemoveUntil(context, '/todo', (route) => false);  //Делает все тоже самое но route устанавливает будет стрелка назад или нет
            Navigator.pushReplacementNamed(context, '/todo'); // Закрывает предыдущую страницу и открывает новую без наложения, поэтому возможности перейти назад нет вовсе
          },
              child: Text('Next'))
        ],
      ),
    );
  }
}
