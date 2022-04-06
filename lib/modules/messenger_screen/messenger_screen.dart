
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
   MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20.0,
        backgroundColor: Colors.white,
       elevation: 0.0,
       title: Row(
         children: [
           CircleAvatar(
             radius: 25.0,
             backgroundImage: NetworkImage(
               'https://molenkoning.com/wp-content/uploads/2020/02/savage-horse-black-600x338.jpg',
             ),
           ),
           SizedBox(
             width: 15.0,
           ),
           Text(
             'Chats',
             style: TextStyle(
               color: Colors.black,
             ),
           ),
         ],
       ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.blue[600],
              child: const Icon(
                  Icons.camera_alt,
                color: Colors.white,
                size: 20.0,
              ),
            ),
            onPressed: () {  },
          ),
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.blue[600],
              child: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 20.0,
              ),
            ),
            onPressed: () {  },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(
                  5.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20.0
                  ),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Search'
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                height: 120.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => StoriesItems (),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10.0,
                    ) ,
                    itemCount: 10,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ChatsItems(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.0,
                  ),
                  itemCount: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

// 1. build item.
// 2. build list.
// 3. add item to list.

// arrow method
Widget StoriesItems () => Container(
  width: 60.0,
  child: Column(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
              'https://molenkoning.com/wp-content/uploads/2020/02/savage-horse-black-600x338.jpg',
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 2.0,
              end: 2.0,
            ),
            child: CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 5.0,
      ),
      Text(
        'Shehab Ahmed Mohamed Sayed',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  ),
) ;
Widget ChatsItems () => Row(
  children: [
    Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          radius: 35.0,
          backgroundImage: NetworkImage(
            'https://molenkoning.com/wp-content/uploads/2020/02/savage-horse-black-600x338.jpg',
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(
            bottom: 2.0,
            end: 2.0,
          ),
          child: CircleAvatar(
            radius: 7.0,
            backgroundColor: Colors.red,
          ),
        ),
      ],
    ),
    SizedBox(
      width: 15.0,
    ),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shehab Ahmed',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Hello Hello Hello Hello Hello Hello'
                      'Hello Hello Hello Hello Hello Hello',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0,),
                child: Container(
                  width: 7.0,
                  height: 7.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Text(
                '11.00 AM',
              )
            ],
          ),
        ],
      ),
    ),
  ],
) ;