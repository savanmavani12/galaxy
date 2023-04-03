import 'dart:math';
import 'package:flutter/material.dart';

class Plannets extends StatefulWidget {
  const Plannets({Key? key}) : super(key: key);

  @override
  State<Plannets> createState() => _PlannetsState();
}

class _PlannetsState extends State<Plannets> {
  @override
  Widget build(BuildContext context) {
    Map e = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("${e['text']}",
          style: const TextStyle(fontSize: 30),
        ),
      ),
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: 20 * pi),
                duration: const Duration(seconds: 30),
                curve: Curves.easeInOutBack,
                builder: (_, double v, __) {
                  return Transform.rotate(
                    angle: v,
                    child: SizedBox(
                      width: 400,
                      child: Image.asset(
                        "${e['image']}",
                        fit: BoxFit.contain,
                        // width: 400,
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 4,
              child:Text ("${e['detail']}",style:TextStyle(
                  color: Colors.white,
                  fontSize:18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5),
                textAlign: TextAlign.center,),
              // Padding(
              //   padding: const EdgeInsets.all(6),
              //   child: TextLiquidFill(

              //
              //     boxBackgroundColor: Colors.black,

              //     boxHeight: 292,
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
