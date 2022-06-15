import 'package:boutique_merchant/ui/authScreen/login.dart';
import 'package:boutique_merchant/ui/registration/userRegistrationVM.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/PrimaryButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../home/homePage.dart';
import 'package:boutique_merchant/utilities.dart';
import 'package:boutique_merchant/utils/screen_navigation.dart';
import 'package:provider/provider.dart';

import '../../logger.dart';

class SaveUserDetails extends StatefulWidget {
  @override
  _SaveUserDetailsState createState() => _SaveUserDetailsState();
}

class _SaveUserDetailsState extends State<SaveUserDetails> {
  TextEditingController _numberController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController searchController = new TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  Map<String, dynamic> request = new Map();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close,
            size: 30,
            color: Colors.black,
          ),
        ),
        title: Text(
          "User Details",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        textTheme: Theme.of(context).textTheme,
      ),
      body: Consumer<UserDataViewModel>(builder: (context, value, child) {
        return Center(
          child: Container(
            width: width * .85,
            height: height,
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'This field cant be empty';
                        }
                        return null;
                      },
                      readOnly: true,
                      initialValue:
                          FirebaseAuth.instance.currentUser!.phoneNumber,
                      onSaved: (val) {
                        request.putIfAbsent("phone", () => val);
                      },
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Mobile Number',
                        labelStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onSaved: (val) {
                        request.putIfAbsent("name", () => val);
                      },
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'This field cant be empty';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Name',
                        labelStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onSaved: (val) {
                        request.putIfAbsent("email", () => val);
                      },
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'This field cant be empty';
                        } else if (!value.trim().contains("@") ||
                            !value.trim().contains(".")) {
                          return 'Email id required';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    isLoading
                        ? Center(child: CircularProgressIndicator())
                        : PrimaryButton("Update Profile",
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                request.putIfAbsent(
                                    "id",
                                    () =>
                                        FirebaseAuth.instance.currentUser!.uid);
                                var response = await value.saveDetails(request);
                                if (!response.haserror) {
                                  NavigationService.changeScreenRemoveOther(context, HomePage());
                                } else {
                                }
                              }
                            },
                          )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
