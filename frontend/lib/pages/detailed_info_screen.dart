import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailedInfoScreen extends StatelessWidget {
  const DetailedInfoScreen({super.key});

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
                Text('MARATHON SKILLS 2023', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25,color: Colors.white),)
            )
        ],
      ),
    ),
    body: SafeArea(
        child:Center(
          child: MediaQuery.of(context).size.width <= 800 ?
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 700,
              child: Content1()
            )
          )
          :
          Container(
            width: MediaQuery.of(context).size.width,
            child: Content2()
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

class Content1 extends StatefulWidget {
  const Content1({super.key});

  @override
  State<Content1> createState() => _Content1();
}

class _Content1 extends State<Content1> {
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
                  maxWidth: 600,
                  maxHeight: 700,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Подробная информация', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 87, 87, 87))),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 350,
                      height: 80,
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
                            Navigator.pushNamed(context, '/marathon_info');
                          }, child: const Text('Marathon Skills 2023', style: TextStyle(fontSize: 25,color: Colors.black))),
                    ),
                    SizedBox(
                      width: 350,
                      height: 80,
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
                          onPressed: () {Navigator.pushNamed(context, '/how_long');},
                          child: const Text('Насколько долгий марафон', style: TextStyle(fontSize: 25,color: Colors.black))),
                    ),
                    SizedBox(
                      width: 350,
                      height: 80,
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
                          onPressed: () {Navigator.pushNamed(context, '/past_races');},
                          child: const Text('Предыдущие результаты', style: TextStyle(fontSize: 25,color: Colors.black))),
                    ),
                    SizedBox(
                      width: 350,
                      height: 80,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 233, 233)),
                        ),
                          onPressed: () {}, 
                          child: const Text('Благотворительные организации', style: TextStyle(fontSize: 25, color: Colors.black), textAlign: TextAlign.center)),
                    ),
                    SizedBox(
                    width: 350,
                    height: 80,
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
                        onPressed: () { Navigator.pushNamed(context, '/bmi'); },
                          child: const Text('BMI калькулятор', style: TextStyle(fontSize: 25,color: Colors.black))),
                    ),
                    SizedBox(
                    width: 350,
                    height: 80,
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
                        onPressed: () { Navigator.pushNamed(context, '/bmr'); },
                          child: const Text('BMR калькулятор', style: TextStyle(fontSize: 25,color: Colors.black))),
                    ),
                  ]
                )
              ),
            )
          );
        }
      )
   );
}

class Content2 extends StatefulWidget {
  const Content2({super.key});

  @override
  State<Content2> createState() => _Content2();
}

class _Content2 extends State<Content2> {
  @override
  Widget build(context) =>
    Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Color.fromARGB(255, 255, 255, 255),
            padding: constraints.maxHeight < 500 ? EdgeInsets.zero : EdgeInsets.zero ,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 30.0, horizontal: 25.0
                ),
                constraints: BoxConstraints(
                  maxWidth: 800,
                  maxHeight: 600,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Подробная информация', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 87, 87, 87))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 350,
                              height: 80,
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
                                    Navigator.pushNamed(context, '/marathon_info');
                                  }, child: const Text('Marathon Skills 2023', style: TextStyle(fontSize: 25,color: Colors.black))),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              width: 350,
                              height: 80,
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
                                  onPressed: () {Navigator.pushNamed(context, '/how_long');},
                                  child: const Text('Насколько долгий марафон', style: TextStyle(fontSize: 25,color: Colors.black))),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              width: 350,
                              height: 80,
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
                                  onPressed: () {Navigator.pushNamed(context, '/past_races');},
                                  child: const Text('Предыдущие результаты', style: TextStyle(fontSize: 25,color: Colors.black))),
                            ),
                          ]
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 350,
                              height: 80,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 233, 233, 233)),
                                ),
                                  onPressed: () {Navigator.pushNamed(context, '/blago'); }, 
                                  child: const Text('Благотворительные организации', style: TextStyle(fontSize: 25, color: Colors.black), textAlign: TextAlign.center)),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                            width: 350,
                            height: 80,
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
                                onPressed: () { Navigator.pushNamed(context, '/bmi'); },
                                  child: const Text('BMI калькулятор', style: TextStyle(fontSize: 25,color: Colors.black))),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                            width: 350,
                            height: 80,
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
                                onPressed: () { Navigator.pushNamed(context, '/bmr'); },
                                  child: const Text('BMR калькулятор', style: TextStyle(fontSize: 25,color: Colors.black))),
                            ),
                          ]
                        ),
                      ] 
                    )
                  ]
                )
              ),
            )
          );
        }
      )
   );
}
