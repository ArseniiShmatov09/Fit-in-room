import 'package:flutter/material.dart';

class TestRoomWidget extends StatelessWidget {
  const TestRoomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(217, 217, 217, 1),
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 190,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20,),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(
                      width: 3.0,
                    ),
                  ),
                ),
                child: const Text(
                  'Start test',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            const Center(
              child: Text(
                'Test results',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  color: Color.fromRGBO(0, 255, 42, 1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

