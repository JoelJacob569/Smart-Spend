// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:smartspend/screens/loginscreens/login.dart';
// import 'package:smartspend/utils/constants/image_strings.dart';
// import 'package:smartspend/utils/constants/sizes.dart';
// import 'package:smartspend/utils/constants/text_strings.dart';
// import 'package:smartspend/utils/custom/google_auth.dart';
// import 'package:smartspend/utils/custom/passtext.dart';

// class Signuppage extends StatefulWidget {
//   const Signuppage({super.key});

//   @override
//   State<Signuppage> createState() => _SignuppageState();
// }

// class _SignuppageState extends State<Signuppage> {
//   final namecontroller = TextEditingController();
//   final emailcontroller = TextEditingController();
//   final phonecontroller = TextEditingController();
//   final passwordcontroller = TextEditingController();
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
//                 image: DecorationImage(
//                     image: AssetImage(SImages.bg2), fit: BoxFit.cover)),
//           ),
//           Positioned(
//             top: size.height * 0.15,
//             left: size.width * 0.053,
//             child: Container(
//               height: size.height * 0.75,
//               width: size.width * 0.89,
//               decoration: BoxDecoration(
//                 color: Colors.grey.withValues(alpha: 0.5),
//                 borderRadius: BorderRadius.circular(SSizes.borderRadiusxl),
//               ),
//               child: buildsignup(),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Padding buildsignup() {
//     return Padding(
//       padding: const EdgeInsets.all(SSizes.mdsm),
//       child: Column(
//         children: [
//           const Text(
//             STexts.signUpTitle,
//             style: TextStyle(
//               fontSize: 24,
//               fontFamily: 'Gupter',
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const Text(STexts.signupsubTitle),
//           const SizedBox(height: SSizes.ssm),
//           TextFormField(
//             controller: namecontroller,
//             decoration: const InputDecoration(
//               labelText: STexts.name,
//             ),
//           ),
//           const SizedBox(height: SSizes.ssm),
//           TextFormField(
//             controller: emailcontroller,
//             decoration: const InputDecoration(
//               labelText: STexts.email,
//             ),
//           ),
//           const SizedBox(height: SSizes.ssm),
//           TextFormField(
//             controller: phonecontroller,
//             decoration: const InputDecoration(
//               labelText: STexts.phoneNo,
//             ),
//           ),
//           const SizedBox(height: SSizes.ssm),
//           PasswordTextField(
//             controller: passwordcontroller,
//             labelText: STexts.password,
//           ),
//           const SizedBox(height: SSizes.ssm),
//           ElevatedButton(
//             onPressed: () {},
//             child: const Text(STexts.signup),
//           ),
//           const SizedBox(height: SSizes.ssm),
//           const SocalSignUp(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(STexts.existing),
//               TextButton(
//                 onPressed: () {
//                   Get.to(() => const Loginpage());
//                 },
//                 child: const Text(STexts.login),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartspend/screens/loginscreens/login.dart';
import 'package:smartspend/utils/constants/image_strings.dart';
import 'package:smartspend/utils/constants/sizes.dart';
import 'package:smartspend/utils/constants/text_strings.dart';
import 'package:smartspend/utils/custom/google_auth.dart';
import 'package:smartspend/utils/custom/passtext.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _signupUser() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Save user info to Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'phone': phoneController.text.trim(),
        'uid': userCredential.user!.uid,
      });

      Get.snackbar("Success", "Signup Successful!",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white);

      Get.off(() => const Loginpage());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "Signup failed",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
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
              height: size.height * 0.75,
              width: size.width * 0.89,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(SSizes.borderRadiusxl),
              ),
              child: buildSignup(),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildSignup() {
    return Padding(
      padding: const EdgeInsets.all(SSizes.mdsm),
      child: Column(
        children: [
          const Text(
            STexts.signUpTitle,
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Gupter',
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(STexts.signupsubTitle),
          const SizedBox(height: SSizes.ssm),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(labelText: STexts.name),
          ),
          const SizedBox(height: SSizes.ssm),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(labelText: STexts.email),
          ),
          const SizedBox(height: SSizes.ssm),
          TextFormField(
            controller: phoneController,
            decoration: const InputDecoration(labelText: STexts.phoneNo),
          ),
          const SizedBox(height: SSizes.ssm),
          PasswordTextField(
            controller: passwordController,
            labelText: STexts.password,
          ),
          const SizedBox(height: SSizes.ssm),
          ElevatedButton(
            onPressed: _signupUser,
            child: const Text(STexts.signup),
          ),
          const SizedBox(height: SSizes.ssm),
          const SocalSignUp(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(STexts.existing),
              TextButton(
                onPressed: () {
                  Get.to(() => const Loginpage());
                },
                child: const Text(STexts.login),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
