import 'package:flutter/material.dart';
import 'package:rx_change_3/palette.dart';
import 'package:rx_change_3/widgets/widgets.dart';

class profil extends StatelessWidget {
  const profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kVertclair,
        elevation: 0,
        title: const Text('Retour', style: kBodyStyleBouton2),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              color: kVertclair,
              child: MenuSection(),
            ),
            InfoGenerales(),
            const VerificationIdentite(),
          ],
        ),
      ),
    );
  }
}

class MenuSection extends StatelessWidget {
  MenuSection({Key? key}) : super(key: key);

  final List infoClient = [
    {
      'photo': 'assets/photoClient/client1.jpg',
      'nom': 'Mogo',
      'prenom': 'Roosevelt',
      'pseudo': 'rosby17',
      'typeDeCompte': 'Compte principal',
      'email': 'rooseveltmkr@gmail.com',
    },
    // {
    //   'photo': 'assets/photoClient/client2.jpg',
    //   'nom': 'Mogo Kamdem',
    //   'prenom': 'Roosevelt',
    //   'pseudo': 'rosby17',
    //   'typeDeCompte': 'Compte principal',
    //   'email': 'rooseveltmkr@gmail.com',
    // },
    // {
    //   'photo': 'assets/photoClient/client2.jpg',
    //   'nom': 'Mogo Kamdem',
    //   'prenom': 'Roosevelt',
    //   'pseudo': 'rosby17',
    //   'typeDeCompte': 'Compte principal',
    //   'email': 'rooseveltmkr@gmail.com',
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 100,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(70), topRight: Radius.circular(70)),
      ),
      child: Row(
        children: infoClient.map((infoClient) {
          return Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 25, top: 15),
                child: Container(
                  padding: EdgeInsets.all(5),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: kVertclair,
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(infoClient['photo']),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      infoClient['prenom'] + ' ' + infoClient['nom'],
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black87,
                        fontFamily: "Poppins-SemiBold",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      infoClient['typeDeCompte'],
                      style: TextStyle(
                        fontSize: 16,
                        color: kVertclair,
                        fontFamily: "Poppins-SemiBold",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class InfoGenerales extends StatelessWidget {
  InfoGenerales({
    Key? key,
  }) : super(key: key);

  final List infoClient = [
    {
      'photo': 'assets/photoClient/client1.jpg',
      'nom': 'Mogo',
      'prenom': 'Roosevelt',
      'pseudo': 'rosby17',
      'typeDeCompte': 'Compte principal',
      'email': 'rooseveltmkr@gmail.com',
      'document': 'Documents',
      'CNI': ''
    },
    // {
    //   'photo': 'assets/photoClient/client2.jpg',
    //   'nom': 'Mogo Kamdem',
    //   'prenom': 'Roosevelt',
    //   'pseudo': 'rosby17',
    //   'typeDeCompte': 'Compte principal',
    //   'email': 'rosbylerostiti@gmail.com',
    // 'document': 'Documents',
    // },
    // {
    //   'photo': 'assets/photoClient/client2.jpg',
    //   'nom': 'Mogo Kamdem',
    //   'prenom': 'Roosevelt',
    //   'pseudo': 'rosby17',
    //   'typeDeCompte': 'Compte principal',
    //   'email': 'lephotoshopeurpro@gmail.com',
    // 'document': 'Documents',
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.info,
                color: kVertsombre,
                size: 30,
              ),
            ),
            Text(
              'INFORMATIONS GENERALES',
              style: kBodyStyleBouton4,
            ),
          ]),
          SizedBox(
            height: 20,
          ),
          Column(
            children: infoClient.map((infoClient) {
              return Column(
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: Icon(
                        Icons.email,
                        color: kJaunesombre,
                        size: 30,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          infoClient['email'],
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black54,
                            fontFamily: "Poppins-SemiBold",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: kBlack,
                        size: 20,
                      ),
                    )
                  ]),
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: Icon(
                        Icons.file_present,
                        color: kJaunesombre,
                        size: 30,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          infoClient['document'],
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black54,
                            fontFamily: "Poppins-SemiBold",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: kBlack,
                        size: 20,
                      ),
                    )
                  ]),
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: Icon(
                        Icons.email,
                        color: kJaunesombre,
                        size: 30,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Modifier ses informations de CNI',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black54,
                            fontFamily: "Poppins-SemiBold",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: kBlack,
                        size: 20,
                      ),
                    )
                  ]),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class VerificationIdentite extends StatelessWidget {
  const VerificationIdentite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'VERIFICATION D \'IDENTITE',
          style: kBodyStyleBouton4,
        ),
        BoutonLong(
          buttonName: 'Identité validée',
          couleurs: kVertclair,
          kcouleurs: kBodyStyleBouton2,
          onPressed: null,
        ),
        SizedBox(
          height: 30,
        ),
        BoutonLong(
          buttonName: 'Selfie Validé',
          couleurs: kVertclair,
          kcouleurs: kBodyStyleBouton2,
          onPressed: null,
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          'VERIFICATION ADRESSE',
          style: kBodyStyleBouton4,
        ),
        BoutonLong(
          buttonName: 'Vérification adresse',
          couleurs: kJauneclair,
          kcouleurs: TextStyle(
            fontSize: 17,
            color: Colors.black54,
            fontFamily: "Poppins-SemiBold",
            fontWeight: FontWeight.w700,
          ),
          onPressed: null,
        ),
      ],
    );
  }
}
