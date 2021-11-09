// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:thinker_app/pages/home/mainPage.dart';
import 'package:thinker_app/pages/home/profile.dart';
import 'package:thinker_app/theme/theme.dart';
import 'package:form_field_validator/form_field_validator.dart';

class EditProfilePage extends StatefulWidget {
  var emailData;
  var nameData;
  EditProfilePage({Key? key, this.emailData, this.nameData}) : super(key: key);

  @override
  State<EditProfilePage> createState() =>
      _EditProfilePageState(emailData, nameData);
}

class _EditProfilePageState extends State<EditProfilePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var emailData;
  var nameData;
  _EditProfilePageState(this.emailData, this.nameData);

  validateInput() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MainPage(
                nameData: nameController.text,
                emailData: emailController.text,
                currentIndex: 2,
              )));

      print('Validated');
      print(nameController.text);
      print(emailController.text);
    } else {
      print('Invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget profileImg() {
      return Center(
        child: Image(
          image: AssetImage('assets/images/icon_profile_big.png'),
          width: 180,
          height: 180,
        ),
      );
    }

    Widget inputForm() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama lengkap', style: TextStyle(color: lightGrey)),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: nameController,
                style: TextStyle(color: whiteColor),
                decoration: InputDecoration(
                    hintText: nameData,
                    hintStyle: TextStyle(color: darkGrey),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: backgroundColor1),
                        borderRadius: BorderRadius.circular(8))),
                validator: RequiredValidator(errorText: 'Required *'),
              ),
              SizedBox(height: 20),
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
                    hintText: emailData,
                    hintStyle: TextStyle(color: darkGrey),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: backgroundColor1),
                        borderRadius: BorderRadius.circular(8))),
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Required *'),
                  EmailValidator(errorText: 'Format email tidak valid')
                ]),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        // ignore: prefer_const_constructors
        title: Text(
          'Edit Profile',
          textAlign: TextAlign.end,
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: validateInput, icon: Icon(Icons.done))],
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(defaultMargin),
          child: Column(children: [profileImg(), inputForm()]),
        ),
      ),
    );
  }
}
