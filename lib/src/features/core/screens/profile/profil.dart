import 'package:flutter/material.dart';
import 'package:rx_change_3/src/constants/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:rx_change_3/src/features/core/screens/profile/update_profil.dart';
import 'package:rx_change_3/src/features/core/screens/profile/widgets/menuSection.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {}, icon: const Icon(LineAwesomeIcons.angle_left)),
          title: Text(tProfil, style: Theme.of(context).textTheme.headline4),
          actions: [
            IconButton(
                onPressed: () {},
                icon:
                    Icon(isDark ? LineAwesomeIcons.moon : LineAwesomeIcons.sun))
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
                        child: const Icon(LineAwesomeIcons.alternate_pencil,
                            size: 20.0, color: kBlackS)),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(tProfilHeading,
                  style: Theme.of(context).textTheme.headline4),
              Text(tProfilSubHeading,
                  style: Theme.of(context).textTheme.bodyText1),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const UpdateProfil())),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kJauneclair,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child:
                      const Text(tEditProfil, style: TextStyle(color: kBlack)),
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
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
