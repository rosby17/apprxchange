// ignore_for_file: file_names
// import 'package:flutter/services.dart';
// import 'package:http/http.dart';
// import 'package:web3dart/web3dart.dart';
// import 'package:flutter/material.dart';
// import 'package:rx_change_3/palette.dart';

// class TheAction extends StatefulWidget {
//   const TheAction({Key? key}) : super(key: key);

//   @override
//   State<TheAction> createState() => _TheActionState();
// }

// class _TheActionState extends State<TheAction> {
//   late Client httpClient;
//   late Web3Client ethClient;

//   // String lastTransactionHash;

//   @override
//   void initState() {
//     super.initState();
//     httpClient = Client();
//     ethClient = Web3Client("http://localhost:7545", httpClient);
//   }

//   Future<DeployedContract> loadContract() async {
//     String abiCode = await rootBundle.loadString("src/artifacts/Crypto.json");
//     String contractAddress = "0x9Ad7FE97f972B93a85303d69e5cC818383ef360A";

//     final contract = DeployedContract(ContractAbi.fromJson(abiCode, "Crypto"),
//         EthereumAddress.fromHex(contractAddress));
//     return contract;
//   }

//   Future<String> submit(String functionName, List<dynamic> args) async {
//     EthPrivateKey credentials = EthPrivateKey.fromHex(
//         "23992e15fbbfad6107144641dee8bfaaf844ed9e32da602828aafbd5362609e9");

//     DeployedContract contract = await loadContract();

//     final ethFunction = contract.function(functionName);

//     var result = await ethClient.sendTransaction(
//       credentials,
//       Transaction.callContract(
//         contract: contract,
//         function: ethFunction,
//         parameters: args,
//       ),
//     );
//     return result;
//   }

//   Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
//     final contract = await loadContract();
//     final ethFunction = contract.function(functionName);
//     final data = await ethClient.call(
//         contract: contract, function: ethFunction, params: args);
//     return data;
//   }

//   Future<String> sendCoind(String targetAddressHex, int amount) async {
//     EthereumAddress address = EthereumAddress.fromHex(targetAddressHex);
//     // uint in smart contract means BigInt for us
//     var bigAmount = BigInt.from(amount);
//     // sendCoin transaction
//     var response = await submit("depositBalance", [address, bigAmount]);
//     // hash of the transaction
//     return response;
//   }

//   Future<List<dynamic>> getBalance(String targetAddressHex) async {
//     EthereumAddress address = EthereumAddress.fromHex(targetAddressHex);
//     List<dynamic> result = await query("getBalance", [address]);
//     return result;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("ACTIONS"),
//         backgroundColor: Colors.green[700],
//       ),
//       backgroundColor: kWhite,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             FutureBuilder(
//               future: getBalance("0xaBbFF4159CCDe3813B4537DDf8136cD92EB79bbE"),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return Text('You have this many MetaCoin ${snapshot.data!}');
//                 } else
//                   // ignore: curly_braces_in_flow_control_structures
//                   return const Text('Loading...');
//               },
//             ),
//             MaterialButton(
//               child: const Text("Send some MetaCoins"),
//               onPressed: () async {
//                 var result = await sendCoind(
//                     "0x2957e018f0B5964C34BFF3BD03e1B39cBbd6268B", 2);
//                 setState(() {
//                   // lastTransactionHash = result;
//                 });
//               },
//             ),
//             // Text("Last transaction hash: $lastTransactionHash"),
//             Container(
//               padding: const EdgeInsets.all(30.0),
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 children: <Widget>[
//                   Card(
//                     margin: const EdgeInsets.all(8.0),
//                     color: kVertclair,
//                     child: InkWell(
//                       onTap: () {},
//                       splashColor: kJauneclair,
//                       child: Center(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: const <Widget>[
//                             Icon(Icons.send, size: 50, color: kWhite),
//                             Text("send", style: kBodyStyleBouton3)
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Card(
//                     margin: const EdgeInsets.all(8.0),
//                     color: kVertclair,
//                     child: InkWell(
//                       onTap: () {},
//                       splashColor: kJauneclair,
//                       child: Center(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: const <Widget>[
//                             Icon(Icons.shopping_cart, size: 50, color: kWhite),
//                             Text("buy", style: kBodyStyleBouton3)
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Card(
//                     margin: const EdgeInsets.all(8.0),
//                     color: kVertclair,
//                     child: InkWell(
//                       onTap: () {},
//                       splashColor: kJauneclair,
//                       child: Center(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: const <Widget>[
//                             Icon(Icons.call_received, size: 50, color: kWhite),
//                             Text("vendre", style: kBodyStyleBouton3)
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Card(
//                     margin: const EdgeInsets.all(8.0),
//                     color: kVertclair,
//                     child: InkWell(
//                       onTap: () {},
//                       splashColor: kJauneclair,
//                       child: Center(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: const <Widget>[
//                             Icon(
//                               Icons.call_received,
//                               size: 50,
//                               color: kWhite,
//                             ),
//                             Text("Echanger", style: kBodyStyleBouton3)
//                           ],
//                         // ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
