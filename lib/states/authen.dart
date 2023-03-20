import 'dart:convert';

import 'package:ansonline/model/usermodel.dart';
import 'package:ansonline/utility/SetConfig.dart';
import 'package:ansonline/utility/my_dialog.dart';
import 'package:ansonline/widgets/shw_title.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../widgets/show_image.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool statusRedEye = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
          behavior: HitTestBehavior.opaque,
           child: Form(key: formKey,
            
            child: ListView(
              children: [
               newMethod(size),
               appName(),
               userMethod(size),
               passwordMethod(size),
               logIn(size),
               createAccount(),
             ],
            ),
          ),

        ),
      ),
    );
  }

  Row createAccount() {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShowTitle(
                  title: 'Non Account ? ',
                  textStyle: Static_val().h3Style(),
                ),
                TextButton(
                  onPressed: ()=>Navigator.pushNamed(context,
                  Static_val.routeCreate),
                  child: const Text('Create Account'),
                ),
              ],
            );
  }

  Row logIn(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          width: size * 0.6,
          child: ElevatedButton(
            style: Static_val().myButtonStyle(),
            onPressed: () {
              if (formKey.currentState!.validate()){
                String user = userController.text;
                String password = passwordController.text;
                print(' ===  user = $user, password = $password');
                checkAuthen(user:user, password: password);

      

                
              }
            },
            child: const Text('Login'),
          ),
        ),
      ],
    );
  }

  Row userMethod(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(controller: userController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Fill User in Blank';
              } else {
                return null;
              }
            
          },
            decoration: InputDecoration(
              labelStyle: Static_val().h3Style(),
              labelText: 'User :',
              prefixIcon: Icon(Icons.account_circle, color: Static_val.light),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Static_val.dart),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Static_val.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row passwordMethod(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
              return 'Pleass Fill Passwird  ';
              }else {
                return null;
              }
            },
            obscureText: statusRedEye,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      statusRedEye = !statusRedEye;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Static_val.dart,
                  )),
              labelStyle: Static_val().h3Style(),
              labelText: 'Password :',
              prefixIcon: Icon(Icons.lock_outline, color: Static_val.light),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Static_val.dart),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Static_val.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row appName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: Static_val.appName,
          textStyle: Static_val().h1Style(),
        ),
      ],
    );
  }

  Row newMethod(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: ShowImage(path: Static_val.image4),
        ),
      ],
    );
  }
  
  Future<void> checkAuthen({required String user, required String password}) async { 
      String path ="https://www.57ans.com/ansonline/api/getUserWhereUser.php?isAdd=true&user=$user";
      await Dio().get(path).then((value) {
      print('## value ==>> $value');
      print(value.toString());
      if (value.toString().isEmpty) {
        MyDialog().normalDialog(context,'User False' ,' No $user');
      } else {
        for(var item in json.decode(value.data)) {
          UserModel model = UserModel.fromMap(item);
          if (password == model.password) {
            // Success Auth
            String type = model.type;
            print( '#######  Authen  Success Type ==> $type');
          } else {
            MyDialog().normalDialog(context, 'Password False !!!','Password False Please Try Again');

          }
        
          }

        }
      }
    );
  }
}