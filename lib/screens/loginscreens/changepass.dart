// import 'package:flutter/material.dart';
// import 'package:smartspend/utils/constants/colors.dart';
// import 'package:smartspend/utils/constants/image_strings.dart';
// import 'package:smartspend/utils/constants/sizes.dart';
// import 'package:smartspend/utils/constants/text_strings.dart';

// class Changepass extends StatefulWidget {
//   const Changepass({super.key});

//   @override
//   State<Changepass> createState() => _ChangepassState();
// }

// class _ChangepassState extends State<Changepass> {
//   final newcontroller = TextEditingController();
//   final confirmcontroller = TextEditingController();
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
//               child: buildpadding(),
//             ),
//           )
//         ],
//       ),
//     );
//   }

// ignore_for_file: deprecated_member_use

//   Padding buildpadding() {
//     return Padding(
//       padding: const EdgeInsets.all(SSizes.mdsm),
//       child: Column(
//         children: [
//           const Text(
//             STexts.crnewPassword,
//             style: TextStyle(
//               fontSize: SSizes.fontSizexl,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: SSizes.mdsm),
//           TextFormField(
//             controller: newcontroller,
//             decoration: const InputDecoration(
//               labelText: STexts.newPassword,
//             ),
//           ),
//           const SizedBox(height: SSizes.mdsm),
//           TextFormField(
//             controller: confirmcontroller,
//             decoration: const InputDecoration(
//               labelText: STexts.conPassword,
//             ),
//           ),
//           const SizedBox(height: SSizes.mdsm),
//           ElevatedButton(onPressed: () {}, child: const Text(STexts.submit))
//         ],
//       ),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartspend/utils/constants/colors.dart';
import 'package:smartspend/utils/constants/image_strings.dart';
import 'package:smartspend/utils/constants/sizes.dart';
import 'package:smartspend/utils/constants/text_strings.dart';

class Changepass extends StatefulWidget {
  final String email;

  const Changepass({super.key, required this.email});

  @override
  State<Changepass> createState() => _ChangepassState();
}

class _ChangepassState extends State<Changepass> {
  final TextEditingController newcontroller = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
                  image: AssetImage(SImages.bg2), fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: size.height * 0.15,
            left: size.width * 0.053,
            child: Container(
              height: size.height * 0.62,
              width: size.width * 0.89,
              decoration: BoxDecoration(
                color: SColors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(SSizes.borderRadiusxl),
              ),
              child: buildpadding(),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildpadding() {
    return Padding(
      padding: const EdgeInsets.all(SSizes.mdsm),
      child: Column(
        children: [
          const Text(
            STexts.crnewPassword,
            style: TextStyle(
              fontSize: SSizes.fontSizexl,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: SSizes.mdsm),
          TextFormField(
            controller: newcontroller,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: STexts.newPassword,
            ),
          ),
          const SizedBox(height: SSizes.mdsm),
          TextFormField(
            controller: confirmcontroller,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: STexts.conPassword,
            ),
          ),
          const SizedBox(height: SSizes.mdsm),
          ElevatedButton(
            onPressed: resetPassword,
            child: const Text(STexts.submit),
          ),
        ],
      ),
    );
  }

  void resetPassword() async {
    String newPassword = newcontroller.text.trim();
    String confirmPassword = confirmcontroller.text.trim();

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar("Error", "Please fill all fields",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }

    if (newPassword != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }

    try {
      User? user = _auth.currentUser;

      if (user == null) {
        // Sign in the user with email before updating password
        List<String> signInMethods =
            await _auth.fetchSignInMethodsForEmail(widget.email);

        if (signInMethods.contains("password")) {
          AuthCredential credential = EmailAuthProvider.credential(
            email: widget.email,
            password:
                newPassword, // Temporary authentication for re-authentication
          );

          await user?.reauthenticateWithCredential(credential);
          await user?.updatePassword(newPassword);
          Get.snackbar("Success", "Password changed successfully",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white);
          Get.offAllNamed(
              "/login"); // Navigate to login screen after password reset
        } else {
          Get.snackbar("Error", "Unable to verify email",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white);
        }
      } else {
        await user.updatePassword(newPassword);
        Get.snackbar("Success", "Password changed successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
        Get.offAllNamed("/login"); // Navigate to login screen
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to change password. Try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
