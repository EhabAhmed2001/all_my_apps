import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text(
          'my app',
        ),
        actions: const [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: Not,
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: Search,
          ),
        ],
      ),
      body: Column(
        children:[
          Stack(
            alignment: Alignment.bottomCenter,
            children:[
              const Image(
                image: NetworkImage(
                  'https://i1.sndcdn.com/artworks-000055932879-6plglw-t500x500.jpg'
                ),
                width: 300.0,
              ),
              Container(
                
                width: 300.0,
                color: Colors.teal.withOpacity(0.5),
                child:const Text(
                  'اعظم نادي في الكون',
                  textAlign:TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,

                  ),
                ),

              ),
            ],
          ),
        ],
      ),
    );
  }
}

void Not() {
  print("it's work: ");
}
void Search(){
  print('search working: ');
}
void ICON(){
  print('mute is working: ');
}
