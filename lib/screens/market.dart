import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';

import '../palette.dart';

class Market extends StatefulWidget {
  const Market({Key? key}) : super(key: key);

  @override
  State<Market> createState() => _MarketState();
}

WebSocketChannel? channel;

class _MarketState extends State<Market> {
  Future<List<dynamic>> getAssets() async {
    final url = Uri.parse('https://api.coincap.io/v2/assets');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = convert.jsonDecode(response.body);
      final List<dynamic> cryptoAssets = json['data'];

      listenToCryptoAssets(cryptoAssets);
      return cryptoAssets;
    } else {
      throw Exception('Failed to load assets');
    }
  }

  void listenToCryptoAssets(List cryptoAssets) {
    channel = WebSocketChannel.connect(
        Uri.parse('wss://ws.coincap.io/prices?assets=ALL'));
  }

  @override
  void initState() {
    getAssets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto List Rxchange'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getAssets(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return StreamBuilder(
                  stream: channel!.stream,
                  builder: (context, streamSnapshot) {
                    Map? streamData;
                    if (streamSnapshot.hasData) {
                      streamData = convert
                          .jsonDecode(streamSnapshot.data as String) as Map;
                    }

                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final dynamic cyptoAsset =
                            (snapshot.data as List)[index];
                        String price = num.tryParse(cyptoAsset['priceUsd'])!
                            .toStringAsFixed(2);

                        if (streamData != null &&
                            streamData.containsKey(cyptoAsset['id'])) {
                          price = streamData[cyptoAsset['id']].toString();
                        }
                        return Card(
                          child: ListTile(
                            title: Text(
                              cyptoAsset['name'],
                              style: const TextStyle(
                                  fontSize: 17,
                                  // fontFamily: "Poppins-Medium",
                                  fontWeight: FontWeight.w800,
                                  color: kVertclair),
                            ),
                            subtitle: Text(
                              cyptoAsset['symbol'],
                            ),
                            trailing: Text(
                              '\$$price',
                              style: const TextStyle(
                                  fontSize: 17,
                                  // fontFamily: "Poppins-Medium",
                                  fontWeight: FontWeight.w400,
                                  color: kBlack),
                            ),
                          ),
                        );
                      },
                      itemCount: (snapshot.data as List).length,
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
