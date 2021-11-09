// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:thinker_app/pages/home/mainPage.dart';
import 'package:thinker_app/theme/theme.dart';

class SignInPage extends StatefulWidget {
  var nameData;
  var emailData;
  var passwordData;

  SignInPage({Key? key, this.nameData, this.emailData, this.passwordData})
      : super(key: key);

  @override
  State<SignInPage> createState() =>
      _SignInPageState(nameData, emailData, passwordData);
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var nameData;
  var emailData;
  var passwordData;

  _SignInPageState(this.nameData, this.emailData, this.passwordData);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    validateInput() {
      if (formKey.currentState!.validate()) {
        (emailController.text == emailData &&
                passwordController.text == passwordData)
            ? Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MainPage(
                      nameData: nameData,
                      emailData: emailController.text,
                      currentIndex: 0,
                    )))
            : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Color(0xffFC3B3B),
                content: Text(
                  'Email atau password yang dimasukkan tidak sesuai!',
                  textAlign: TextAlign.center,
                )));
      } else {
        print('Invalid');
      }
    }

    Widget header() {
      return Container(
        // ignore: prefer_const_constructors
        child: Text(
          'Log in',
          style: TextStyle(
              color: whiteColor, fontSize: 28, fontWeight: FontWeight.w500),
        ),
      );
    }

    Widget inputForm() {
      return Container(
          margin: EdgeInsets.only(top: 40),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  validator: RequiredValidator(errorText: 'Required *'),
                ),
              ],
            ),
          ));
    }

    Widget signInButton() {
      return Container(
        // ignore: prefer_const_constructors
        margin: EdgeInsets.only(top: 40),
        height: 50,
        width: double.infinity,
        child: TextButton(
            onPressed: validateInput,
            style: TextButton.styleFrom(
                backgroundColor: backgroundColor3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: Text(
              'Log in',
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
              'Belum memiliki akun?',
              style: courseName.copyWith(
                  color: darkGrey, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: 4,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sign-up-page');
              },
              child: Text(
                'Sign up',
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            header(),
            inputForm(),
            // emailInput(),
            // passwordInput(),
            signInButton(),

            Spacer(),
            reminder()
          ]),
        )));
  }
}
