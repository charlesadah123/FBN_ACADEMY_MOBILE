import 'dart:io';

import 'package:fbn_academy_mobile/common/Constants.dart';
import 'package:fbn_academy_mobile/common/UtilsWidgets.dart';
import 'package:fbn_academy_mobile/controllers/AuthController.dart';
import 'package:fbn_academy_mobile/controllers/UserController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/User.dart';

class ProfileScreen extends StatefulWidget {

  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker picker = ImagePicker();
  var imageUrl = "".obs;
  AUser? aUser;
  UserController userCtrl = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
      aUser = userCtrl.aUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(
          color: MyStyles.colorPrimary,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16,),
              Center(
                child: Stack(
                  children: <Widget>[
                    Obx(() {
                      return imageAvatar();
                    }),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: InkWell(
                        onTap: () async {

                          await picker.pickImage(
                            source: ImageSource.gallery,
                          ).then((value) async {
                            if (value != null) {
                              userCtrl.imageUrl.value =
                              await userCtrl.uploadUserImage(File(value!.path));

                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),

                          decoration: BoxDecoration(color: MyStyles
                              .colorPrimary, shape: BoxShape.circle),
                          child: Icon(
                            Icons.edit,
                            size: 20,
                            color: MyStyles.colorSecondary,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Text(
                'Information',
                style:
                TextStyle(color: Colors.grey.shade500,),
              ),
              const SizedBox(height: 24,),
              _buildSingleRow(
                  title: aUser!.fullName, icon: Icons.person),
              const SizedBox(height: 14,),
              Divider(),
              const SizedBox(height: 14,),
              _buildSingleRow(title: aUser!.email, icon: Icons.mail),
              const SizedBox(height: 14,),
              Divider(),
              const SizedBox(height: 14,),
              _buildSingleRow(title: aUser!.phone, icon: Icons.smartphone),
              const SizedBox(height: 14,),
              Divider(),
              const SizedBox(height: 50,),
              Center(
                child: TextButton(
                    onPressed: () async {
                      await Get.find<AuthController>().logOut();
                    },
                    child: Text("Log Out",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: MyStyles.colorPrimary,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSingleRow({String? title, IconData? icon}) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.grey.shade200,
          ),

          child: Icon(
            icon,
            color: MyStyles.colorPrimary.withOpacity(0.7),
            size: 25,
          ),
        ),
        const SizedBox(width: 16,),
        Expanded(
          child: Text(
            title!.capitalizeFirst!,
            style: TextStyle(
              color: MyStyles.colorPrimary,
              fontSize: 16,
              letterSpacing: 0.5,
            ),

          ),
        ),
      ],
    );
  }

  Widget imageAvatar(){

    return SizedBox(
        width: 140,
        height: 140,
        child: CircleAvatar(radius: 80,
          backgroundImage:
          (userCtrl.imageUrl!.value.length == 0) ?
          const AssetImage(
              'assets/images/profileUser.png') as ImageProvider<
              Object> :
          NetworkImage(userCtrl.imageUrl!.value),
        )
    );

  }

}
