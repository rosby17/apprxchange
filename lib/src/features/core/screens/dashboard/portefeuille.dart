import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:rx_change_3/src/features/core/models/blockchain_utils/ethereum_utils.dart';
import 'package:rx_change_3/src/constants/constants.dart';
import 'package:rx_change_3/src/features/core/screens/dashboard/coinCard.dart';
import 'package:rx_change_3/src/features/core/screens/dashboard/createWallet.dart';
import 'package:rx_change_3/src/features/core/screens/dashboard/firestore.dart';
import 'package:rx_change_3/src/features/core/screens/dashboard/widgetDashboard/totalBalance.dart';
import 'package:web3dart/web3dart.dart';

import '../../../../common_widgets/buttonContainer.dart';
import '../../models/coins.dart';

class Portefeuille extends StatefulWidget {
  const Portefeuille({super.key});

  @override
  State<Portefeuille> createState() => _PortefeuilleState();
}

class _PortefeuilleState extends State<Portefeuille> {
  late Client httpClient;
  late Web3Client ethClient;
  String privAddress =
      "4178eee52c8f4361215dbb8a0eed120020419d9cfe6960adbfb1c60ff11d16a8";
  EthereumAddress targetAddress =
      EthereumAddress.fromHex("0x99DAE08Fc11c01350BD2e5799a76B2931c3fA002");
  bool? created;
  var balance;
  var credentials;
  int myAmount = 5;
  var pro_pic;
  var u_name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    httpClient = Client();
    ethClient = Web3Client("HTTP://192.168.43.159:7545", httpClient);
    details();
  }

  details() async {
    dynamic data = await getUserDetails();
    data != null
        ? setState(() {
            privAddress = data['privateKey'];
            var publicAdress = data['publicKey'];
            var temp = EthPrivateKey.fromHex(privAddress);
            credentials = temp.address;
            // EthPrivateKey fromHex = EthPrivateKey.fromHex(privAddress);
            // final password = FirebaseAuth.instance.currentUser!.uid;
            // Random random=Random.secure();
            // Wallet wallet = Wallet.createNew(fromHex, password,random);
            // print(wallet.toJson());
            created = data['wallet_created'];
            balance = getBalance(credentials);
          })
        : print("Data is NULL!");
  }

  Future<DeployedContract> loadContract() async {
    String abi = await rootBundle.loadString("src/artifacts/Crypto.json");
    String contractAddress = "0xF1744cAeE3E7998F236B4a08438D1718F7E00771";
    final contract = DeployedContract(ContractAbi.fromJson(abi, "Gold"),
        EthereumAddress.fromHex(contractAddress));
    return contract;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    final contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.call(
        contract: contract, function: ethFunction, params: args);
    return result;
  }

  Future<void> getBalance(EthereumAddress credentialAddress) async {
    List<dynamic> result = await query("balanceOf", [credentialAddress]);
    var data = result[0];
    setState(() {
      balance = data;
    });
  }

  Future<String> sendCoin() async {
    var bigAmount = BigInt.from(myAmount);
    var response = await submit("transfer", [targetAddress, bigAmount]);
    return response;
  }

  Future<String> submit(String functionName, List<dynamic> args) async {
    DeployedContract contract = await loadContract();
    final ethFunction = contract.function(functionName);
    EthPrivateKey key = EthPrivateKey.fromHex(privAddress);
    Transaction transaction = await Transaction.callContract(
        contract: contract,
        function: ethFunction,
        parameters: args,
        maxGas: 100000);
    print(transaction.nonce);
    final result =
        await ethClient.sendTransaction(key, transaction, chainId: 4);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var containerColor = isDark ? kBlack : kWhite;
    var buttonColor = isDark ? kVertclair : kJauneclair;

    var iconColor = isDark ? kWhite : kBlack;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
        title: const Text('Portefeuille'),
      ),
      backgroundColor: kWhite,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total Balance',
                              style: Theme.of(context).textTheme.bodyText1),
                          const SizedBox(
                            height: 10,
                          ),
                          // ignore: unnecessary_null_comparison
                          Text('99.24 USD',
                              style: Theme.of(context).textTheme.headline1),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_card_outlined,
                            color: iconColor,
                          ))
                    ]),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonContainer(
                    title: 'Envoyer',
                    active: true,
                    onTap: () async {
                      var response = await sendCoin();
                      print(response);
                    },
                  ),
                  ButtonContainer(
                    title: 'Actualiser',
                    active: false,
                    onTap: () {
                      credentials != null
                          ? getBalance(credentials)
                          : print("credentials null");
                    },
                  ),
                  ButtonContainer(
                      title: 'Recevoir', active: false, onTap: () {}),
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
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 30, right: 30),
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateWallet()));
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
