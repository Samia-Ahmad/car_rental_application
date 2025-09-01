import 'dart:ui';

import 'package:car_rental_application/view/screens/auth/sign_in.dart';
import 'package:car_rental_application/view/screens/home/home.dart';
import 'package:car_rental_application/view/widgets/primary_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool showStep2 = false;
  bool agreeToTerms = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
            ),
          ),

          SizedBox(height: 90),
          Stack(
            children: [
              Positioned(
                bottom: 1,
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.95,
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/png/black_car.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 15,
                    sigmaY: 15,
                  ), // blur strength
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * 0.72,
                    decoration: BoxDecoration(
                      //color: Color.fromRGBO(255, 255, 255, 0.2),
                      color: Colors.white.withOpacity(0.2), // translucent layer
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              'assets/images/png/avatar.png',
                            ),
                          ),
                          SizedBox(height: 48),

                          /// Step 1: Email + Continue + Google/Apple
                          if (!showStep2) ...[
                            _buildLabel("Email"),
                            TextFormField(
                              controller: emailController,
                              decoration: _inputDecoration(
                                "Enter your email",
                                Icons.email_outlined,
                              ),
                            ),
                            SizedBox(height: 32),

                            PrimaryButton(
                              text: 'Continue',
                              onPressed: () {
                                setState(() {
                                  showStep2 = true;
                                });
                              },
                            ),

                            SizedBox(height: 32),
                            Text(
                              'Or continue with',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 32),

                            _signupWith(
                              "Sign Up With Google",
                              "assets/images/png/google.png",
                            ),
                            SizedBox(height: 24),
                            _signupWith(
                              "Sign Up With Apple",
                              "assets/images/png/apple.png",
                            ),

                            SizedBox(height: 32),
                            RichText(
                              text: TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(
                                  color: Colors.white, // normal text color
                                  fontSize: 16,
                                ),

                                children: [
                                  TextSpan(
                                    text: "Sign In",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        print("Sign In clicked!");
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SignIn(),
                                          ),
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],

                          /// Step 2: Username + Password + Sign Up
                          if (showStep2) ...[
                            _buildLabel('User Name'),
                            TextFormField(
                              controller: usernameController,
                              decoration: _inputDecoration(
                                "Your User Name",
                                Icons.supervised_user_circle_outlined,
                              ),
                            ),
                            SizedBox(height: 32),
                            _buildLabel('Password'),
                            TextFormField(
                              controller: passwordController,
                              decoration: _inputDecoration(
                                "Password",
                                Icons.lock_outline_rounded,
                              ),
                            ),
                            SizedBox(height: 24),

                            SizedBox(height: 24),
                            PrimaryButton(
                              text: 'Sign Up',
                              onPressed: agreeToTerms
                                  ? () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Home(),
                                        ),
                                      );
                                    }
                                  : null,

                              //backgroundColor: agreeToTerms ? Colors.amber : Color.fromRGBO(132, 129, 129, 0.2), // enabled / disabled color
                            ),
                            SizedBox(height: 32),
                            // ✅ Terms & Conditions Checkbox
                            CheckboxListTile(
                              value: agreeToTerms,
                              onChanged: (value) {
                                setState(() {
                                  agreeToTerms = value ?? false;
                                });
                              },
                              activeColor: Colors.white,
                              checkColor: Colors.black,
                              controlAffinity: ListTileControlAffinity.leading,
                              fillColor: WidgetStateProperty.resolveWith((
                                states,
                              ) {
                                if (states.contains(WidgetState.selected)) {
                                  return Colors.white; // ✅ Checked box color
                                }
                                return Colors
                                    .grey; // ✅ Unchecked box border color
                              }),
                              title: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                  children: [
                                    TextSpan(text: 'I agree all '),
                                    TextSpan(
                                      text: '"Terms and Conditions"',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      // make it clickable
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print("Open Terms & Conditions Page");
                                          // TODO: Navigate to Terms page
                                        },
                                    ),
                                    TextSpan(text: ' & '),
                                    TextSpan(
                                      text: '"Privacy Policy"',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print("Open Privacy Policy Page");
                                          // TODO: Navigate to privacy policy page
                                        },
                                    ),
                                    TextSpan(text: " of this App"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _signupWith(String text, String imagePath) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      height: 50, // fixed height
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),
          foregroundColor: Colors.white,

          //padding: EdgeInsets.symmetric(horizontal: 150 , vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            SizedBox(width: 12),
            Text(text, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      filled: true,
      fillColor: Color.fromRGBO(255, 255, 255, 0.2),
      prefixIcon: Icon(icon),
      prefixIconColor: Colors.white,
      hintText: hint,
      hintStyle: TextStyle(color: Colors.white),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}
