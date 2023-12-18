import 'package:flutter/material.dart';

class LoadVolunteer extends StatefulWidget {
  const LoadVolunteer({super.key});

  @override
  State<LoadVolunteer> createState() => _LoadVolunteer();
}

class _LoadVolunteer extends State<LoadVolunteer> {

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
                      Navigator.pushNamed(context, '/manage_volonteer');
                    }, child: const Text('Назад', style: TextStyle(fontSize: 20,color: Colors.black))),
                  ),
                ),
              const Text('MARATHON SKILLS 2023', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30,color: Colors.white)),
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
                        onPressed: () {Navigator.pushNamed(context, '/home');},
                        child: const Text('Logout', style: TextStyle(fontSize: 20,color: Colors.black))
                      ),
                      ),
                  )
                  ]
                )
              )
            ],
          ),
      ),
      body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 50, top: 10),
              child:Text('Загрузка волонтеров', style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 92, 92, 92)),),
            ),
            Row( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text('CSV файл волонтеров:', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.left),
              ),
              Padding(
                  padding: EdgeInsets.only(right: 20),
                  child:SizedBox(
                    width: 200,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty || double.tryParse(value) == null) {return '!';}
                        return null;
                      }
                    )
                  )
              ),
              SizedBox(
                width: 200,
                height: 40,
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
                  onPressed: () {},
                  child: const Text('Просмотр...', style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.center,)),
              ) 
              ]
            ),
            Row( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20, top: 50),
                child: SizedBox(
                  width: 150,
                  height: 40,
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
                    onPressed: () {},
                    child: const Text('Загрузка', style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.center,)),
                ) 
              ),
              Padding(
                padding: EdgeInsets.only(right: 20, top: 50),
                child: SizedBox(
                  width: 150,
                  height: 40,
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
                    onPressed: () {},
                    child: const Text('Отмена', style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.center,)),
                ) 
              )
            ]
            ),
            const Padding(
              padding: EdgeInsets.only(top: 70, bottom: 30),
              child: Text('CSV файл должен иметь следующие поля:', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.left),
            ),
            Text('поле1: описание поля', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.left),
            Text('поле2: описание поля', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.left),
            Text('поле3: описание поля', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.left),
            Text('поле4: описание поля', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.left),
            Text('поле5: описание поля', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.left),
            Text('поле6: описание поля', style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 87, 87, 87)),textAlign: TextAlign.left),
          ]
        
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