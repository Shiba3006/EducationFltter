import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:frstapp/modules/web_view/web_view_screen.dart';
import 'package:frstapp/shared/cubit/cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget defaultButton ( {
  double width = double.infinity,
  double height = 60.0,
  Color backGroundColor = Colors.blue,
  required Function() function,
  String text = 'login',
  bool isUpperCase = true,
}) => Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(
      10.0,
    ),
    color: backGroundColor,
  ),
  child: MaterialButton(
    onPressed: function,
    child:  Text(
      isUpperCase ? text.toUpperCase() : text,
      style: const TextStyle(
        color: Colors.white,
        //fontWeight: FontWeight.bold,
        //fontSize:20.0,
      ),
    ),
  ),
);

Widget defaultTextFormField({
  required  TextEditingController controller,
  TextInputType? textInputType,
  Function(String)? functionSubmitted,
  Function(String)? onChanged,
  required FormFieldValidator<String>? validate,
  required String? label,
  required IconData preIcon,
  IconData? suffIcon,
  bool isObscureText = false,
  Function()? suffixPressed,
  Function()? ontab,
}) => TextFormField(
  controller: controller,
  keyboardType: textInputType,
  onFieldSubmitted: functionSubmitted,
  onChanged: onChanged,
  obscureText: isObscureText,
  validator: validate,
  onTap: ontab,
  decoration:  InputDecoration(
    labelText: label,
    border: const OutlineInputBorder(),
    prefixIcon: Icon(
      preIcon,
    ),
    suffixIcon:  IconButton(
      onPressed: suffixPressed,
      icon: Icon(
        suffIcon,
      ),
    ),
  ),
);

Widget buildTaskItem(Map model, context) => Dismissible(
  key: Key(model['id'].toString()),
  child:   Padding(

    padding:  const EdgeInsets.all(10.0),

    child: Row(

      children:  [

         CircleAvatar(

          radius: 40.0,

          child: Text(

            '${model['time']}',

            style: const TextStyle(

              fontSize: 18.0,

              fontWeight: FontWeight.bold,

            ),

          ),

        ),

        const SizedBox(

          width: 20.0,

        ),

        Expanded(

          child: Column(

            mainAxisSize: MainAxisSize.min,

            children:  [

              Text(

                '${model['title']}',

                style: const TextStyle(

                  fontSize: 16.0,

                  fontWeight: FontWeight.bold,

                ),

              ),

              Text(

                '${model['date']}',

                style: const TextStyle(

                  color: Colors.grey,

                ),

              ),

            ],

          ),

        ),

        const SizedBox(

          width: 20.0,

        ),

        IconButton(

          onPressed: () {

            AppCubit.get(context).updateData(status: 'done', id: model['id'],);

          },

          icon:const Icon(Icons.check_box,),

          color: Colors.lightGreen,

        ),

        IconButton(

          onPressed: () {

            AppCubit.get(context).updateData(status: 'archive', id: model['id'],);

          },

          icon:const Icon(Icons.archive,),

          color: Colors.black26,

        ),

      ],

    ),

  ),
  onDismissed: (diriction)
  {
    AppCubit.get(context).deleteData( id: model['id']);
  },
);

Widget tasksBuilder ({required List<Map> tasks}) => ConditionalBuilder(
  condition: tasks.isNotEmpty,
  builder: (context) => ListView.separated(
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: buildTaskItem(tasks[index], context),
    ),
    separatorBuilder: (context, index) => myDivider(),
    itemCount: tasks.length,
  ),
  fallback: (context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'Please add any tasks',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  ),
);

Widget myDivider() => Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey[300],
);

Widget buildArticleItem(article, context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(url: article['url'],));
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0,),
            image:  DecorationImage(
              image: NetworkImage(
                  '${article['urlToImage']}',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,),
        Expanded(
          child: SizedBox(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget articleBuilder (list, context , {isSearch = false}) => ConditionalBuilder(

  condition: list.isNotEmpty,

  builder: (context) => ListView.separated(

    physics: const BouncingScrollPhysics(),

    itemBuilder: (context, index) => buildArticleItem(list[index], context),

    separatorBuilder: (context, index) => myDivider(),

    itemCount: list.length,

  ),

  fallback: (context) => isSearch? Container() : const Center(child: CircularProgressIndicator()),
);

void navigateTo (context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) =>  widget,
  ),
);

