import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.arrow_back_ios_new, color: Colors.white),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
        ),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch, 
          children: [
            SizedBox(height: 24),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/png/red car.png'),
            ),
            SizedBox(height: 18),
            Text(
              'Erica Fernandez',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                wordSpacing: 5,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Joined @jan 24, 2017',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            SizedBox(height: 16),
            settingsWidget(title: 'Settings', icon: Icons.settings,),
            settingsWidget(title: 'Billing Details' , icon: Icons.wallet,),
            //settingsWidget(title: 'Edit Profile',),
            //settingsWidget(title: 'Information',),
           // primaryButton(color: Colors.black),),

          ],
        ),
      ),
    );
  }
}

class primaryButton extends StatelessWidget {
  const primaryButton({
    super.key,
    required this.color,
    this.height,
  });
final Color color;
final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: height ?? 60 ,
      color: color,
    );
  }
}

class settingsWidget extends StatelessWidget {
  const settingsWidget({
    super.key,
    required this.title,
    required this.icon,
  });
   final String title;
   final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.amber.withValues(alpha: 0.2),
            child: Icon(icon, color: Colors.amber),
          ),
          SizedBox(width: 16),
            Text(
              title,
              //overflow: TextOverflow.ellipsis,
            ),
          Spacer(),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
