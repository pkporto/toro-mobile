// import 'package:flutter/material.dart';
// import 'package:introduction_screen/introduction_screen.dart';

// class OnboardingPagePage extends StatelessWidget {
//   const OnboardingPagePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Text('data');
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toro_mobile/src/route/page/route_page.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  List<OnboardingPageContent> contents = [
    OnboardingPageContent(
        title: "Olá!",
        image: "images/violao.svg",
        description:
            "O composição fácil tem a intenção de tornar mais rápido e prático o processo de compor a parte instrumental de uma música."),
    OnboardingPageContent(
        title: "Bem vinda(o)!",
        image: "images/violao.svg",
        description:
            "O composição fácil dsadsaddddddddddesso de compor a parte instrumental de uma música."),
  ];

  // Color c = const Color.fromARGB(255, 171, 238, 223);
  // OnboardingPageContent contents = OnboardingPageContent();
  PageController _controller = PageController();

  int currentIndex = 0;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return i == 1 || i == 2 ? onBoardingCheck(i) : Text('data');
                }),
          ),
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    contents.length, (index) => buildDot(index, context))),
          ),
          Container(
            // color: c,
            child: Container(
              height: 55,
              margin: EdgeInsets.fromLTRB(30, 10, 30, 20),
              width: double.infinity,
              child: FlatButton(
                child: Text("Abra sua conta grátis"),
                textColor: Colors.white,
                onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Aquela()),
                    );
                  }
                  _controller.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceIn);
                },
                color: Theme.of(context).primaryColor,
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          Container(
            // color: c,
            child: Container(
              height: 55,
              margin: EdgeInsets.fromLTRB(30, 0, 30, 20),
              width: double.infinity,
              child: FlatButton(
                child: Text("Entrar"),
                textColor: Colors.white,
                onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Aquela()),
                    );
                  }
                  _controller.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceIn);
                },
                color: Theme.of(context).primaryColor,
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget onBoardingCheck(int pageNumber) {
    return Container(
      // color: c,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            SvgPicture.asset(
              contents[pageNumber].image,
              height: 300,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              contents[pageNumber].title,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              contents[pageNumber].description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      width: currentIndex == index ? 20 : 10,
      height: 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).primaryColor),
    );
  }
}

class OnboardingPageContent {
  String image, title, description;

  OnboardingPageContent(
      {required this.image, required this.title, required this.description});
}
