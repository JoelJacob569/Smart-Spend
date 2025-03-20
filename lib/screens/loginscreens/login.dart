// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:smartspend/screens/loginscreens/fogotpass.dart';
// import 'package:smartspend/screens/loginscreens/signup.dart';
// import 'package:smartspend/screens/mainscreens/mainhome.dart';
// import 'package:smartspend/utils/constants/image_strings.dart';
// import 'package:smartspend/utils/constants/sizes.dart';
// import 'package:smartspend/utils/constants/text_strings.dart';
// import 'package:smartspend/utils/custom/google_auth.dart';
// import 'package:smartspend/utils/custom/passtext.dart';
// import 'package:smartspend/utils/validators/validation.dart';

// class Loginpage extends StatefulWidget {
//   const Loginpage({super.key});

//   @override
//   State<Loginpage> createState() => _LoginpageState();
// }

// class _LoginpageState extends State<Loginpage> {
//   final emailcontroller = TextEditingController();
//   final passcontroller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: size.height,
//             width: size.width,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(SImages.bg2),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Positioned(
//             top: size.height * 0.15,
//             left: size.width * 0.053,
//             child: Container(
//               height: size.height * 0.65,
//               width: size.width * 0.89,
//               decoration: BoxDecoration(
//                 color: Colors.grey.withValues(alpha: 0.5),
//                 borderRadius: BorderRadius.circular(SSizes.borderRadiusxl),
//               ),
//               child: buildlogin(),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Padding buildlogin() {
//     return Padding(
//       padding: const EdgeInsets.all(SSizes.mdsm),
//       child: Column(
//         children: [
//           const Text(
//             STexts.loginTitle,
//             style: TextStyle(
//               fontSize: SSizes.fontSizexxl,
//               fontFamily: 'Gupter',
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//           const Text(STexts.loginSubTitle),
//           const SizedBox(height: SSizes.smd),
//           TextFormField(
//             controller: emailcontroller,
//             validator: (value) {
//               return SValidator.validateEmail(value);
//             },
//             decoration: const InputDecoration(
//               labelText: STexts.email,
//             ),
//           ),
//           const SizedBox(height: SSizes.ssm),
//           PasswordTextField(
//             controller: passcontroller,
//             labelText: STexts.password,
//           ),
//           const SizedBox(height: SSizes.ssm),
//           ElevatedButton(
//             onPressed: () {
//               Get.to(() => const Mainhome());
//             },
//             child: const Text(STexts.login),
//           ),
//           const SizedBox(height: SSizes.ssm),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               TextButton(
//                 onPressed: () {
//                   Get.to(() => const Forgotpass());
//                 },
//                 child: const Text(STexts.forgotPassword),
//               ),
//             ],
//           ),
//           const SizedBox(height: SSizes.ssm),
//           const SocalSignUp(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(STexts.dontHave),
//               TextButton(
//                 onPressed: () {
//                   Get.to(() => const Signuppage());
//                 },
//                 child: const Text(STexts.signup),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartspend/screens/loginscreens/fogotpass.dart';
import 'package:smartspend/screens/loginscreens/signup.dart';
import 'package:smartspend/screens/mainscreens/mainhome.dart';
import 'package:smartspend/utils/constants/image_strings.dart';
import 'package:smartspend/utils/constants/sizes.dart';
import 'package:smartspend/utils/constants/text_strings.dart';
import 'package:smartspend/utils/custom/google_auth.dart';
import 'package:smartspend/utils/custom/passtext.dart';
import 'package:smartspend/utils/validators/validation.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  Future<void> loginUser() async {
    setState(() => isLoading = true);
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passcontroller.text.trim(),
      );

      // Save login state
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      Get.snackbar("Success", "Login Successful!",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white);

      // Navigate to Home Page and remove login page from stack
      Get.offAll(() => const Mainhome());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "Login Failed",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(SImages.bg2),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.15,
            left: size.width * 0.053,
            child: Container(
              height: size.height * 0.65,
              width: size.width * 0.89,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(SSizes.borderRadiusxl),
              ),
              child: buildlogin(),
            ),
          )
        ],
      ),
    );
  }

  Padding buildlogin() {
    return Padding(
      padding: const EdgeInsets.all(SSizes.mdsm),
      child: Column(
        children: [
          const Text(
            STexts.loginTitle,
            style: TextStyle(
              fontSize: SSizes.fontSizexxl,
              fontFamily: 'Gupter',
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(STexts.loginSubTitle),
          const SizedBox(height: SSizes.smd),
          TextFormField(
            controller: emailcontroller,
            validator: (value) => SValidator.validateEmail(value),
            decoration: const InputDecoration(labelText: STexts.email),
          ),
          const SizedBox(height: SSizes.ssm),
          PasswordTextField(
            controller: passcontroller,
            labelText: STexts.password,
          ),
          const SizedBox(height: SSizes.ssm),
          isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: loginUser,
                  child: const Text(STexts.login),
                ),
          const SizedBox(height: SSizes.ssm),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Get.to(() => const Forgotpass()),
                child: const Text(
                  STexts.forgotPassword,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
          const SizedBox(height: SSizes.ssm),
          const SocalSignUp(),
          const SizedBox(height: SSizes.ssm),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(STexts.dontHave),
              TextButton(
                onPressed: () => Get.to(() => const Signuppage()),
                child: const Text(STexts.signup),
              )
            ],
          )
        ],
      ),
    );
  }
}
