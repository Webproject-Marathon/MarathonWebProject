import 'package:flutter/material.dart';

class ConfirmSponsorScreen extends StatefulWidget {
  const ConfirmSponsorScreen({super.key});

  @override
  State<ConfirmSponsorScreen> createState() => _ConfirmSponsorScreen();
}

class _ConfirmSponsorScreen extends State<ConfirmSponsorScreen> {
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
                      Navigator.pushNamed(context, '/runner_menu');
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
          children:  <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 60),
              child:
                Text('Спасибо за вашу спонсорскую поддержку!', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 87, 87, 87))),
              ),
            const Padding(padding: EdgeInsets.only(bottom: 10),
                          child:
                            Text('Спасибо за поддержку бегуна в Marathon Skills 2023!', style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 87, 87, 87))),
            ),
            const Text('Ваше пожертвование пойдет в его благотворительную организцию', style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 87, 87, 87))),
            const Padding(padding: EdgeInsets.only(bottom: 20, top: 30),
                          child:
                            Text('Иван Прудов(204) из Russia', style: TextStyle(fontSize: 40,color: Color.fromARGB(255, 87, 87, 87))),
            ),
            const Text('\$50', style: TextStyle(fontSize: 50,color: Color.fromARGB(255, 87, 87, 87))),
            Padding(
            padding: const EdgeInsets.only(top: 40),
            child:
                SizedBox(
                width: 120,
                height: 35,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 222, 222, 222)),
                    padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                  ),
                  onPressed: () {Navigator.pushNamed(context, '/runner_menu');},
                  child:  const Text('Назад', style: TextStyle(fontSize: 20,color: Colors.black))),
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