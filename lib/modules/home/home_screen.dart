import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text(
          'First App',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notification_important),
            onPressed: () {
              print('Hello');
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print('search');
            },
          ),
        ],
      ),
      body: Column(
        children:  [
          Padding(
            padding: const EdgeInsets.all(
                25.0
            ),
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(
                      20.0
                  ),
                ),
              ),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  const Image(
                      image: NetworkImage(
                          'https://www.altkia.com/wp-content/uploads/2018/02/%D9%86%D9%88%D8%AD.jpg'
                      ),
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: 200,
                    color: Colors.brown.withOpacity(.4),
                    padding: const EdgeInsets.symmetric(
                      vertical: 1.0,
                    ),
                    child:
                    const Text(
                      'ابني',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: Row(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children:  [
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //       Text(
      //         'First txt',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           //color: Colors.white,
      //         ),
      //       ),
      //    ],
      //  ),
      //),
    );
  }
}
