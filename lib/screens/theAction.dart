import 'package:flutter/material.dart';

import '../palette.dart';

class TheAction extends StatefulWidget {
  const TheAction({Key? key}) : super(key: key);

  @override
  State<TheAction> createState() => _TheActionState();
}

class _TheActionState extends State<TheAction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ACTIONS"),
        backgroundColor: Colors.green[700],
      ),
      backgroundColor: kWhite ,
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: GridView.count(crossAxisCount: 2, children: <Widget> [
          Card(
            margin: const EdgeInsets.all(8.0),
            color: kVertclair,
            child: InkWell(
              onTap: (){},
              splashColor: kJauneclair,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget> [
                    Icon(Icons.call_received, size: 50, color: kWhite ),
                    Text("Receiver", style: kBodyStyleBouton3)
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8.0),
            color: kVertclair,
            child: InkWell(
              onTap: (){},
              splashColor: kJauneclair,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget> [
                    Icon(Icons.send, size: 50, color: kWhite ),
                    Text("send", style: kBodyStyleBouton3)
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8.0),
            color: kVertclair,
            child: InkWell(
              onTap: (){},
              splashColor: kJauneclair,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget> [
                    Icon(Icons.shopping_cart, size: 50, color: kWhite ),
                    Text("buy", style: kBodyStyleBouton3 )
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8.0),
            color: kVertclair,
            child: InkWell(
              onTap: (){},
              splashColor: kJauneclair,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget> [
                    Icon(Icons.call_received, size: 50, color: kWhite ),
                    Text("vendre", style: kBodyStyleBouton3)
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8.0),
            color: kVertclair,
            child: InkWell(
              onTap: (){},
              splashColor: kJauneclair,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget> [
                    Icon(Icons.call_received, size: 50, color: kWhite ),
                    Text("Gagner", style: kBodyStyleBouton3)
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8.0),
            color: kVertclair,
            child: InkWell(
              onTap: (){},
              splashColor: kJauneclair,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget> [
                    Icon(Icons.call_received, size: 50, color: kWhite,),
                    Text("Echanger", style: kBodyStyleBouton3)
                  ],
                ),
              ),
            ),
          ),Card(
            margin: const EdgeInsets.all(8.0),
            color: kVertclair,
            child: InkWell(
              onTap: (){},
              splashColor: kJauneclair,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget> [
                    Icon(Icons.scanner, size: 50, color: kWhite ),
                    Text("connecter", style: kBodyStyleBouton3)
                  ],
                ),
              ),
            ),
          )
        ],),
      ),
    );
  }
}


