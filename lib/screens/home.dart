// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:rx_change_3/screens/screen.dart';
import 'package:rx_change_3/palette.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.black12,
            radius: 100,
            child: IconButton(
              onPressed: () {
                var route = MaterialPageRoute(builder: (BuildContext context) {
                  return const Profil();
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
        title: const Text('Rxchange'),
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
                  padding: const EdgeInsets.only(right: 15.0),
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
      // backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeaderSection(),
            CryptoSection(),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            // bottomRight: Radius.circular(50),
          )),
      child: Stack(
        children: [
          Positioned(
            left: 80,
            bottom: 30,
            child: Container(
              height: size.height * 0.07,
              width: size.width * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kJauneclair,
              ),
              child: const MaterialButton(
                onPressed: null,
                child: Text(
                  "10 000\$",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: "Poppins-SemiBold",
                      fontWeight: FontWeight.w900,
                      color: kWhite),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CryptoSection extends StatelessWidget {
  const CryptoSection({Key? key}) : super(key: key);

  final List playList = const [
    {
      'imagePath': "assets/images/bitcoin.png",
      'name': "Bitcoin",
      'description': "BTC",
      'value': "\$50,675.45",
      'growth': "-6.45",
      'signe': false,
    },
    {
      'imagePath': "assets/images/ethereum.png",
      'name': "Etheureum",
      'description': "ETH",
      'value': "\$4,675.45",
      'growth': "-10.65",
      'signe': false,
    },
    {
      'imagePath': "assets/images/litecoin.png",
      'name': "Litecoin",
      'description': "LTC",
      'value': "\$109.34",
      'growth': "-2.45",
      'signe': false,
    },
    {
      'imagePath': "assets/images/ripple.png",
      'name': "Ripple",
      'description': "RXP",
      'value': "\$109.34",
      'growth': "-2.45",
      'signe': false,
    },
    {
      'imagePath': "assets/images/dogecoin.png",
      'name': "Dogecoin",
      'description': "DOG",
      'value': "\$121.56",
      'growth': "+6.45",
      'signe': true,
    },
    {
      'imagePath': "assets/images/bitcoincash.png",
      'name': "Bitcoin Cash",
      'description': "BTC Cash",
      'value': "\$6989",
      'growth': "+8.45",
      'signe': true,
    },
    {
      'imagePath': "assets/images/tether.png",
      'name': "USD TETHER",
      'description': "BTC",
      'value': "\$2375.45",
      'growth': "-28.45",
      'signe': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 40, 20, 20),
      decoration: const BoxDecoration(
        color: kWhite,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("CRYPTO",
                  style: TextStyle(
                    fontSize: 18,
                    // fontFamily: "Poppins-Medium",
                    fontWeight: FontWeight.w900,
                    color: kBlack,
                  )),
              Text(
                "Prix",
                style: TextStyle(
                    fontSize: 18,
                    //  fontFamily: "Poppins-Medium",
                    fontWeight: FontWeight.w400,
                    color: kBlack),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: playList.map((crypto) {
              // ignore: sized_box_for_whitespace
              return Container(
                  height: 80,
                  // color: Colors.green,
                  // padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Image.asset(
                        crypto['imagePath'],
                        width: 50.0,
                        height: 50.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            crypto['name'],
                            style: const TextStyle(
                                fontSize: 17,
                                fontFamily: "Poppins-Medium",
                                fontWeight: FontWeight.w800,
                                color: kBlack),
                          ),
                          const SizedBox(height: 7.0),
                          Text(
                            crypto['description'],
                            style: const TextStyle(
                                fontSize: 17,
                                // fontFamily: "Poppins-Medium",
                                fontWeight: FontWeight.w200,
                                color: kBlack),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                crypto['value'],
                                style: const TextStyle(
                                    fontSize: 17,
                                    // fontFamily: "Poppins-Medium",
                                    fontWeight: FontWeight.w500,
                                    color: kBlack),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                crypto['growth'],
                                style: TextStyle(
                                  fontSize: 17,
                                  // fontFamily: "Poppins-Medium",
                                  fontWeight: FontWeight.w200,
                                  color: crypto['signe'] ? kVertclair : kRouge,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ));
            }).toList(),
          )
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
