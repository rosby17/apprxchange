import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rx_change_3/src/constants/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:rx_change_3/src/features/core/screens/loginSignup/loginScreen.dart';
import 'package:rx_change_3/src/features/core/screens/profile/update_profil.dart';
import 'package:rx_change_3/src/features/core/screens/profile/widgets/menuSection.dart';

import '../../../../repository/authentidicationRepository.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
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
          // backgroundColor: Colors.white.withOpacity(0),
          elevation: 0,
          leading: IconButton(
              onPressed: () {}, icon: const Icon(LineAwesomeIcons.angle_left)),
          title: Center(
              child: Text(tProfil,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2)),
          actions: [
            IconButton(
                onPressed: () {
                  // AdaptiveTheme.of(context).toggleThemeMode();
                },
                icon: Icon(
                  isDark ? LineAwesomeIcons.moon : LineAwesomeIcons.sun,
                  // color: iconColor,
                ))
          ]),
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
                        child: Icon(LineAwesomeIcons.alternate_pencil,
                            size: 20.0, color: iconColor)),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(u_name, style: Theme.of(context).textTheme.headline1),
              Text(user!.email!, style: Theme.of(context).textTheme.bodyText1),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const UpdateProfil())),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: Text(tEditProfil,
                      style: Theme.of(context).textTheme.bodyText1),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              MenuSection(
                  title: 'Parametres',
                  icon: LineAwesomeIcons.cog,
                  onPress: () {}),
              MenuSection(
                  title: 'Détail de vérification',
                  icon: LineAwesomeIcons.cog,
                  onPress: () {}),
              MenuSection(
                  title: 'Politique de confidentialité',
                  icon: LineAwesomeIcons.user_check,
                  onPress: () {}),
              const Divider(),
              const SizedBox(height: 10),
              MenuSection(
                  title: 'Information',
                  icon: LineAwesomeIcons.info,
                  onPress: () {}),
              MenuSection(
                title: 'Deconnexion',
                icon: LineAwesomeIcons.alternate_sign_out,
                textColor: kVertclair,
                endIcon: false,
                onPress: () {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  auth.signOut().then((res) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (Route<dynamic> route) => false);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
