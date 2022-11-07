import 'package:flutter/material.dart';
import 'package:rx_change_3/palette.dart';
import 'package:rx_change_3/screens/screen.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  late List<BottomNavigationBarItem> _item;
  int _id = 0;
  static List<Widget> pageOptions = <Widget>[
    const Home(),
    // const TheAction(),
    const Market(),
    const Actualites(),
    Portefeuille(),
  ];

  @override
  void initState() {
    super.initState();
    _item = [];
    _item.add(
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Accueil",
      ),
    );
    _item.add(
      const BottomNavigationBarItem(
        icon: Icon(Icons.compare_arrows_outlined),
        label: "Actions",
      ),
    );
    _item.add(
      const BottomNavigationBarItem(
        icon: Icon(Icons.auto_graph_sharp),
        label: "Historique",
      ),
    );
    // _item.add(
    // const BottomNavigationBarItem(
    //   icon: Icon(Icons.pages_outlined),
    //    label: "Actualité",
    //   ),
    // );
    _item.add(
      const BottomNavigationBarItem(
        icon: Icon(Icons.account_balance_wallet),
        label: "Portefeuille",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Center(
        child: pageOptions.elementAt(_id),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: _item,
          currentIndex: _id,
          selectedItemColor: kJaunesombre,
          unselectedItemColor: Colors.black54,
          // backgroundColor: kVertsombre,
          // fixedColor: kVertsombre,
          // type: BottomNavigationBarType.fixed,

          onTap: (int item) {
            setState(() {
              _id = item;

              //   var route = MaterialPageRoute(builder: (BuildContext context) {
              //     return Market();
              //   });
              //   Navigator.of(context).push(route);
            });
            // showSelectedLabels: false,
            // showUnselectedLabels: false,
          }),
    );
  }
}
