import 'package:flutter/material.dart';
import 'package:tiktok_clone/controllers/auth_controller.dart';

import '../../../constants.dart';
import '../../widgets/text_input_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Register',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: buttonColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Stack(
            children: [
              CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage(
                    'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
                backgroundColor: Colors.black,
              ),
              Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                      onPressed: () => authcontroller.pickImage(),
                      icon: Icon(
                        Icons.add_a_photo,
                      )))
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextInputField(
              controller: _usernamecontroller,
              labelText: 'Username',
              icon: Icons.person,
            ),
          ),
          SizedBox(
            height: 15,
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
            height: 15,
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
                  'SignUp',
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
                'Already have an account? ',
                style: TextStyle(fontSize: 20),
              ),
              InkWell(
                onTap: () => authcontroller.registerUser(
                    _usernamecontroller.text,
                    _emailcontroller.text,
                    _passcontroller.text,
                    authcontroller.profilePhoto),
                child: Text(
                  'Login',
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
