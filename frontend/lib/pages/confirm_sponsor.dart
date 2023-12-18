import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmSponsorScreen extends StatelessWidget {
  const ConfirmSponsorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageState(),
      child: const HomePage(),
    );
  }
}

class PageState extends ChangeNotifier {}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 87, 87, 87),
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
          alignment: Alignment.centerLeft,
          child:
              SizedBox(
              width: 80,
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
            Padding(
              padding: EdgeInsets.only(left:25),
              child: 
                Text('MARATHON SKILLS 2023', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30,color: Colors.white),)
            )
        ],
      ),
    ),
    body: SafeArea(
        child:Center(
          child:
            Container(
              width: MediaQuery.of(context).size.width,
              child: Content()
            ),
        )
    ),
    bottomNavigationBar: Container(
      padding: EdgeInsets.all(12),
      height: 50.0,
      color: Color.fromARGB(255, 87, 87, 87),
      child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('18 дней, 8 часов и 17 минут до старта марафона!', style: TextStyle(fontSize: 18,color: Colors.white),)
            ],
    ),
    ),
  );
}

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _Content();
}

class _Content extends State<Content> {
  @override
  Widget build(context) =>
    Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Color.fromARGB(255, 255, 255, 255),
            padding: constraints.maxHeight < 500 ? EdgeInsets.zero : EdgeInsets.all(30.0) ,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 30.0, horizontal: 25.0
                ),
                constraints: BoxConstraints(
                  maxWidth: 600,
                  maxHeight: 700,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Спасибо за вашу спонсорскую поддержку!', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 87, 87, 87)), textAlign: TextAlign.center,),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Спасибо за поддержку бегуна в Marathon Skills 2023!', style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 87, 87, 87)), textAlign: TextAlign.center),
                    Text('Ваше пожертвование пойдет в его благотворительную организцию', style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.center),
                    Text('Иван Прудов(204) из Russia', style: TextStyle(fontSize: 40,color: Color.fromARGB(255, 87, 87, 87)), textAlign: TextAlign.center),
                    SizedBox(
                      height: 10,
                    ),
                    Text('\$50', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50,color: Color.fromARGB(255, 87, 87, 87))),
                    SizedBox(
                      height: 10,
                    ),
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
                  ]
                ),
              ),
            )
          );
        }
      )
   );
}
