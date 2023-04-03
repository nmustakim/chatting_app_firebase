import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../logic/auth.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final GlobalKey<FormState> _registrationFormKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _registrationFormKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 27, right: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 100),
                    width: 144,
                    height: 139,
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(11)),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontFamily: GoogleFonts.gochiHand().fontFamily,
                          fontSize: 44.56,
                          fontWeight: FontWeight.w400,
                          color: const Color(0XFFB6158A)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Hi, Welcome Back! 👋',
                  style: TextStyle(
                      fontFamily: GoogleFonts.manrope().fontFamily,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: const Color(0XFF000000)),
                ),
                Text(
                  'Hello again, you’ve been missed!',
                  style: TextStyle(
                      fontFamily: GoogleFonts.manrope().fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0XFF999EA1)),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'Email',
                  style: TextStyle(
                      fontFamily: GoogleFonts.manrope().fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0XFF00004D)),
                ),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                  height: 41,
                  child: Center(
                    child: TextFormField(
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.fromLTRB(13, 10, 0, 12),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: const BorderSide(color: Color(0XFFC6C6C6))),
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0XFFC6C6C6)))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email)) {
                          return 'Email is invalid';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (String? newValue) {
                        email = newValue ?? '';
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                      fontFamily: GoogleFonts.manrope().fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0XFF00004D)),
                ),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                  height: 41,
                  child: Center(
                    child: TextFormField(
                      maxLines: 1,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.fromLTRB(13, 10, 0, 12),
                          labelText: 'Please Enter Your Password',
                          // suffixIcon: Image.asset('assets/images/show.png'),

                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: const BorderSide(color: Color(0XFFC6C6C6))),
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0XFFC6C6C6)))

                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        } else if (!RegExp(r'^().{8,}$').hasMatch(password)) {
                          return 'At least 8 char needed';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (String? newValue) {
                        password = newValue ?? '';
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: const Color(0XFFCDD1E0)),
                              borderRadius: BorderRadius.circular(5)),
                          height: 20,
                          width: 20,
                          child: Checkbox(
                              value: isChecked,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              checkColor: const Color(0XFF000C14),
                              activeColor: const Color(0XFFFFFFFF),
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              }),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          'I accept all the terms and privacy policy',
                          style: TextStyle(
                              fontFamily: GoogleFonts.manrope().fontFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color:  Colors.red),
                        ),
                      ],
                    ),

                  ],
                ),
                const SizedBox(
                  height: 125,
                ),
                SizedBox(
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: const Color(0XFF351A96)),
                        onPressed: () {
                          _registrationFormKey.currentState!.save();
                          _registrationFormKey.currentState!.validate();
                          if(isChecked == true){
                            if (_registrationFormKey.currentState!.validate() == true ) {
                              Auth().registration(email, password, context);

                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                      Center(child: Text('Login failed'))));
                            }
                          }
                          else{
                            Get.snackbar(snackPosition: SnackPosition.TOP,'error','\'PLease accept the terms & privacy policy to continue');
                            
                          }

                        },
                        child: const Center(child: Text('Sign Up')))),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',
                        style: TextStyle(
                            fontFamily: GoogleFonts.manrope().fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0XFF999EA1))),
                    const SizedBox(
                      width: 9,
                    ),
                    Text('Sign In',
                        style: TextStyle(
                            fontFamily: GoogleFonts.manrope().fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0XFF160062)))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
