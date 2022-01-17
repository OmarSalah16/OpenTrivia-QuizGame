import 'package:flutter/material.dart';
import 'package:open_trivia/ui/pages/home.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroSliderPage extends StatefulWidget
{
  @override
  _IntroSliderPageState createState() => _IntroSliderPageState();
}

class _IntroSliderPageState extends State<IntroSliderPage>
{
  List<Slide> slides = [];
  @override
  void initState()
  {
    super.initState();
    slides.add
    (
      Slide
      (
        title: "Welcome to OpenTrivia",
        description: "",
        pathImage: "assets/images/otdb.png",
      )
    );

    slides.add
    (
      Slide
      (
        title: "OpenTrivia Database",
        description: "OpenTrivia is an online database that stores questions of different categories & difficulties.",
        pathImage: "assets/images/otdb.png",
      )
    );

    slides.add
    (
      Slide
      (
        title: "Categories",
        description: "There are over 20 Categories of different questions in OpenTrivia DB.",
        pathImage: "assets/images/otdb.png",
      )
    );

    slides.add
    (
      Slide
      (
        title: "Difficulties",
        description: "OpenTrivia allows you to choose the level of difficulty of the questions from (Easy, Medium, Hard).",
        pathImage: "assets/images/otdb.png",
      ),
    );
  }

  List<Widget> renderListCustomTabs()
  {
    List<Widget> tabs = [];
    for (int i = 0; i < slides.length; i++)
    {
      Slide currentSlide = slides[i];
      tabs.add
      (
        Container
        (
          width: double.infinity,
          height: double.infinity,
          child: Container
          (
            margin: const EdgeInsets.only(bottom: 160, top: 60),
            child: Column
            (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
              [
                Container
                (
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                  child: Image.asset
                  (
                    currentSlide.pathImage,
                    matchTextDirection: true,
                    height: 60,
                  ),
                ),

                Container
                (
                  margin: const EdgeInsets.only(top: 20),
                  child: Text
                  (
                    currentSlide.title,
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),

                Container
                (
                  padding: const EdgeInsets.symmetric
                  (
                    horizontal: 30,
                  ),
                  child: Text
                  (
                    currentSlide.description,
                    style: const TextStyle
                    (
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.5,
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  margin: const EdgeInsets.only
                  (
                    top: 15,
                    left: 20,
                    right: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context)
  {
    return IntroSlider
    (
      backgroundColorAllSlides: Colors.green[700],
      renderSkipBtn: const Text("Skip"),

      renderNextBtn: Text
      (
        "Next",
        style: TextStyle(color: Colors.green[700]),
      ),

      renderDoneBtn: Text
      (
        "Done",
        style: TextStyle(color: Colors.green[700]),
      ),

      colorDoneBtn: Colors.white,
      colorActiveDot: Colors.white,
      sizeDot: 8.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
      listCustomTabs: this.renderListCustomTabs(),
      scrollPhysics: const BouncingScrollPhysics(),
      // shouldHideStatusBar: false,
      onDonePress: () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (_) => HomePage() ) ),
    );
  }
}