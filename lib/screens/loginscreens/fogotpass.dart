// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:smartspend/screens/loginscreens/changepass.dart';
// import 'package:smartspend/utils/constants/colors.dart';
// import 'package:smartspend/utils/constants/image_strings.dart';
// import 'package:smartspend/utils/constants/sizes.dart';
// import 'package:smartspend/utils/constants/text_strings.dart';

// class Forgotpass extends StatefulWidget {
//   const Forgotpass({super.key});

//   @override
//   State<Forgotpass> createState() => _ForgotpassState();
// }

// class _ForgotpassState extends State<Forgotpass> {
//   final mycontroller = TextEditingController();

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
//               height: size.height * 0.62,
//               width: size.width * 0.89,
//               decoration: BoxDecoration(
//                 color: SColors.grey.withValues(alpha: 0.5),
//                 borderRadius: BorderRadius.circular(SSizes.borderRadiusxl),
//               ),
//               child: buildcolumn(),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Padding buildcolumn() {
//     return Padding(
//       padding: const EdgeInsets.all(SSizes.mdsm),
//       child: Column(
//         children: [
//           const Text(
//             'Enter your email',
//             style: TextStyle(
//               fontSize: SSizes.fontSizexl,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: SSizes.smd),
//           TextFormField(
//             decoration: const InputDecoration(
//               labelText: STexts.email,
//             ),
//           ),
//           const SizedBox(height: SSizes.smd),
//           ElevatedButton(
//               onPressed: () {
//                 Get.to(() => const Changepass());
//               },
//               child: const Text(STexts.verify))
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:smartspend/utils/constants/colors.dart';
// import 'package:smartspend/utils/constants/image_strings.dart';
// import 'package:smartspend/utils/constants/sizes.dart';
// import 'package:smartspend/utils/constants/text_strings.dart';

// class Forgotpass extends StatefulWidget {
//   const Forgotpass({super.key});

//   @override
//   State<Forgotpass> createState() => _ForgotpassState();
// }

// class _ForgotpassState extends State<Forgotpass> {
//   final TextEditingController mycontroller = TextEditingController();

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
//               height: size.height * 0.62,
//               width: size.width * 0.89,
//               decoration: BoxDecoration(
//                 color: SColors.grey.withValues(alpha: 0.5),
//                 borderRadius: BorderRadius.circular(SSizes.borderRadiusxl),
//               ),
//               child: buildColumn(),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Padding buildColumn() {
//     return Padding(
//       padding: const EdgeInsets.all(SSizes.mdsm),
//       child: Column(
//         children: [
//           const Text(
//             'Enter your email',
//             style: TextStyle(
//               fontSize: SSizes.fontSizexl,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: SSizes.smd),
//           TextFormField(
//             controller: mycontroller,
//             decoration: const InputDecoration(
//               labelText: STexts.email,
//             ),
//           ),
//           const SizedBox(height: SSizes.smd),
//           ElevatedButton(
//             onPressed: () => verifyEmail(),
//             child: const Text(STexts.verify),
//           ),
//         ],
//       ),
//     );
//   }

//   void verifyEmail() async {
//     String email = mycontroller.text.trim();

//     if (email.isEmpty) {
//       Get.snackbar("Error", "Please enter your email",
//           snackPosition: SnackPosition.TOP,
//           backgroundColor: Colors.red,
//           colorText: Colors.white);
//       return;
//     }

//     try {
//       await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//       Get.snackbar("Success", "Password reset link sent to your email",
//           snackPosition: SnackPosition.TOP,
//           backgroundColor: Colors.green,
//           colorText: Colors.white);
//     } catch (e) {
//       Get.snackbar(
//           "Error", "Error sending reset email. Check email and try again.",
//           snackPosition: SnackPosition.TOP,
//           backgroundColor: Colors.red,
//           colorText: Colors.white);
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:smartspend/utils/constants/colors.dart';
// import 'package:smartspend/utils/constants/image_strings.dart';
// import 'package:smartspend/utils/constants/sizes.dart';
// import 'package:smartspend/utils/constants/text_strings.dart';

// class Forgotpass extends StatefulWidget {
//   const Forgotpass({super.key});

//   @override
//   State<Forgotpass> createState() => _ForgotpassState();
// }

// class _ForgotpassState extends State<Forgotpass> {
//   final TextEditingController mycontroller = TextEditingController();

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
//               height: size.height * 0.62,
//               width: size.width * 0.89,
//               decoration: BoxDecoration(
//                 color: SColors.grey.withValues(alpha: 0.5),
//                 borderRadius: BorderRadius.circular(SSizes.borderRadiusxl),
//               ),
//               child: buildColumn(),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Padding buildColumn() {
//     return Padding(
//       padding: const EdgeInsets.all(SSizes.mdsm),
//       child: Column(
//         children: [
//           const Text(
//             'Enter your email',
//             style: TextStyle(
//               fontSize: SSizes.fontSizexl,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: SSizes.smd),
//           TextFormField(
//             controller: mycontroller,
//             decoration: const InputDecoration(
//               labelText: STexts.email,
//             ),
//           ),
//           const SizedBox(height: SSizes.smd),
//           ElevatedButton(
//             onPressed: () => verifyEmail(),
//             child: const Text(STexts.verify),
//           ),
//         ],
//       ),
//     );
//   }

//   void verifyEmail() async {
//     String email = mycontroller.text.trim();

//     if (email.isEmpty) {
//       Get.snackbar("Error", "Please enter your email",
//           snackPosition: SnackPosition.TOP,
//           backgroundColor: Colors.red,
//           colorText: Colors.white);
//       return;
//     }

//     try {
//       // Check if email exists
//       List<String> signInMethods =
//           await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

//       if (signInMethods.isEmpty) {
//         Get.snackbar("Error", "This email is not registered with the app",
//             snackPosition: SnackPosition.TOP,
//             backgroundColor: Colors.red,
//             colorText: Colors.white);
//         return;
//       }

//       // If email exists, proceed with sending reset email
//       await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//       Get.snackbar("Success", "Password reset link sent to your email",
//           snackPosition: SnackPosition.TOP,
//           backgroundColor: Colors.green,
//           colorText: Colors.white);
//     } catch (e) {
//       Get.snackbar("Error", "Error processing request. Please try again.",
//           snackPosition: SnackPosition.TOP,
//           backgroundColor: Colors.red,
//           colorText: Colors.white);
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartspend/utils/constants/colors.dart';
import 'package:smartspend/utils/constants/image_strings.dart';
import 'package:smartspend/utils/constants/sizes.dart';
import 'package:smartspend/utils/constants/text_strings.dart';

class Forgotpass extends StatefulWidget {
  const Forgotpass({super.key});

  @override
  State<Forgotpass> createState() => _ForgotpassState();
}

class _ForgotpassState extends State<Forgotpass> {
  final TextEditingController mycontroller = TextEditingController();

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
                    image: AssetImage(SImages.bg2), fit: BoxFit.cover)),
          ),
          Positioned(
            top: size.height * 0.15,
            left: size.width * 0.053,
            child: Container(
              height: size.height * 0.62,
              width: size.width * 0.89,
              decoration: BoxDecoration(
                color: SColors.grey.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(SSizes.borderRadiusxl),
              ),
              child: buildColumn(),
            ),
          )
        ],
      ),
    );
  }

  Padding buildColumn() {
    return Padding(
      padding: const EdgeInsets.all(SSizes.mdsm),
      child: Column(
        children: [
          const Text(
            'Enter your email',
            style: TextStyle(
              fontSize: SSizes.fontSizexl,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: SSizes.smd),
          TextFormField(
            controller: mycontroller,
            decoration: const InputDecoration(
              labelText: STexts.email,
            ),
          ),
          const SizedBox(height: SSizes.smd),
          ElevatedButton(
            onPressed: () => verifyEmail(),
            child: const Text(STexts.verify),
          ),
        ],
      ),
    );
  }

  void verifyEmail() async {
    String email = mycontroller.text.trim();

    if (email.isEmpty) {
      Get.snackbar("Error", "Please enter your email",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }

    try {
      // Attempt to send password reset email
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.snackbar("Success", "Password reset link sent to your email",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } on FirebaseAuthException catch (e) {
      // Check for specific error codes
      if (e.code == 'user-not-found') {
        Get.snackbar("Error", "Please enter a valid email",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      } else {
        Get.snackbar("Error", "Error sending reset email. Please try again.",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "An unexpected error occurred. Please try again.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
