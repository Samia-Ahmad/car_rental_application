import 'package:car_rental_application/view/screens/auth/sign_up.dart';
import 'package:car_rental_application/view/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../widgets/primary_button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: SmoothPageIndicator(
          controller: _controller,
          count: 2,
          effect: WormEffect(
            dotHeight: 10,
            dotWidth: 10,
            spacing: 8,
            dotColor: Colors.white54,
            activeDotColor: Colors.white,
          ),
        ),
      ),

      body: 
          PageView(
            controller: _controller,
            children: [
              _buildPage(
                title: 'Rent Premium \nCars',
                subtitle: 'Contrary to popular belief, Lorem Ipsum is',
                buttonText: 'Next',
                showLeftHalf: true,
                onPressed: () {
                  _controller.nextPage(
                    duration: Duration(microseconds: 400),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              _buildPage(
                title: 'Travel With Utter Comfort',
                subtitle: 'Wide variety of luxury and economy cars',
                buttonText: 'Get Started',
                showLeftHalf: false,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  );
                },
              
          ),
         
      
        ],
      ),
    );
  }

  Widget _buildPage({
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onPressed,
    required bool showLeftHalf, // true for first page, false for second
  }) {
    return Stack(

      children: [
       Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          //mainAxisSize: MainAxisSize.min,
          
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Text(subtitle, style: TextStyle(color: Colors.white, fontSize: 16)),
            SizedBox(height: 32),
      
            PrimaryButton(
              text: buttonText,
              onPressed: onPressed,
              widthFactor: 0.4,
            ),
      
     
      
               
          ],
        ),
      ),
       
       Align(
              alignment: Alignment.bottomRight,
              child:ClipRect(
                 child: Align(
                alignment: showLeftHalf ? Alignment.bottomLeft : Alignment.bottomRight,
                widthFactor: 0.5, // show half of the image
               
              child: Image.asset(
                'assets/images/png/black_car.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width *2,
                height: MediaQuery.of(context).size.height * 0.5,
                alignment: Alignment.bottomCenter, // anchor image to bottom
              ),
                 ),
              ),
            ),
      ],
    );
  }
}
