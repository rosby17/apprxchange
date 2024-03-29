import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rx_change_3/palette.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
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
            const InfoGenerales(),
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
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 100,
      decoration: const BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(70), topRight: Radius.circular(70)),
      ),
      child: Row(
        children: infoClient.map((infoClient) {
          return Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 25, top: 15),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
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
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black87,
                        fontFamily: "Poppins-SemiBold",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      infoClient['typeDeCompte'],
                      style: const TextStyle(
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

class InfoGenerales extends StatefulWidget {
  const InfoGenerales({super.key});

  @override
  State<InfoGenerales> createState() => _InfoGeneralesState();
}

class _InfoGeneralesState extends State<InfoGenerales> {
  @override
  Widget build(BuildContext context) {
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
    ];
    final user = FirebaseAuth.instance.currentUser!;
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(children: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
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
          const SizedBox(
            height: 20,
          ),
          Column(
            children: infoClient.map((infoClient) {
              return Column(
                children: [
                  Row(children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 6.0),
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
                          user.email!,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black54,
                            fontFamily: "Poppins-SemiBold",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: kBlack,
                        size: 20,
                      ),
                    )
                  ]),
                  Row(children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 6.0),
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
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black54,
                            fontFamily: "Poppins-SemiBold",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: kBlack,
                        size: 20,
                      ),
                    )
                  ]),
                  Row(children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 6.0),
                      child: Icon(
                        Icons.email,
                        color: kJaunesombre,
                        size: 30,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
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
          MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            color: kJauneclair,
            child: const Text('Se deconnecter'),
          ),
        ],
      ),
    );
  }
}
