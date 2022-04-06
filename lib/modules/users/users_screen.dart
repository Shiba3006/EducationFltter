import 'package:flutter/material.dart';
import 'package:frstapp/models/user/user_model.dart';



class UsersScreen extends StatelessWidget {
   UsersScreen({Key? key}) : super(key: key);

  List <UserModel> user =[
    UserModel(id: 3006,
        name: 'Shehab Ahmed',
        phone: '+201002548402'
    ),
    UserModel(id: 64,
        name: 'Salma Ahmed',
        phone: '+202548402'
    ),
    UserModel(id: 8,
        name: 'Nora Ahmed',
        phone: '+201002548'
    ),
    UserModel(id: 1,
        name: 'Nooh Shehab ',
        phone: '+20104645'
    ),
    UserModel(id: 30,
        name: 'Roaa',
        phone: '+20100402'
    ),
    UserModel(id: 6,
        name: 'Salman',
        phone: '+26546548402'
    ),
    UserModel(id: 80,
        name: 'Ahmed', phone: '+26465'),
    UserModel(
        id: 111, name: 'Ehehab ', phone: '000000'),
    UserModel(id: 3006,
        name: 'Shehab Ahmed',
        phone: '+201002548402'
    ),
    UserModel(id: 64,
        name: 'Salma Ahmed',
        phone: '+202548402'
    ),
    UserModel(id: 8,
        name: 'Nora Ahmed',
        phone: '+201002548'
    ),
    UserModel(id: 1,
        name: 'Nooh Shehab ',
        phone: '+20104645'
    ),
    UserModel(id: 30,
        name: 'Roaa',
        phone: '+20100402'
    ),
    UserModel(id: 6,
        name: 'Salman',
        phone: '+26546548402'
    ),
    UserModel(id: 80,
        name: 'Ahmed', phone: '+26465'),
    UserModel(
        id: 111, name: 'Ehehab ', phone: '000000'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Users',
          ),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) => buildUserItem(user[index]),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
              end: 20.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey,
            ),
          ),
          itemCount: user.length,
        ));
  }

  Widget buildUserItem(UserModel user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              child: Text(
                '${user.id}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${user.phone}',
                  style: TextStyle(
                    //fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ],
        ),
      );

// 1. build item.
// 2. build list.
// 3. add item to list.
}
