import 'package:flutter/material.dart';

class MainSystemScreen extends StatefulWidget {
  const MainSystemScreen({super.key});

  @override
  State<MainSystemScreen> createState() => _MainSystemScreen();
}

class _MainSystemScreen extends State<MainSystemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 87, 87),
        toolbarHeight: 150,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text('MARATHON SKILLS 2023', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40,color: Colors.white),),
              Text('Москва, Россия', style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 186, 186, 186)),),
              Text('среда, 21 октября 2023', style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 188, 188, 188)),)
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child:
                SizedBox(
                  width: 450,
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
                        }, child: const Text('Я хочу стать бегуном', style: TextStyle(fontSize: 25,color: Colors.black))),
                ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child:
                SizedBox(
                  width: 450,
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
                      onPressed: () {}, child: const Text('Я хочу стать спонсором бегуна', style: TextStyle(fontSize: 25,color: Colors.black))),
                ),
            ),
            SizedBox(
              width: 450,
              height: 90,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 233, 233)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/info');
                }, child: const Text('Я хочу узнать больше о событии', style: TextStyle(fontSize: 25,color: Colors.black))),
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
            children: <Widget>[
              Text('18 дней, 8 часов и 17 минут до старта марафона!', style: TextStyle(fontSize: 18,color: Colors.white),),
              Padding(
              padding: EdgeInsets.only(left: 50),
              child:
                SizedBox(
                  width: 150,
                  height: 200,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 215, 215, 215)),
                      padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                      textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))
                    ),
                      onPressed: () {}, child: const Text('Login', style: TextStyle(fontSize: 20,color: Colors.black))),
                ),
            ),
            ],
    ),
    ),
    );
  }
}