import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: buttonColor,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextInputField(
              controller: _emailcontroller,
              labelText: 'Email',
              icon: Icons.email,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextInputField(
              controller: _passcontroller,
              isObscure: true,
              labelText: 'Password',
              icon: Icons.lock,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 50,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: InkWell(
              onTap: () {
                print('Loginscreen');
              },
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account? ',
                style: TextStyle(fontSize: 20),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 20,
                    color: buttonColor,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
