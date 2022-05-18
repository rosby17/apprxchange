import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rx_change_3/palette.dart';
import 'package:rx_change_3/screens/screen.dart';

// import 'package:rxchange/widgets/widgets.dart';

class CarouselSlide extends StatefulWidget {
  CarouselSlide({Key? key}) : super(key: key);

  @override
  State<CarouselSlide> createState() => _CarouselSlideState();
}

class _CarouselSlideState extends State<CarouselSlide> {
  final List photoItems = [
    {
      "texte": "Apprenez sur les cryptos",
      "photo": "assets/images/photos/learn.jpg",
      "description":
          "Acheter des cryptos n'a jamais demande autant d'effort simple rapide et sécurisé avecc RX change",
    },
    {
      "texte": "Restez à jour sur les nouveautés",
      "photo": "assets/images/photos/ajour.png",
      "description":
          "Acheter des cryptos n'a jamais demande autant d'effort simple rapide et sécurisé avecc RX change",
    },
    {
      "texte": "Acheter des cryptos ",
      "photo": "assets/images/photos/acheter.jpg",
      "description":
          "Acheter des cryptos n'a jamais demande autant d'effort simple rapide et sécurisé avecc RX change",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: CarouselSlider(
        options: CarouselOptions(),
        items: photoItems.map((x) {
          return Container(
            height: size.height * 0.5,
            width: size.width,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: kVertclair,
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
                colors: [kJauneclair, Colors.transparent],
              ),
              image: DecorationImage(
                image: AssetImage(x["photo"]),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 5.0, top: 2, left: 18),
                  child: Column(
                    children: [
                      Text(x["texte"], style: kBodyStyleBouton3),
                      SizedBox(height: 4),
                      Text(
                        x["description"],
                        style: TextStyle(
                          fontSize: 8,
                          color: kWhite,
                          fontFamily: "Poppins-Medium",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    var route =
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Actualites();
                    });
                    Navigator.of(context).push(route);
                  },
                  child: Container(
                    height: size.height * 0.04,
                    width: size.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: kJaunesombre,
                    ),
                    child: Center(
                      child: Text("En savoir plus ", style: kStylepetittexte),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

// class Storie extends StatelessWidget {
//   Storie({Key? key}) : super(key: key);

//   final List photoItems = [
//     {
//       "texte": "Acheter des cryptos ",
//       "photo": "assets/images/photos/acheter.jpg"
//     },
//     {
//       "texte": "Apprenez sur les cryptos",
//       "photo": "assets/images/photos/learn.jpg"
//     },
//     {
//       "texte": "Restez à jour sur les nouveautés",
//       "photo": "assets/images/photos/ajour.png"
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: photoItems.map((i) {
//           return ShaderMask(
//             shaderCallback: (rect) => LinearGradient(
//               begin: Alignment.bottomCenter,
//               end: Alignment.center,
//               colors: [Colors.black45, Colors.transparent],
//             ).createShader(rect),
//             blendMode: BlendMode.darken,
//             child: Container(
//               height: size.height * 0.32,
//               width: size.width * 1,
//               margin: EdgeInsets.all(10),
//               padding: EdgeInsets.only(top: 10),
//               decoration: BoxDecoration(
//                 color: kVertclair,
//                 borderRadius: BorderRadius.circular(20),
//                 gradient: LinearGradient(
//                   end: Alignment.topCenter,
//                   begin: Alignment.bottomCenter,
//                   colors: [Colors.black45, Colors.transparent],
//                 ),
//                 image: DecorationImage(
//                   image: AssetImage(i["photo"]),
//                   fit: BoxFit.fill,
//                   colorFilter:
//                       ColorFilter.mode(Colors.black45, BlendMode.darken),
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Center(child: Text(i["texte"], style: kBodyStyleBouton3)),
//                   SizedBox(height: 5),

//                   // Bouton(
//                   //     buttonName: 'En savoir  plus',
//                   //     couleurs: kJauneclair,
//                   //     kcouleurs: kBodyStyleBouton2,
//                   //     route: 'Se Connecter'),
//                   FlatButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, 'Se Connecter');
//                     },
//                     child: Container(
//                       height: size.height * 0.04,
//                       width: size.width * 0.4,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(25),
//                         color: kJauneclair,
//                       ),
//                       child: Center(
//                         child: Text("En savoir plus ", style: kStylepetittexte),
//                       ),
//                     ),
//                   ),
//                   // ),
//                 ],
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
