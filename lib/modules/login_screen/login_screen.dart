import 'package:all_my_apps/shared/components/components.dart';
import 'package:flutter/material.dart';

class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {

  var email = TextEditingController();

  var pass = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login design',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  defaultTextForm(
                    control: email,
                    type: TextInputType.emailAddress,
                    lable: 'Email',
                    prefix: Icons.email,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'email must not be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultTextForm(
                    control: pass,
                    type: TextInputType.visiblePassword,
                    lable: 'password',
                    prefix: Icons.lock,
                    validate: (String value){
                      if(value.isEmpty) {
                        return 'password is very short' ;
                      }
                      return null;
                    },
                    suffix: isPass? Icons.visibility : Icons.visibility_off,
                    suffixPressed: (){
                      setState(() {
                        isPass=!isPass;
                      });
                    },
                    isPassword: isPass,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    fun: () {
                      if (formKey.currentState!.validate()) {
                        print(email.text);
                        print(pass.text);
                      }
                    },
                    text: 'login',
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Don\'t have an account ?',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'REGISTER NOW',
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
