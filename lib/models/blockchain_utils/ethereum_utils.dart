import 'dart:core';

import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
// import 'package:web_socket_channel/io.dart';

class EthereumUtils {
  late Web3Client web3client;
  late http.Client httpClient;
  final contractAdress = dotenv.env['CONTRACT_ADRESS'];

  void initial() {
    httpClient = http.Client();
    String ganachehttpApi = "https://127.0.0.1:7545";
    // String ganachewsApi = "ws://127.0.0.1:7545";
    web3client = Web3Client(ganachehttpApi, httpClient);
  }

  Future getBalance() async {
    final contract = await getDeployedContract();
    final etherFunction = contract.function("getBalance");
    final result = await web3client.call(
      contract: contract,
      function: etherFunction,
      params: [],
    );
    List<dynamic> res = result;
    return res[0];
  }

  Future<String> sendBalance(int amount) async {
    var bigAmount = BigInt.from(amount);
    EthPrivateKey privateKeyCred =
        EthPrivateKey.fromHex(dotenv.env['GANACHE_PRIVATE_KEY']!);
    DeployedContract contract = await getDeployedContract();
    final etherFunction = contract.function("sendBalance");
    final result = await web3client.sendTransaction(
      privateKeyCred,
      Transaction.callContract(
        contract: contract,
        function: etherFunction,
        parameters: [bigAmount],
        maxGas: 100000,
      ),
      chainId: 4,
      fetchChainIdFromNetworkId: false,
    );

    return result;
  }

  Future<String> witdhDrawBalance(int amount) async {
    var bigAmount = BigInt.from(amount);
    EthPrivateKey privateKeyCred =
        EthPrivateKey.fromHex(dotenv.env['GANACHE_PRIVATE_KEY']!);
    DeployedContract contract = await getDeployedContract();
    final etherFunction = contract.function("withDrawBalance");
    final result = await web3client.sendTransaction(
      privateKeyCred,
      Transaction.callContract(
        contract: contract,
        function: etherFunction,
        parameters: [bigAmount],
        maxGas: 100000,
      ),
      chainId: 4,
      fetchChainIdFromNetworkId: false,
    );

    return result;
  }

  Future<DeployedContract> getDeployedContract() async {
    String abi = await rootBundle.loadString("src/artifacts/Crypto.json");
    final contract = DeployedContract(ContractAbi.fromJson(abi, 'Crypto'),
        EthereumAddress.fromHex(contractAdress!));

    return contract;
  }
}
