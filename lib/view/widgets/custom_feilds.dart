
import 'package:flutter/material.dart';

class EditProfileFeilds extends StatelessWidget {
  
  const EditProfileFeilds({
    super.key,
     this.hintTitle,
     this.colorOfFeild,
     required this.width,
     required this.height,
     this.child,
    
   
  });
final String? hintTitle;
 final Color? colorOfFeild;
final double width;
final double height;
 final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: colorOfFeild ??  Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // shadow color
              spreadRadius: 1, // how wide it spreads
              blurRadius: 12,   // softness
              offset: Offset(2, 3), // x,y direction
            ),
          ],
        ),
          child: child ??
        TextFormField(
          decoration: InputDecoration(
            hintText: hintTitle ?? '',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none, // remove default border
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
        ),
      ),
    );
  }
}
