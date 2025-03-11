import 'package:flutter/material.dart';
import 'package:smartspend/utils/constants/colors.dart';
import 'package:smartspend/utils/constants/image_strings.dart';
import 'package:smartspend/utils/constants/sizes.dart';
import 'package:smartspend/utils/helpers/helper_functions.dart';

class Profileedit extends StatefulWidget {
  const Profileedit({super.key});

  @override
  State<Profileedit> createState() => _ProfileeditState();
}

class _ProfileeditState extends State<Profileedit> {
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    final darkmatter = SHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit your profile'),
        iconTheme: IconThemeData(color: dark ? SColors.white : SColors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(SSizes.sm),
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: SColors.blue,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 90,
                    bottom: 0,
                    right: 2,
                    left: 2,
                    child: GestureDetector(
                      onTap: () {
                        showbottomsheet();
                      },
                      child: Container(
                        height: 20,
                        width: 137,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(618),
                            bottomRight: Radius.circular(618),
                          ),
                          color: SColors.black.withValues(alpha: 0.5),
                        ),
                        child: Icon(
                          Icons.photo_camera_outlined,
                          color: darkmatter ? SColors.white : SColors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: SSizes.smd),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: SSizes.smd),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: SSizes.smd),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            const SizedBox(height: SSizes.smd),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }

  void showbottomsheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 100,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(SSizes.mdsm),
                child: Column(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(SImages.files),
                        ),
                      ),
                    ),
                    const Text('Files')
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera,
                      size: 50,
                    ),
                  ),
                  const Text('Camera')
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
