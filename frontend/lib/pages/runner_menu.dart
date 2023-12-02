import 'package:flutter/material.dart';

class RunnerMenuScreen extends StatefulWidget {
  const RunnerMenuScreen({super.key});

  @override
  State<RunnerMenuScreen> createState() => _RunnerMenuScreen();
}

class _RunnerMenuScreen extends State<RunnerMenuScreen> {
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
              child:
                  SizedBox(
                  width: 90,
                  height: 35,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 215, 215, 215)),
                      padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    }, child: const Text('Назад', style: TextStyle(fontSize: 20,color: Colors.black))),
                  ),
                ),
              const Text('MARATHON SKILLS 2023', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30,color: Colors.white),),
              Expanded(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                  Padding(
                  padding: EdgeInsets.only(right: 40),
                  child:
                      SizedBox(
                      width: 100,
                      height: 35,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 215, 215, 215)),
                          padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        }, child: const Text('Logout', style: TextStyle(fontSize: 20,color: Colors.black))),
                      ),
                  )
                  ]
                ) ,
              )
            ],
          ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 75),
              child:
                Text('Меню бегуна', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 87, 87, 87)),),
            ),
            Row( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 20, right: 20,),
                  child:
                    SizedBox(
                      width: 400,
                      height: 90,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 233, 233)),
                          padding: MaterialStateProperty.all(EdgeInsets.all(5))
                        ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/check');
                            }, child: const Text('Регистрация на марафон', style: TextStyle(fontSize: 25,color: Colors.black))),
                    ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child:
                    SizedBox(
                      width: 400,
                      height: 90,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 233, 233)),
                          padding: MaterialStateProperty.all(EdgeInsets.all(5))
                        ),
                          onPressed: () {}, child: const Text('Мои результаты', style: TextStyle(fontSize: 25,color: Colors.black))),
                    ),
                ),
            ],
            ),
           Row( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 20, right: 20,),
                  child:
                    SizedBox(
                      width: 400,
                      height: 90,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 233, 233)),
                          padding: MaterialStateProperty.all(EdgeInsets.all(5))
                        ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/check');
                            }, child: const Text('Редактирование профиля', style: TextStyle(fontSize: 25,color: Colors.black))),
                    ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child:
                    SizedBox(
                      width: 400,
                      height: 90,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 233, 233)),
                        ),
                          onPressed: () {}, child: const Text('Мой спонсор', style: TextStyle(fontSize: 25, color: Colors.black), textAlign: TextAlign.center)),
                    ),
                ),
            ],
            ),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 440,),
                child:
                  SizedBox(
                    width: 400,
                    height: 90,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 233, 233)),
                        padding: MaterialStateProperty.all(EdgeInsets.all(5))
                      ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/check');
                          }, child: const Text('Контакты', style: TextStyle(fontSize: 25,color: Colors.black))),
                  ),
              ),
            ],
            ),
        ),
      bottomNavigationBar: Container(
      padding: EdgeInsets.all(12),
      height: 50.0,
      color: Color.fromARGB(255, 87, 87, 87),
      child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text('18 дней, 8 часов и 17 минут до старта марафона!', style: TextStyle(fontSize: 18,color: Colors.white),)
            ],
    ),
    ),
    );
  }
}