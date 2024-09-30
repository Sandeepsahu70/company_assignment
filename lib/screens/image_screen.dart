import 'package:flutter/material.dart';
class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/company-name.png'),
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
