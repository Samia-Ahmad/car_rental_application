import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text; // Button text
  final VoidCallback onPressed; // Callback function
  final double widthFactor; 
  final double height;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height =  50,
    this.widthFactor = 0.95,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width *widthFactor,
      height: height, // fixed height
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
    
          //padding: EdgeInsets.symmetric(horizontal: 150 , vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,

        ),
      ),
    );
  }
}

