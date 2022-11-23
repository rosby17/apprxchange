import 'package:flutter/material.dart';
import 'package:rx_change_3/src/features/core/screens/screen.dart';

import '../../../../constants/constants.dart';

class Historiques extends StatefulWidget {
  const Historiques({Key? key}) : super(key: key);

  @override
  State<Historiques> createState() => _HistoriquesState();
}

class _HistoriquesState extends State<Historiques> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      backgroundColor: kWhite,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Historiques',
                          style: Theme.of(context).textTheme.subtitle1),
                      const SizedBox(
                        height: 10,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_card_outlined,
                          ))
                    ]),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: const BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                ClipOval(
                                  child: Material(
                                      color: kBlack,
                                      child: InkWell(
                                        splashColor: kJauneclair,
                                        child: SizedBox(
                                            width: 45,
                                            height: 45,
                                            child: Icon(
                                              Icons.compare_arrows_outlined,
                                              color: kWhite,
                                              size: 15,
                                            )),
                                      )),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Text('No recents transactions'),
                                ),
                              ]),
                        ]),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
