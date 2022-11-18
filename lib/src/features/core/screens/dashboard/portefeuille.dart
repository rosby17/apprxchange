import 'package:flutter/material.dart';
import 'package:rx_change_3/src/features/core/models/blockchain_utils/ethereum_utils.dart';
import 'package:rx_change_3/src/constants/constants.dart';

class Portefeuille extends StatefulWidget {
  const Portefeuille({super.key});

  @override
  State<Portefeuille> createState() => _PortefeuilleState();
}

class _PortefeuilleState extends State<Portefeuille> {
  EthereumUtils ethUtils = EthereumUtils();

  // ignore: prefer_final_fields
  double? _value = 0.0;

  // ignore: prefer_typing_uninitialized_variables
  var _data;

  @override
  void initState() {
    ethUtils.initial();
    ethUtils.getBalance().then((value) {
      _data = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 130),
      // child: Column(
      //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     Container(
      //       width: MediaQuery.of(context).size.width,
      //       height: MediaQuery.of(context).size.height * 0.13,
      //       decoration: BoxDecoration(
      //         color: kVertclair,
      //         borderRadius: BorderRadius.circular(10),
      //       ),
      //       child: Center(
      //         child: Padding(
      //           padding:
      //               const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //           child: Column(children: [
      //             const Text('Solde Principal',
      //                 style: TextStyle(
      //                   fontSize: 20,
      //                   color: kWhite,
      //                   fontFamily: "Poppins-Medium",
      //                   fontWeight: FontWeight.w700,
      //                 )),
      //             const SizedBox(
      //               height: 9,
      //             ),
      //             _data == null
      //                 ? const CircularProgressIndicator()
      //                 : Text("$_data USD",
      //                     style: const TextStyle(
      //                       fontSize: 20,
      //                       color: kWhite,
      //                       fontFamily: "Poppins-Medium",
      //                       fontWeight: FontWeight.w300,
      //                     )),
      //           ]),
      //         ),
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 20,
      //     ),
      //     SfSlider(
      //       value: _value,
      //       onChanged: (value) {
      //         setState(() {
      //           _value = value;
      //         });
      //       },
      //       interval: 1,
      //       activeColor: kVertclair,
      //       enableTooltip: true,
      //       stepSize: 1.0,
      //       showLabels: true,
      //       min: 0.0,
      //       max: 10.0,
      //     ),
      //     const SizedBox(
      //       height: 50,
      //     ),
      //     ButtonContainer(
      //         title: "Voir le solde ",
      //         color: kJauneclair,
      //         onTap: () {
      //           ethUtils.getBalance().then((value) {
      //             _data = value;
      //             setState(() {});
      //           });
      //         }),
      //     const SizedBox(
      //       height: 50,
      //     ),
      //     ButtonContainer(
      //         title: "Envoyer",
      //         color: Colors.blue,
      //         onTap: () async {
      //           await ethUtils.sendBalance(_value!.toInt());
      //           if (_value == 0) {
      //             // ignore: use_build_context_synchronously
      //             incorrectValueDialogBox(context);
      //           } else {
      //             // ignore: use_build_context_synchronously
      //             sendDialogBox(context);
      //           }
      //         }),
      //     const SizedBox(
      //       height: 50,
      //     ),
      //     ButtonContainer(
      //         title: "Retirer",
      //         color: Colors.deepOrange,
      //         onTap: () async {
      //           await ethUtils.witdhDrawBalance(_value!.toInt());
      //           if (_value == 0) {
      //             // ignore: use_build_context_synchronously
      //             incorrectValueDialogBox(context);
      //           } else {
      //             // ignore: use_build_context_synchronously
      //             withDrawDialogBox(context);
      //           }
      //         })
      //   ],
      // ),
    );
  }
}

incorrectValueDialogBox(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'invalide Value',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          content: const Text(
            'Veuilez entrer une valeur superieure à 0',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kBlackS,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: (() {
                Navigator.of(context).pop();
              }),
              child: const Text('OK'),
            )
          ],
        );
      });
}

sendDialogBox(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Merci pour votre envoi',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: (() {
                Navigator.of(context).pop();
              }),
              child: const Text('Retour'),
            )
          ],
        );
      });
}

withDrawDialogBox(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Merci pour votre retrait',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: (() {
                Navigator.of(context).pop();
              }),
              child: const Text('Retour'),
            )
          ],
        );
      });
}
