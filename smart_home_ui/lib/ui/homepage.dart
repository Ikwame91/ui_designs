import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_ui/utils/smart_device.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Paddding
  final double horizontalpadding = 40;
  final double verticalpadding = 20;
  var sizedBox = const SizedBox(height: 20);
  List mySmartDevices = [
    ["Smart Bulb", "assets/light-bulb.png", false],
    ["Smart Fan", "assets/fan.png", true],
    ["Smart AC", "assets/air-conditioner.png", false],
    ["Smart TV", "assets/smart-tv.png", true],
  ];

  void poerSwitchedOn(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalpadding,
              vertical: verticalpadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/menu.png',
                  height: 45,
                  color: Colors.grey[800],
                ),
                Icon(
                  Icons.person,
                  color: Colors.grey[800],
                  size: 45,
                ),
              ],
            ),
          ),
          sizedBox,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )),
                Text(
                  "Nana Kwame",
                  style: GoogleFonts.poppins(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizedBox,
                Text('Smart Devices',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
          Expanded(
              child: GridView.builder(
                  itemCount: mySmartDevices.length,
                  padding: EdgeInsets.all(5),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                  itemBuilder: (context, index) {
                    return SmartDevices(
                      iconPath: mySmartDevices[index][1],
                      deviceName: mySmartDevices[index][0],
                      powerOn: mySmartDevices[index][2],
                      onChanged: (value) => poerSwitchedOn(value, index),
                    );
                  }))
        ],
      )),
    );
  }
}
