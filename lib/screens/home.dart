import 'package:flutter/material.dart';
import 'package:rx_change_3/screens/screen.dart';
import 'package:rx_change_3/palette.dart';

import '../widgets/bouton.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  var route =
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const profil();
                  });
                  Navigator.of(context).push(route);
                },
                icon: const Icon(
                  Icons.person,
                  color: kWhite,
                ),
              ),
            ),
          ),
          title: const Text(''),
          actions: [
            IconButton(
              onPressed: () {
                const SupportAgent();
              },
              icon: const Icon(
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
                        const Notification();
                      },
                      icon: const Icon(Icons.notifications, color: kWhite),
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
                        child: const Center(child: Text('3')),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: kWhite,
        body: SingleChildScrollView(
          child: Column(
            children: const [
              HeaderSection(),
              CryptoSection(),
            ],
          ),
        ));
  }
}

class SupportAgent extends StatelessWidget {
  const SupportAgent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
          color: kVertclair,
          image: DecorationImage(
            image: AssetImage('assets/images/cryptoworld1.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
          )),
      child: Stack(
        children: const [
          Positioned(
            left: 40,
            bottom: 10,
            child: Bouton(
                buttonName: "1000 BTC",
                couleurs: kJaunesombre,
                kcouleurs: TextStyle(
                  fontSize: 40,
                  color: kWhite,
                  fontFamily: "Poppins-SemiBold",
                  fontWeight: FontWeight.w600,
                ),
                onPressed: null),
          ),
        ],
      ),
    );
  }
}

class CryptoSection extends StatelessWidget {
  const CryptoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: kWhite,
    );
  }
}

class Notification extends StatelessWidget {
  const Notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
