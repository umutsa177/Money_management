import 'package:flutter/material.dart';
import 'package:money_management/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            fit: StackFit.loose,
            alignment: AlignmentDirectional.center,
            children: [
              rectangle,
              pana,
            ],
          ),
          splashWrite("Let's"),
          splashWrite("manage"),
          splashWrite("money with us"),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: buttonBox("Get started"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget rectangle = SizedBox(
  height: 525,
  width: 750,
  child: Image.asset(
    'lib/assets/Rectangle.png',
    width: 750,
    height: 525,
  ),
);

Widget pana = SizedBox(
  height: 278,
  width: 315,
  //color: Colors.black,
  child: Image.asset(
    'lib/assets/pana.png',
    width: 315,
    height: 278,
  ),
);

Widget splashWrite(String write) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        write,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 32,
        ),
      ),
    ],
  );
}

buttonBox(String value) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.deepOrangeAccent.shade400,
      borderRadius: BorderRadius.circular(16.0),
    ),
    padding: const EdgeInsets.all(16.0),
    child: Text(
      value,
      style: const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 24,
        color: Colors.white,
      ),
    ),
  );
}
