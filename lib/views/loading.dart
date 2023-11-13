import 'package:flutter/material.dart';

void main() {
  runApp(const LoadingView());
}

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255,255,251,226),
      ),
      home: Scaffold(
        body: ListView(children: [
          Background(),
        ]),
      ),
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 390,
          height: 844,
          padding: const EdgeInsets.only(
            top: 211,
            left: 70,
            right: 70,
            bottom: 70,
          ),
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFFFFFBE2)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage('assets/images/logo1.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 288),
              Container(
                width: 180,
                height: 25,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 25.23,
                      height: 25,
                      decoration: ShapeDecoration(
                        color: Color(0xFF40B65D),
                        shape: OvalBorder(),
                      ),
                    ),
                    Container(
                      width: 25.23,
                      height: 25,
                      decoration: ShapeDecoration(
                        color: Color(0xFF095D40),
                        shape: OvalBorder(),
                      ),
                    ),
                    Container(
                      width: 25.23,
                      height: 25,
                      decoration: ShapeDecoration(
                        color: Color(0xFF095D40),
                        shape: OvalBorder(),
                      ),
                    ),
                    Container(
                      width: 25.23,
                      height: 25,
                      decoration: ShapeDecoration(
                        color: Color(0xFF095D40),
                        shape: OvalBorder(),
                      ),
                    ),
                    Container(
                      width: 25.23,
                      height: 25,
                      decoration: ShapeDecoration(
                        color: Color(0xFF095D40),
                        shape: OvalBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}