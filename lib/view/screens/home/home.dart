import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_on_outlined),
            Text('California', style: TextStyle(color: Colors.black , fontSize: 18)),
          ],
        ),
         centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
               radius: 20,
  backgroundColor: Colors.red,
              backgroundImage: AssetImage('assets/images/png/avatar.png')
                    ),
          )],
        
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Browse Cars',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          // first row under the text (Search bar)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: TextField(
              //style: TextStyle(),
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.grey),
                //isDense: true, //  makes the field more compact
                //contentPadding: EdgeInsets.symmetric(vertical: 0), // 👈 removes top padding
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // active color
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    print("Search icon clicked!");
                    // TODO: implement search logic here
                  },
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
          ),

          // Second row under the text (Filter)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Filter',
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Filter',
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                  SizedBox(width: 8),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Filter',
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                  SizedBox(width: 8),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Filter',
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),

                  SizedBox(width: 8),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Filter',
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Third Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Text(
                  'Available cars',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Icon(Icons.filter_alt),
              ],
            ),
          ),

          // Scrollable car list
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8),
              children: [
                AvailableCarsWidget(car_name: "Ferrari 458 Italia"),
                AvailableCarsWidget(car_name: "Toyota White"),
                AvailableCarsWidget(car_name: "Tesla S"),
                AvailableCarsWidget(car_name: "Tesla S"),
                AvailableCarsWidget(car_name: "Tesla S"),
                AvailableCarsWidget(car_name: "Tesla S"),
                AvailableCarsWidget(car_name: "Tesla S"),
                AvailableCarsWidget(car_name: "Tesla S"),
                AvailableCarsWidget(car_name: "Tesla S"),
                AvailableCarsWidget(car_name: "Tesla S"),
                AvailableCarsWidget(car_name: "Tesla S"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AvailableCarsWidget extends StatelessWidget {
  final String car_name;

  const AvailableCarsWidget({super.key, required this.car_name});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.9,
          margin: EdgeInsets.symmetric(vertical: 8), // add vertical spacing
          padding: EdgeInsets.all(8),
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
                  Text(car_name, style: TextStyle(fontSize: 18)),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_pin),
                      SizedBox(width: 8),
                      Text('New york'),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 4),
                      Text('4.9'),
                      SizedBox(width: 4),
                      Text(
                        '(129 reviews)',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '\$2000',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '/day',
                              //style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/images/png/red_car.png',
                        ),
                        radius: 14,
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Color.fromRGBO(244, 244, 244, 1),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 18,
                        ),
                        radius: 14,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
