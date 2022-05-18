import 'package:flutter/material.dart';
import 'package:rx_change_3/palette.dart';

class CardWidget extends StatelessWidget {
  final int index;
  CardWidget({
    required Key key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (index == 0)
    return Container(
      padding: EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      child: Container(
        height: 175,
        width: MediaQuery.of(context).size.width - 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                const Color(0xfff25d1c),
                const Color(0xffff8657),
              ],
              begin: Alignment.topCenter,
              end: Alignment.centerRight,
            )),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.credit_card,
                    color: kWhite,
                  ),
                  onPressed: () {},
                  tooltip: 'KYC',
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 15, top: 25, bottom: 10, right: 20),
                  child: Text(
                    'Bitcoin',
                    style: kBodyStyle,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 15,
                    top: 10,
                    bottom: 15,
                  ),
                  child: Text(
                    '50% or your wallet.',
                    style: kBodyStyle,
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 15,
                              top: 25,
                              bottom: 10,
                              right: 20,
                            ),
                            child: Text(
                              'CARD HOLDER',
                              style: kBodyStyle,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 15,
                              top: 0,
                              bottom: 10,
                              right: 20,
                            ),
                            child: Text(
                              'Ghulam',
                              style: kBodyStyle,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 15,
                              top: 25,
                              bottom: 10,
                              right: 20,
                            ),
                            child: Text(
                              'Expiry Date',
                              style: kStylepetittexte,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 15,
                              top: 0,
                              bottom: 10,
                              right: 20,
                            ),
                            child: Text(
                              '24/2020',
                              style: kBodyStyle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    // if (index == 1)
    //   return Container(
    //     padding: EdgeInsets.only(
    //       left: 5,
    //       right: 15,
    //     ),
    //     child: Container(
    //       height: 175,
    //       width: MediaQuery.of(context).size.width - 55,
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(20),
    //           gradient: LinearGradient(
    //             colors: [
    //               const Color(0xfff25d1c),
    //               const Color(0xffff8657),
    //             ],
    //             begin: Alignment.topCenter,
    //             end: Alignment.centerRight,
    //           )),
    //       child: Column(
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               IconButton(
    //                 icon: Icon(
    //                   Icons.credit_card,
    //                   color:kWhite,
    //                 ),
    //                 onPressed: () {},
    //                 tooltip: 'KYC',
    //               ),
    //               Container(
    //                 padding: EdgeInsets.only(
    //                   left: 15,
    //                   top: 25,
    //                   bottom: 10,
    //                   right: 20,
    //                 ),
    //                 child: Text(
    //                   'Ethereum',
    //                   style: kBodyStyle,
    //                 ),
    //               ),
    //             ],
    //           ),
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Container(
    //                 padding: EdgeInsets.only(
    //                   left: 15,
    //                   top: 10,
    //                   bottom: 15,
    //                 ),
    //                 child: Text(
    //                   '25% or your wallet.',
    //                   style: kBodyStyle,
    //                 ),
    //               ),
    //               Container(
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Container(
    //                           padding: EdgeInsets.only(
    //                               left: 15, top: 25, bottom: 10, right: 20),
    //                           child: Text(
    //                             'CARD HOLDER',
    //                             style: kStylepetittexte
    //                           ),
    //                         ),
    //                         Container(
    //                           padding: EdgeInsets.only(
    //                               left: 15, top: 0, bottom: 10, right: 20),
    //                           child: Text(
    //                             'Ghulam',
    //                             style:  kBodyStyle,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                     Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Container(
    //                           padding: EdgeInsets.only(
    //                               left: 15, top: 25, bottom: 10, right: 20),
    //                           child: Text(
    //                             'Expiry Date',
    //                             style: kStylepetittexte
    //                           ),
    //                         ),
    //                         Container(
    //                           padding: EdgeInsets.only(
    //                               left: 15, top: 0, bottom: 10, right: 20),
    //                           child: Text(
    //                             '24/2020',
    //                             style:  kBodyStyle,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    // );
  }
}
