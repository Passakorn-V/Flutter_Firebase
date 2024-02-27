import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboard_screen/component/my_button.dart';
import 'package:onboard_screen/component/my_textfield.dart';
import 'package:onboard_screen/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();

  final emailController = TextEditingController(); 

  final passwordController = TextEditingController(); 

  final repasswordController = TextEditingController(); 


  signUpWithEmail() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      _showMyDialog(' Created Success ');
    } 

    on FirebaseAuthException catch (e) {
      print(' Failed with error code : ${e.code} ');
      print(e.message);
    }
}
  void _showMyDialog(String txtMsg) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            backgroundColor: Colors.amberAccent,
            title: const Text('AlertDialog Title'),
            content: Text(txtMsg),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
          ),
        );
      },
    );
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/S1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          child: Column(
            children: [
              const Spacer(),
              Text(
                'Welcome To Our Restaurant',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),              
              ),
              Text(
                '\nCreate Your Account to Log In \n',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),              
              ),

              const SizedBox(height: 20,),

              MyTextField(
                controller: nameController,
                hintText: 'Enter Your Name',
                obsurceText: false,
                labelText: 'Name',
              ),

              const SizedBox(height: 20,),

              MyTextField(
                controller: emailController,
                hintText: 'Enter Your Email',
                obsurceText: false,
                labelText: 'Email',
              ),

              const SizedBox(height: 20,),

              MyTextField(
                controller: passwordController,
                hintText: 'Enter Your Password',
                obsurceText: true,
                labelText: 'Password',
              ),

              const SizedBox(height: 20,),

              MyTextField(
                controller: repasswordController,
                hintText: 'Enter Your Password Again',
                obsurceText: true,
                labelText: 'Re-Password',
              ),    

              const SizedBox(height: 20,),

              MyButton(onTap: signUpWithEmail, hinText: 'Register'),    
                const SizedBox(
                  height: 20,
                ), 

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have a member ?',
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.displayMedium,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  const SizedBox(
                    width: 1,
                  ),
                    
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        color: Colors.blue,
                      ),
                    ),
                  ),         
                ],
              ),


              const Spacer(),

            ],
          ) 
        ),
      )
    );
  }
}