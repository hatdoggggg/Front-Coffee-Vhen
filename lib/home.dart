import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int year = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
            'User Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/woman.png'),
                    backgroundColor: Colors.lightGreen,
                    radius: 50.0,
                  ),
                ),
                Divider(height: 55.0,
                color: Colors.brown,
                  thickness: 3.0,
                ),
                Row(
                  children: [
                    Icon(
                        Icons.person_2,
                      color: Colors.black,
                    ),
                    SizedBox(width: 3.0,),
                    Text(
                      'NAME',
                      style: TextStyle(
                        fontSize:25.0,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Vhenus M. Tumbaga',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 30.0,),
                Row(
                  children:[
                    Icon(
                      Icons.calendar_month_sharp,
                      color:Colors.black,
                    ),
                    SizedBox(width: 3.0,),
                    Text(
                      'YEAR',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                      ),
                    ),
                  ]
                ),
                Text(
                  '$year Year',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 30.0,),
                Row(
                  children: [
                    Icon(
                      Icons.email_sharp,
                      color: Colors.black,
                    ),
                    SizedBox(width: 3.0,),
                    Text(
                      'EMAIL',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0
                      ),
                    ),
                  ],
                ),
                Text(
                  'jvrclclothing@gmail.com',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25.0
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        year +=1;
                      });
                    },
                    child: Text(
                        'Add Year',
                        style: TextStyle(color:Colors.white),
                    ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.brown)
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
