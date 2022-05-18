import 'package:flutter/material.dart';
import 'package:rx_change_3/screens/screen.dart';
import 'package:rx_change_3/widgets/widgets.dart';
import 'package:rx_change_3/palette.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kVertclair,
        elevation: 0.1,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.black12,
            radius: 100,
            child: IconButton(
              onPressed: () {
                var route = MaterialPageRoute(builder: (BuildContext context) {
                  return profil();
                });
                Navigator.of(context).push(route);
              },
              icon: Icon(
                Icons.person,
                color: kWhite,
              ),
            ),
          ),
        ),
        title: Text(''),
        actions: [
          IconButton(
            onPressed: () {
              SupportAgent();
            },
            icon: Icon(
              Icons.support_agent_rounded,
              color: kWhite,
            ),
          ),
          SizedBox(
            width: 30.0,
            height: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () {
                      Notification();
                    },
                    icon: Icon(Icons.notifications, color: kWhite),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 15.0,
                      height: 15.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: kRouge,
                      ),
                      child: Center(child: Text('3')),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 25),
                CarouselSlide(),
                SizedBox(height: 25),
                Container(
                  height: size.height * 0.12,
                  padding: const EdgeInsets.only(top: 6.0),
                  decoration: BoxDecoration(
                      // color: Colors.black12,
                      ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        carreBoutton(
                          couleur: kVertsombre,
                          text: 'Achat',
                          icone: Icon(
                            Icons.money_off_sharp,
                            color: kWhite,
                            size: 40,
                          ),
                        ),
                        carreBoutton(
                          couleur: kRouge,
                          text: 'Vente',
                          icone: Icon(
                            Icons.sell,
                            color: kWhite,
                            size: 40,
                          ),
                        ),
                        carreBoutton(
                          couleur: kJaunesombre,
                          text: 'Envoyer',
                          icone: Icon(
                            Icons.file_upload,
                            color: kWhite,
                            size: 40,
                          ),
                        ),
                        carreBoutton(
                          couleur: Colors.blue,
                          text: 'Recevoir',
                          icone: Icon(
                            Icons.file_download,
                            color: kWhite,
                            size: 40,
                          ),
                        ),
                        carreBoutton(
                          couleur: kViolet,
                          text: 'Convertir',
                          icone: Icon(
                            Icons.stay_current_landscape,
                            color: kWhite,
                            size: 40,
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: size.height * 0.35,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: kViolet,
                    gradient: RG(),

                    // image: DecorationImage(
                    // image: AssetImage("assets/images/rxchange_2blanc.png"),
                    // fit: BoxFit.fill,
                    // colorFilter:
                    //     ColorFilter.mode(kVertsombre, BlendMode.darken),
                    // ),
                  ),
                  child: Container(
                    height: size.height * 0.15,
                    width: size.width * 0.30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/parrainage.png"),
                        // fit: BoxFit.fill,
                      ),
                      color: kWhite,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: size.height * 0.15,
                            width: size.width * 0.30,
                            decoration: BoxDecoration(
                              // image: DecorationImage(
                              //   image: AssetImage(
                              //       "assets/images/parrainage_2.png"),
                              //   fit: BoxFit.fill,
                              // ),
                              color: kWhite,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: size.height * 0.20,
                          width: size.width * 0.65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            // gradient: LinearGradient(
                            //   end: Alignment.topCenter,
                            //   begin: Alignment.bottomRight,
                            //   colors: [kVertsombre, Colors.transparent],
                            // ),
                            color: Colors.black87,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  width: 180,
                                  decoration: BoxDecoration(
                                    color: kJaunesombre,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                      child: Bouton(
                                    buttonName: 'Inviter un amis',
                                    couleurs: kJaunesombre,
                                    kcouleurs: kBodyStyle,
                                    onPressed: () {},
                                  )),
                                ),
                              ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  "Gagnez 15% de commission pour chaque fileuls qui s'inscrit sur RXchange via votre lien de parainnage",
                                  style: kStylepetittexte,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SupportAgent extends StatelessWidget {
  const SupportAgent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Notification extends StatelessWidget {
  const Notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
