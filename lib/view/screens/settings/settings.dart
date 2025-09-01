import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 24),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/png/avatar.png'),
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

              Text(
                'Joined @jan 24, 2017',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(height: 16),
              settingsWidget(title: 'Settings', icon: Icons.settings),
              SizedBox(height: 16),
              settingsWidget(title: 'Billing Details', icon: Icons.wallet),
              SizedBox(height: 16),
              settingsWidget(title: 'Edit Profile', icon: Icons.edit_square),
              SizedBox(height: 16),
              settingsWidget(title: 'Information', icon: Icons.info),
              

              SizedBox(height: 32,),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.amber.withValues(alpha: 0.2),
                      child: Icon(Icons.logout_outlined, color: Colors.amber),
                      radius: 28,
                    ),
                    SizedBox(width: 16),
                    Text(
                      "Log out",
                      //overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class settingsWidget extends StatelessWidget {
  const settingsWidget({super.key, required this.title, required this.icon});
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
