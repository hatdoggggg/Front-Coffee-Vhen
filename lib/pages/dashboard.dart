import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown,
        elevation: 3.0,
        onTap: (int val) {
          switch (val) {
            case 0:
              Navigator.pushNamed(context, '/menu');
              break;
            case 1:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood, color: Colors.white),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            label: 'Profile',
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Center(
          child: Image.asset(
            'assets/name.png',
            height: 60.0,
            width: 500.0,
          ),
        ),
      ),
      backgroundColor: Colors.yellow[100],
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterCarousel(
                options: CarouselOptions(
                  height: 400.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 700),
                  showIndicator: true,
                  slideIndicator: CircularSlideIndicator(),
                ),
                items: [
                  'assets/Espresso.png',
                  'assets/Latte.png',
                  'assets/Cold brew.png',
                  'assets/Iced Coffee.png',
                  'assets/Cappuccino.png',
                  'assets/Mocha.png',
                  'assets/Nitro cold brew.png',
                  'assets/Americano.png',
                  'assets/Frappuccino.png',
                  'assets/Affogato.png',
                ].map((String imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
