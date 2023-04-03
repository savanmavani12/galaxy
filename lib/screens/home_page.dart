import 'package:flutter/material.dart';
import 'package:plannets/global_page/global_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController animationController;
  double startscale = 0.5;
  double endscale = 1;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "planet",
          style: TextStyle(fontSize: 35),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.grey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: allplanets
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('planets', arguments: e);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width / 1,
                        color: Colors.black,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TweenAnimationBuilder(
                              tween: Tween<double>(
                                begin: startscale,
                                end: endscale,
                              ),
                              duration: const Duration(seconds: 3),
                              onEnd: () {
                                setState(() {
                                  startscale = (startscale == 0.5) ? 1 : 0.5;
                                  endscale = (endscale == 0.5) ? 1 : 0.5;
                                });
                              },
                              builder: (context, double val, widget) {
                                return Transform.scale(
                                  scale: val,
                                  child: Image.asset(
                                    "${e['image']}",
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                            Text(
                              "${e['text']}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
