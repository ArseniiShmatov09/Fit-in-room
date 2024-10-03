import 'package:flutter/material.dart';

class AllRoomsPage extends StatelessWidget {
  const AllRoomsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(217, 217, 217, 1),
              borderRadius: BorderRadius.circular(20.0),
            ),
            height: 520, //???????
            child: ListView.builder(
              itemExtent: 120,
              itemBuilder: (BuildContext context, int index){
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Center(
                        child: Text(
                          'Room $index',
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: Color.fromRGBO(128, 128, 128, 1),
                        thickness: 0.5,
                        height: 0,
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
          const SizedBox(height: 15,),
          ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: const Size(double.infinity, 50),
              shape: const RoundedRectangleBorder(),
            ),
            child: const Text(
              'Add new room',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            )
          )
        ],
      ),
    );
  }
}
