import 'package:flutter/material.dart';

class TextScreen extends StatefulWidget {
  const TextScreen({super.key});

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello ',
                              style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 200,
                    child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.black87
                         ),
                        onPressed: (){},
                        child: Text(' Click for link ', style: TextStyle(fontSize: 16,color: Colors.white),)),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
