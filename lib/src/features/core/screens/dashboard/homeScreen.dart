// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rx_change_3/src/constants/constants.dart';
import 'package:rx_change_3/src/features/core/screens/dashboard/coinCard.dart';
import 'package:rx_change_3/src/features/core/screens/screen.dart';
import 'package:rx_change_3/src/features/core/screens/profile/profil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rx_change_3/src/features/core/models/coins.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=1h'));
    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.isNotEmpty) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception("Failed to load, try again");
    }
  }

  @override
  void initState() {
    fetchCoin();
    Timer.periodic(const Duration(seconds: 10), ((timer) => fetchCoin()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var containerColor = isDark ? kBlack : kWhite;
    var buttonColor = isDark ? kVertclair : kJauneclair;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // backgroundColor: Colors.white.withOpacity(0),
        // elevation: 0,
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
                        color: Colors.red[600],
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
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverToBoxAdapter(
              child: HeaderSection(),
            ),
            const SliverToBoxAdapter(
              child: TotalBalance(),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonContainer(title: 'Envoyer', active: true, onTap: () {}),
                  ButtonContainer(
                      title: 'Recevoir', active: false, onTap: () {}),
                  ButtonContainer(
                      title: 'Convertir', active: false, onTap: () {}),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: ListView.builder(
                    itemCount: coinList.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: CoinCard(
                            change: coinList[index].change.toDouble(),
                            changePercentage:
                                coinList[index].changePercentage.toDouble(),
                            image: coinList[index].image,
                            name: coinList[index].name,
                            price: coinList[index].price.toDouble(),
                            rank: coinList[index].rank.toInt(),
                            symbol: coinList[index].symbol),
                      );
                    }),
              ),
            )
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
    return Container(
      height: 300,
      decoration: const BoxDecoration(
          color: kVertclair,
          image: DecorationImage(
            image: AssetImage('assets/images/onboarding/cryptoworld.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
          )),
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
