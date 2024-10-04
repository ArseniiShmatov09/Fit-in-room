import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class RoomParametersWidget extends StatelessWidget {
  const RoomParametersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(217, 217, 217, 1),
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 220,
        child: const Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Room parameters',
                    style: TextStyle(
                      fontFamily: FontFamily.sofiaSans,
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  Icon(Icons.edit),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16,),
              child: Divider(
                color: Color.fromRGBO(128, 128, 128, 1),
                thickness: 0.5,
                height: 0,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Center(
                child: Text(
                  'height*width*length',
                  style: TextStyle(
                    fontFamily: FontFamily.sofiaSans,
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                color: Color.fromRGBO(128, 128, 128, 1),
                thickness: 0.5,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
