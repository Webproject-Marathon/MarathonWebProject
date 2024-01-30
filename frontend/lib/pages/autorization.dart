import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:marathon/components/bottom_navigation_bar_with_timer.dart';
import 'package:provider/provider.dart';
import 'package:marathon/classes/SessionData.dart';

class Authorization extends StatelessWidget {
  const Authorization({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageState(),
      child: const LoginPage(),
    );
  }
}

class PageState extends ChangeNotifier {}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://localhost:8000/api-token-auth/'));
    request.fields.addAll({
      'email': _emailController.text,
      'password': _passwordController.text,
    });

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        var jsonResponse = json.decode(responseBody);

        String token = jsonResponse['token'];
        int userId = jsonResponse[
            'user_id']; // Приводим к int, исходя из предоставленных данных
        String email = jsonResponse['email'];

        print(
            'Токен: $token, Идентификатор пользователя: $userId, Email: $email');

        // Теперь делаем запрос для получения полной информации о пользователе
        var userRequest = http.Request(
            'GET', Uri.parse('http://127.0.0.1:8000/users/$userId'));

        var userResponse = await http.Client().send(userRequest);
        if (userResponse.statusCode == 200) {
          var userData = await userResponse.stream.bytesToString();
          var jsonResponse = json.decode(userData);
          String role = jsonResponse['role'];

          SessionData.setUserRole(role);
          SessionData.setUserToken(token);

          if (role == 'A') {
            Navigator.pushNamed(context, '/admin_menu');
          } else if (role == 'R') {
            Navigator.pushNamed(context, '/runner_menu');
          } else if (role == 'C') {
            Navigator.pushNamed(context, '/coordinator_menu');
          }
        } else {
          print(
              'Не удалось получить полную информацию о пользователе: ${userResponse.reasonPhrase}');
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('Ошибка: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 87, 87),
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 40),
              child: SizedBox(
                width: 90,
                height: 35,
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 215, 215, 215)),
                      padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: const Text('Назад',
                        style: TextStyle(fontSize: 20, color: Colors.black))),
              ),
            ),
            const Text(
              'MARATHON SKILLS 2023',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Форма авторизации',
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 87, 87, 87)),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Пожалуйста, авторизируйтесь в системе, используя ваш адрес электронной почты и пароль.',
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 87, 87, 87)),
                textAlign: TextAlign.center,
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 87, 87, 87)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 60),
                Container(
                  width: 350,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 87, 87, 87)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 350,
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min, // Выравнивание кнопок
                children: <Widget>[
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 215, 215, 215)),
                        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                        textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 20))),
                    onPressed: () {
                      _login();
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 215, 215, 215)),
                        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                        textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 20))),
                    onPressed: () {},
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWithTimer(),
    );
  }
}
