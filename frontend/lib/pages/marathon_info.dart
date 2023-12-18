import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarathonInfoScreen extends StatelessWidget {
  const MarathonInfoScreen({super.key});

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
                  Navigator.pushNamed(context, '/info');
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
          child: MediaQuery.of(context).size.width <= 1000 ?
          ListView(
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 130,
                    child: PageText()
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 520,
                    child: Pics()
                  ),        
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 430,
                    child: MoreText()
                  )
                ]
              )
            ]
          )
          : 
          ListView(
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: PageText()
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        height: 530,
                        child: Pics()
                      ),        
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        height: 530,
                        child: MoreText()
                      ),            
                    ],
                  )
                ]
              )
            ]
          )
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

class Pics extends StatefulWidget {
  const Pics({super.key});

  @override
  State<Pics> createState() => _Pics();
}

class _Pics extends State<Pics> {
  @override
  Widget build(context) =>
    Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Color.fromARGB(255, 255, 255, 255),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 450,
                  maxHeight: 550,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: 
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color.fromARGB(255, 87, 87, 87), width: 1.5)),
                        width: 362,
                        height: 200,
                      child:ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 233, 233)),
                          padding: MaterialStateProperty.all(EdgeInsets.all(10))
                        ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/check');
                            }, child: 
                              Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: 
                                  const [Text('Карта марафона\n', style: TextStyle(fontSize: 33,color: Color.fromARGB(255, 87, 87, 87))),
                                  Text('(Нажмите, чтобы открыть интерактивную карту)', style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.center)]
                              )
                      ),
                    ),
                    Row( 
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 233, 233, 233),
                            border: Border.all(color: Color.fromARGB(255, 87, 87, 87), width: 1.5)),
                            width: 160,
                            height: 110,
                            child:Align(
                              alignment: Alignment.center,
                              child: Text('Photo', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 87, 87, 87))),
                            )
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 233, 233, 233),
                            border: Border.all(color: Color.fromARGB(255, 87, 87, 87), width: 1.5)),
                            width: 160,
                            height: 110,
                            child:Align(
                              alignment: Alignment.center,
                              child: Text('Photo', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 87, 87, 87))),
                            )
                        ),
                      ]
                    ),
                    Row( 
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 233, 233, 233),
                            border: Border.all(color: Color.fromARGB(255, 87, 87, 87), width: 1.5)),
                            width: 160,
                            height: 110,
                            child:Align(
                              alignment: Alignment.center,
                              child: Text('Photo', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 87, 87, 87))),
                            )
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 233, 233, 233),
                            border: Border.all(color: Color.fromARGB(255, 87, 87, 87), width: 1.5)),
                            width: 160,
                            height: 110,
                            child:Align(
                              alignment: Alignment.center,
                              child: Text('Photo', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 87, 87, 87))),
                            )
                        ),
                      ]
                    )
                  ]
                ),
              ),
            )
          );
        }
      )
   );
}

class MoreText extends StatefulWidget {
  const MoreText({super.key});

  @override
  State<MoreText> createState() => _MoreText();
}

class _MoreText extends State<MoreText> {
  @override
  Widget build(context) =>
    Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Color.fromARGB(255, 255, 255, 255),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 30.0, horizontal: 25.0
                ),
                constraints: BoxConstraints(
                  maxWidth: 500,
                  maxHeight: 430,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: 480, height: 150, child: Text('Информация о Навыках Марафона 2023 пойдет сюда. Информация может покрыть расположение, время, расстояние, рекордные времена и т.д.', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.left)
                    ),
                    SizedBox(width: 490, height: 110, child: Text('Дополнительные сведения. Дополнительные сведения. Дополнительные сведения.', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.left)
                    ),
                    SizedBox(width: 490, height: 110, child: Text('Дополнительные сведения. Дополнительные сведения. Дополнительные сведения.', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.left)
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

class PageText extends StatefulWidget {
  const PageText({super.key});

  @override
  State<PageText> createState() => _PageText();
}

class _PageText extends State<PageText> {
  @override
  Widget build(context) =>
    Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Color.fromARGB(255, 255, 255, 255),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: constraints.maxHeight < 500 ? EdgeInsets.all(30) : EdgeInsets.zero ,
                constraints: BoxConstraints(
                  maxWidth: 800,
                  maxHeight: 150,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: 
                  Text('Информация о Marathon Skills 2023', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 92, 92, 92)),textAlign: TextAlign.center,),
              ),
            )
          );
        }
      )
   );
}



