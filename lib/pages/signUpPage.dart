// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:thinker_app/pages/signInPage.dart';
import 'package:thinker_app/theme/theme.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // * Global key for get input validation
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // * Method validate to validate all the input
    validateInput() {
      if (formKey.currentState!.validate()) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SignInPage(
                  nameData: nameController.text,
                  emailData: emailController.text,
                  passwordData: passwordController.text,
                )));

        print(nameController.text);
        print(emailController.text);
        print(passwordController.text);
      } else {
        print('Unvalidated');
      }
    }

    Widget header() {
      return Text(
        'Sign up',
        style: TextStyle(
            color: whiteColor, fontSize: 28, fontWeight: FontWeight.w500),
      );
    }

    Widget inputForm() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        child: Form(
          // * Set formKey as the key
          key: formKey,
          // * Set the autoValidate as always
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama lengkap',
                style: TextStyle(color: lightGrey),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: nameController,
                style: TextStyle(color: whiteColor),
                decoration: InputDecoration(
                    hintText: 'Masukkan nama lengkap',
                    hintStyle: TextStyle(color: darkGrey),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: backgroundColor1),
                        borderRadius: BorderRadius.circular(8))),
                validator: RequiredValidator(errorText: 'Required *'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Email address',
                style: TextStyle(color: lightGrey),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: emailController,
                style: TextStyle(color: whiteColor),
                decoration: InputDecoration(
                    hintText: 'Masukkan email address',
                    hintStyle: TextStyle(color: darkGrey),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: backgroundColor1),
                        borderRadius: BorderRadius.circular(8))),
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Required *'),
                  EmailValidator(errorText: 'Format email tidak valid')
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Password',
                style: TextStyle(color: lightGrey),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: passwordController,
                style: TextStyle(color: whiteColor),
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Masukkan password',
                    hintStyle: TextStyle(color: darkGrey),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: backgroundColor1),
                        borderRadius: BorderRadius.circular(8))),
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Required *'),
                  MinLengthValidator(6,
                      errorText: 'Minimal 6 karakter atau lebih'),
                  MaxLengthValidator(12,
                      errorText: 'Maksimal 12 karakter atau kurang')
                ]),
              )
            ],
          ),
        ),
      );
    }

    Widget btnSignUp() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        width: double.infinity,
        height: 50,
        child: TextButton(
            onPressed: validateInput,
            style: TextButton.styleFrom(
                backgroundColor: backgroundColor3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: Text(
              'Sign up',
              style: courseName.copyWith(color: whiteColor),
            )),
      );
    }

    Widget reminder() {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sudah memiliki akun?',
              style: courseName.copyWith(
                  color: darkGrey, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: 4,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sign-in-page');
              },
              child: Text(
                'Sign in',
                style: courseName,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              'sekarang',
              style: courseName.copyWith(
                  color: darkGrey, fontWeight: FontWeight.w400),
            )
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              header(),
              inputForm(),
              btnSignUp(),
              Spacer(),
              reminder()
            ],
          ),
        ),
      ),
    );
  }
}
