import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';




class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

	
final List<PageViewModel> pages = [
    PageViewModel(
      image: Image.asset('assets/images/fast-food.png'),
      title: 'Welcome to Application',
      body:
          'Welcome to best Shabu Restaurant.Here you will find all what you eat at one place.',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text('Let s Go'),
        ),
      ),

      decoration: const PageDecoration(
        imagePadding: EdgeInsets.all(20),
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    PageViewModel(
      image: Image.asset('assets/images/salad.png'),
      title: 'Many food menus to choose.',
      body:
          'Including fresh food, vegetables, drinks, desserts and ice cream.',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text('Let s Go'),
        ),
      ),
      decoration: const PageDecoration(
        imagePadding: EdgeInsets.all(20),
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    PageViewModel(
      image: Image.asset('assets/images/hot-dog.png'),
      title: 'Why are you still waiting?',
      body:
          'Good quality raw materials, beautiful atmosphere and cheap ',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text('Let s Go'),
        ),
      ),
      
      decoration: const PageDecoration(
        imagePadding: EdgeInsets.all(20),
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 16, 255, 95),
        title: const Text('Restaurant Application'),
        centerTitle: true,
      ),
      body: 
      IntroductionScreen(
        globalBackgroundColor: const Color.fromARGB(179, 187, 247, 96),
        pages: pages,
        showSkipButton: true,
        skip: const Text('Skip'),
        showDoneButton: true,
        done: const Text('Done'),
        showNextButton: true,
        next: const Icon(Icons.arrow_forward,size: 25,),
        onDone: () => onDone(context),
        curve: Curves.bounceInOut,
        dotsDecorator: const DotsDecorator(
          size: Size(15, 15),
          color: Colors.blue,
          activeColor: Colors.orange,
          activeSize: Size.square(20)
        ),
      ),
    );
  }


  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }
}


