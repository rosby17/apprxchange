import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:rx_change_3/src/common_widgets/widgets.dart';
import 'package:rx_change_3/src/features/core/screens/profile/profil.dart';

import '../../../../constants/constants.dart';

class UpdateProfil extends StatefulWidget {
  const UpdateProfil({super.key});

  @override
  State<UpdateProfil> createState() => _UpdateProfilState();
}

class _UpdateProfilState extends State<UpdateProfil> {
  bool? created;
  var balance;
  var credentials;
  int myAmount = 5;
  var pro_pic;
  var u_name;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? kWhite : kBlack;
    var buttonColor = isDark ? kVertclair : kJauneclair;

    final user = FirebaseAuth.instance.currentUser;
    if (user?.photoURL == null) {
      pro_pic = "assets/images/roosevelt.jpg";
    } else {
      pro_pic = user!.photoURL;
    }
    if (user?.displayName == null) {
      u_name = "User Name";
    } else {
      u_name = user!.displayName;
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(tEditProfil,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(pro_pic), scale: 0.1))),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: buttonColor,
                        ),
                        child: Icon(LineAwesomeIcons.camera,
                            size: 20.0, color: iconColor)),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Form(
                child: Column(
                  children: [
                    const TextInputField(
                      icon: Icons.person,
                      hint: 'nom',
                      inputAction: TextInputAction.done,
                      inputType: TextInputType.text, controller: null,
                      // controller: nameController,
                    ),
                    const SizedBox(height: 10),
                    const TextInputField(
                      icon: Icons.person,
                      hint: 'prenom',
                      inputAction: TextInputAction.done,
                      inputType: TextInputType.text,
                      // controller: lastNameController,
                    ),
                    const SizedBox(height: 10),
                    const TextInputField(
                      icon: Icons.person,
                      hint: 'username',
                      inputAction: TextInputAction.done,
                      inputType: TextInputType.text,
                      // controller: userNameController,
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const UpdateProfil())),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor,
                              side: BorderSide.none,
                              shape: const StadiumBorder()),
                          child: Text(tEditProfil,
                              style: Theme.of(context).textTheme.bodyText1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(TextSpan(
                              text: tJoined,
                              style: Theme.of(context).textTheme.bodyText1,
                              children: [
                                TextSpan(
                                    text: tJoinedAt,
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ])),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const Profil())),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.withOpacity(0.1),
                                elevation: 0,
                                side: BorderSide.none,
                                shape: const StadiumBorder()),
                            child: const Text(tDelete,
                                style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
