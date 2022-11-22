import 'package:flutter/material.dart';

import '../../../../../constants/constants.dart';

class TotalBalance extends StatefulWidget {
  const TotalBalance({
    super.key,
  });

  @override
  State<TotalBalance> createState() => _TotalBalanceState();
}

class _TotalBalanceState extends State<TotalBalance> {
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? kWhite : kBlack;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Balance', style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(
              height: 10,
            ),
            // ignore: unnecessary_null_comparison
            Text('99.24 USD', style: Theme.of(context).textTheme.headline1),
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_card_outlined,
              color: iconColor,
            ))
      ]),
    );
  }
}
