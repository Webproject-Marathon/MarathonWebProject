import 'package:flutter/material.dart';

class DetailedInfoScreen extends StatefulWidget {
  const DetailedInfoScreen({super.key});

  @override
  State<DetailedInfoScreen> createState() => _DetailedInfoScreen();
}

class _DetailedInfoScreen extends State<DetailedInfoScreen> {
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
            ],
          ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 100),
              child:
                Text('Подробная информация', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 87, 87, 87)),),
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
                            }, child: const Text('Marathon Skills 2023', style: TextStyle(fontSize: 25,color: Colors.black))),
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
                          onPressed: () {}, child: const Text('Насколько долгий марафон', style: TextStyle(fontSize: 25,color: Colors.black))),
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
                            }, child: const Text('Предыдущие результаты', style: TextStyle(fontSize: 25,color: Colors.black))),
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
                          onPressed: () {}, child: const Text('Список благотворительных организаций', style: TextStyle(fontSize: 25, color: Colors.black), textAlign: TextAlign.center)),
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
                            }, child: const Text('BMI калькулятор', style: TextStyle(fontSize: 25,color: Colors.black))),
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
                          onPressed: () {}, child: const Text('BMR калькулятор', style: TextStyle(fontSize: 25,color: Colors.black))),
                    ),
                ),
            ],
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