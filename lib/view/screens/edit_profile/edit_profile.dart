import 'package:flutter/material.dart';
import './../../widgets/custom_date_picker_field.dart'; 
import './../../widgets/custom_feilds.dart';
import './../../widgets/primary_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? gender;
  String? selectedLocation;
  List<String> locations = ['New York', 'London', 'Paris', 'Tokyo'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.15),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: Color.fromRGBO(255, 255, 255, 0.5),
              width: 1,
            ),
          ),
          child: Icon(Icons.arrow_back_sharp, color: Colors.white),
        ),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        margin: EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          color: Color.fromRGBO(249, 249, 249, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 4),
              Text(
                "Edit profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 12),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 105,
                    height: 105,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: SweepGradient(
                        colors: [
                          Color.fromRGBO(235, 183, 57, 1), // colored right half
                          Color.fromRGBO(
                            235,
                            183,
                            57,
                            1,
                          ), // solid fill for half
                          Colors.transparent, // left half invisible
                          Colors
                              .transparent, // other half invisible              // ensure rest is transparent            // other half invisible
                        ],
                        stops: [0.0, 0.5, 0.5, 1.0], // first color covers half
                        startAngle: 0, // start at top
                        endAngle:
                            3.14, // sweep 180 degrees to bottom                    // sweep 180° to left
                      ),
                    ),
                  ),
                  Container(
                    width: 95,
                    height: 95,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/png/R.png'),
                    radius: 45,
                  ),
                  Positioned(
                    bottom: 2,
                    left: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 12,
                      child: Icon(
                        Icons.camera_alt,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                'Erica Fernandez',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text('Joined @jan 24, 2017', style: TextStyle(fontSize: 12)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Name',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                   EditProfileFeilds(
                    hintTitle: 'First Name',
                    width: MediaQuery.of(context).size.width * 0.43,
                     height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  SizedBox(width: 22),
                  EditProfileFeilds(
                    hintTitle: 'Last Name',
                    width: MediaQuery.of(context).size.width * 0.43,
                     height: MediaQuery.of(context).size.height * 0.05,
                  )
                ],
              ),
              SizedBox(height: 12),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              SizedBox(height: 12),
               EditProfileFeilds(
                    hintTitle: 'Enter E-mail',
                    width: MediaQuery.of(context).size.width * 0.95,
                     height: MediaQuery.of(context).size.height * 0.05,
                  ),
              SizedBox(height: 12),

              CustomDatePickerField(
                label: "Date of Birth",
                labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                onDateSelected: (date) {
                  print("Selected: $date");
                },
              ),
              SizedBox(height: 12),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Gender',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio<String>(
                    value: 'Male',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value;
                      });
                    },
                  ),
                  Text('Male'),
                  SizedBox(width: 16),
                  Radio<String>(
                    value: 'Female',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value;
                      });
                    },
                  ),
                  Text('Female'),
                ],
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Location',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              SizedBox(height: 8),
              EditProfileFeilds(
  width: MediaQuery.of(context).size.width * 0.95,
  height: MediaQuery.of(context).size.height * 0.05,
                child: DropdownButtonFormField<String>(
                  value: selectedLocation,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  items: locations.map((location) {
                    return DropdownMenuItem<String>(
                      value: location,
                      child: Text(location),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedLocation = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 18),
              PrimaryButton(
                text: 'Save Changes ',
                onPressed: () {
                  print('butoon pressed');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

