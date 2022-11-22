// ignore: file_names
import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class CoinCard extends StatelessWidget {
  CoinCard(
      {super.key,
      required this.name,
      required this.image,
      required this.symbol,
      required this.price,
      required this.change,
      required this.changePercentage,
      required this.rank});
  String name;
  String image;
  String symbol;
  double price;
  double change;
  double changePercentage;
  int rank;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              height: 60,
              width: 60,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.network(image),
              ),
            ),
          ),
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(symbol.toUpperCase(),
                        style: Theme.of(context).textTheme.headline3),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: kJauneclair.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            rank.toString(),
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        name,
                        style: Theme.of(context).textTheme.bodyText2,
                      )
                    ],
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price.toDouble().toString(),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  change.toDouble() < 0
                      ? change.toDouble().toStringAsFixed(3)
                      : '+${change.toDouble().toStringAsFixed(3)}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  changePercentage.toDouble() < 0
                      ? '${changePercentage.toDouble()}%'
                      : '+${changePercentage.toDouble()}%',
                  style: TextStyle(
                    color: changePercentage.toDouble() < 0
                        ? Colors.red
                        : Colors.green,
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
