import 'package:chatting_app/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth/auth.dart';



class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _loginFormKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 27, right: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40,),
                const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 44.56,
                        fontWeight: FontWeight.w400,
                        color: Color(0XFFB6158A)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Hi, Welcome Back! 👋',
                  style: TextStyle(

                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0XFF000000)),
                ),
                const Text(
                  'Hello again, you’ve been missed!',
                  style: TextStyle(

                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0XFF999EA1)),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Email',
                  style: TextStyle(

                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0XFF00004D)),
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


                      onSaved: (String? newValue) {
                        email = newValue ?? '';
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Password',
                  style: TextStyle(

                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0XFF00004D)),
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

                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: const BorderSide(color: Color(0XFFC6C6C6))),
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0XFFC6C6C6)))

                      ),
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
                        const Text(
                          'Remember Me',
                          style: TextStyle(

                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0XFF000000)),
                        ),
                      ],
                    ),
                    const Text('Forgot Password',
                        style: TextStyle(

                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0XFFFB344F))),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                SizedBox(
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: const Color(0XFF351A96)),
                        onPressed: () {
                          _loginFormKey.currentState!.save();
                          Auth().signIn(email, password, context);

                          }
                        ,
                        child: const Center(child: Text('Login')))),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?',
                        style: TextStyle(

                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0XFF999EA1))),
                    const SizedBox(
                      width: 9,
                    ),
                    InkWell(
                      onTap:(){Get.to( const Registration());},
                      child: const Text('Sign Up',
                          style: TextStyle(

                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0XFF160062))),
                    )
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
