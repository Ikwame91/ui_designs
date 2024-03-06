import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDevices extends StatelessWidget {
  const SmartDevices({
    super.key,
    required this.iconPath,
    required this.deviceName,
    required this.powerOn,
    this.onChanged,
  });
  final String iconPath;
  final String deviceName;
  final bool powerOn;
  final void Function(bool)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: powerOn ? Colors.grey[900] : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                iconPath,
                color: powerOn ? Colors.white : Colors.black,
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(deviceName,
                          style: TextStyle(
                            fontSize: 20,
                            color: powerOn ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                      value: powerOn,
                      onChanged: onChanged,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
