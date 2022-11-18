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
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(tEditProfil, style: Theme.of(context).textTheme.headline4),
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
                        child: const Image(image: AssetImage(tProfileImage))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: kJauneclair,
                        ),
                        child: const Icon(LineAwesomeIcons.camera,
                            size: 20.0, color: kBlack)),
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
                              backgroundColor: kJauneclair,
                              side: BorderSide.none,
                              shape: const StadiumBorder()),
                          child: const Text(tEditProfil,
                              style: TextStyle(color: kBlack)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text.rich(TextSpan(
                              text: tJoined,
                              style: TextStyle(color: kBlack),
                              children: [
                                TextSpan(
                                    text: tJoinedAt,
                                    style: TextStyle(color: kBlack)),
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
