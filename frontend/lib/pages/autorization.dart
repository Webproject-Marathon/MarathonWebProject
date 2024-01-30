import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:marathon/components/bottom_navigation_bar_with_timer.dart';
import 'package:provider/provider.dart';
import 'package:marathon/classes/SessionData.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        await prefs.setString('auth_id', "$userId");

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
    double screenWidth = MediaQuery.of(context).size.width;
    double formWidth =
        screenWidth > 600 ? 480 : screenWidth * 0.8; // Адаптивная ширина формы

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 87, 87),
        title: const Text('MARATHON SKILLS 2023'),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 215, 215, 215),
              onPrimary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: () => Navigator.pushNamed(context, '/home'),
            child: const Text('Назад', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Форма авторизации',
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 87, 87, 87)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Пожалуйста, авторизируйтесь в системе, используя ваш адрес электронной почты и пароль.',
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 87, 87, 87)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              Container(
                width: formWidth,
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                width: formWidth,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 215, 215, 215)),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    onPressed: _login,
                    child: Text('Login', style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(width: 16.0),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 215, 215, 215)),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    onPressed: () {/* Отмена действия */},
                    child: Text('Cancel', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWithTimer(),
    );
  }
}
