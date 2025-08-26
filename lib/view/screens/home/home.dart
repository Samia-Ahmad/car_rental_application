
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        title: Text('Car', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          Icon(Icons.notifications, color: Colors.white),
          Icon(Icons.shop_2, color: Colors.white),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Image.asset('assets/images/png/red_car.png', width: 170),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Ferrari 458 Italaia', style: TextStyle(fontSize: 24)),
                    Row(
                      children: [
                        Icon(Icons.location_pin),
                        SizedBox(width: 8),
                        Text('New york'),
                      ],
                    ),
                    Row(children: [
                      Icon(Icons.star, color:Colors.amber),
                      SizedBox(width:4),
                      Text(
                        '(129 reviews)',
                        style: TextStyle(color:Colors.grey),
                      ),
                    ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              Text('\$2000'),
                              SizedBox(width: 4),
                              Text(
                                'days',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width:8),
                        CircleAvatar(
                           backgroundImage: AssetImage('assets/images/png/red_car.png'),
                        ),
                        SizedBox(width: 8),
                        CircleAvatar(
                          child: Icon(Icons.favorite, color:  Colors.red ),
                        
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
