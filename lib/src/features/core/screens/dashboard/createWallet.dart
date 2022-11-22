// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rx_change_3/src/features/core/screens/dashboard/firestore.dart';
import 'package:rx_change_3/src/features/core/screens/dashboard/actions.dart';
import 'package:rx_change_3/src/features/core/screens/dashboard/walletCreation.dart';

class CreateWallet extends StatefulWidget {
  const CreateWallet({Key? key}) : super(key: key);

  @override
  State<CreateWallet> createState() => _CreateWallet();
}

class _CreateWallet extends State<CreateWallet> {
  int? selected;
  String? pubAddress;
  String? privAddress;
  String? username;

  @override
  void initState() {
    //  TODO implement initState
    super.initState();
    details();
  }

  details() async {
    dynamic data = await getUserDetails();
    data != null
        ? setState(() {
            privAddress = data['privateKey'];
            pubAddress = data['publicKey'];
            username = data['user_name'];
            bool created = data['wallet_created'];
            created == true ? selected = 1 : selected = 0;
          })
        : setState(() {
            selected = 0;
          });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.backspace),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          selected == 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: Text("Creer un portefeuille",
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                    Container(
                        margin: const EdgeInsets.all(20),
                        child: ElevatedButton(
                          child: const Icon(Icons.add),
                          onPressed: () async {
                            setState(() {
                              selected = 1;
                            });
                            WalletAddress service = WalletAddress();
                            final mnemonic = service.generateMnemonic();
                            final privateKey =
                                await service.getPrivateKey(mnemonic);
                            final publicKey =
                                await service.getPublicKey(privateKey);
                            privAddress = privateKey;
                            pubAddress = publicKey.toString();
                            addUserDetails(privateKey, publicKey);
                          },
                        ))
                  ],
                )
              : Column(
                  children: [
                    Center(
                        child: Container(
                      margin: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blueAccent,
                      child: const Text(
                        "Opération réussi !!!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    )),
                    const Center(
                      child: Text(
                        "Wallet Private Address :",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "$privAddress",
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Ne jamais la communiquer à quelqu'un!",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const Divider(),
                    const Center(
                      child: Text(
                        "votre Addresse publique: ",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "$pubAddress",
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                    const Divider(),
                    Center(
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const TheActions())),
                        child: const Text(
                          "Retour au portefeuille!",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
