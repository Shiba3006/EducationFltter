
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frstapp/shared/components/components.dart';

class LoginScreen extends StatefulWidget
{

   const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding:  const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Text(
                      'Login',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   const SizedBox(
                    height: 40.0,
                  ),
                  defaultTextFormField(
                    textInputType: TextInputType.emailAddress,
                    label: 'Email address',
                    preIcon: Icons.email,
                    controller: emailController,
                    validate: (String? value)
                    {
                      if (value!.isEmpty) {
                        return 'Please write your email';
                      }
                    },
                  ),
                    const SizedBox(
                     height: 40.0,
                   ),
                    defaultTextFormField(
                        label: 'Password',
                      controller: passController,
                      validate: (String? value)
                      {
                          if (value!.isEmpty) return 'Please write your password';
                      },
                      textInputType: TextInputType.visiblePassword,
                      preIcon: Icons.lock,
                      suffIcon: isSecure ? Icons.visibility: Icons.visibility_off,
                      isObscureText: isSecure,
                      suffixPressed: (){
                          setState(() {
                            isSecure = !isSecure;
                          });
                      },
                    ),
                    const SizedBox(
                     height: 40.0,
                   ),
                    defaultButton(
                        function: ()
                        {
                          if (formKey.currentState!.validate())
                          {
                            print (emailController);
                            print (passController);
                          }
                        },
                    ),
                    const SizedBox(
                     height: 40.0,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children:  [
                        const Text(
                         'Don\'t have an account '
                       ),
                       TextButton(
                           onPressed: (){},
                           child:  const Text(
                             'Register now',
                           ),
                       ),
                     ],
                   ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
