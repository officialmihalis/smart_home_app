import 'package:flutter/material.dart';
import 'package:smart_home_app/util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// padding  constant
  final double horizontal = 40.0;
  final double vertical = 25;
  List mySmartDevices = [
    ['Smart Light', "images/light-bulb.png", true],
    ['Smart AC', "images/air-conditioner.png", false],
    ['Smart TV', "images/smart-tv.png", false],
    ['Smart Fan', "images/fan.png", false],
  ];
  void powerSwitchChanged(bool value,int index){
    setState(() {
     mySmartDevices[index][2] = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //? custom app bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontal,
                vertical: vertical,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'images/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),
            //! welcome home MITCH KOKO

            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontal,
                vertical: vertical,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Home'),
                  Text(
                    'MITCH KOKO',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),

            // smart devices + grid
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontal,
                vertical: vertical,
              ),
              child: const Text('Smart Devices'),
            ),

            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemCount: mySmartDevices.length,
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged:(value) => powerSwitchChanged(value),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
