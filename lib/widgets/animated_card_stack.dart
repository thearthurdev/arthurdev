// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       home: PlaygroundPage(),
//     ),
//   );
// }

// //The page
// class PlaygroundPage extends StatefulWidget {
//   @override
//   _PlaygroundPageState createState() => _PlaygroundPageState();
// }

// class _PlaygroundPageState extends State<PlaygroundPage>
//     with TickerProviderStateMixin {
//   AnimationController _moveController;
//   AnimationController _shiftController;

//   CurvedAnimation curvedAnimation;

//   @override
//   void initState() {
//     _shiftController =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 500));
//     _moveController = AnimationController(
//         vsync: this, duration: Duration(milliseconds: 1000));
//     curvedAnimation =
//         CurvedAnimation(parent: _moveController, curve: Curves.easeInOut);
//     super.initState();
//     Timer.periodic(Duration(milliseconds: 3000), (timer) async {
//       await animate();
//     });
//   }

//   Future<void> animate() async {
//     await _moveController.forward();
//     setState(() {
//       isOut = true;
//     });
//     _moveController.reverse();
//     await Future.delayed(Duration(milliseconds: 300));
//     _shiftController.forward();
//     await Future.delayed(Duration(seconds: 1));
//     _shiftController.reset();
//     setState(() {
//       isOut = false;
//       //Throw the first item to the end of the list
//       cardsDetailsList.add(cardsDetailsList.removeAt(0));
//     });
//   }

//   @override
//   void dispose() {
//     _moveController.dispose();
//     _shiftController.dispose();
//     super.dispose();
//   }

//   List<ATMCardUIDetails> cardsDetailsList = [
//     ATMCardUIDetails(
//       cardIcon: CupertinoIcons.money_dollar_circle,
//       gradientColors: [Colors.indigo, Colors.purple],
//       cardName: "Dollar",
//       cardOwner: "TIM SNEATH",
//       cardPan: "1010967890181234",
//     ),
//     ATMCardUIDetails(
//       cardIcon: CupertinoIcons.money_pound_circle,
//       gradientColors: [Colors.red, Colors.blue[700]],
//       cardName: "Pound",
//       cardOwner: "TIMILEHIN JEGEDE",
//       cardPan: "1010967900181112",
//     ),
//     ATMCardUIDetails(
//       gradientColors: [Colors.pink, Colors.lime],
//       cardName: "Bitcoin",
//       cardIcon: CupertinoIcons.bitcoin_circle,
//       cardOwner: "LETS4R",
//       cardPan: "1010102412346789",
//     ),
//     ATMCardUIDetails(
//       cardIcon: CupertinoIcons.money_euro_circle,
//       cardName: "Euro",
//       gradientColors: [
//         Colors.green,
//         Colors.cyan[700],
//       ],
//       cardOwner: "CHIZIARUHOMA OGBONDA",
//       cardPan: "1010113567390789",
//     ),
//     ATMCardUIDetails(
//       cardIcon: CupertinoIcons.money_yen_circle,
//       cardName: "Yen",
//       gradientColors: [Colors.blueGrey, Colors.brown],
//       cardPan: "1010345790908867",
//     ),
//     ATMCardUIDetails(
//         cardIcon: CupertinoIcons.money_yen_circle,
//         cardName: "Yen",
//         gradientColors: [Colors.orange, Colors.indigoAccent],
//         cardPan: "1010345790908867",
//         cardOwner: "WILSON WILSON"),
//   ];
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: AnimatedCardDeck(
//           moveController: curvedAnimation,
//           shiftController: _shiftController,
//           isOut: isOut,
//           cardsDetailsList: cardsDetailsList,
//         ),
//       ),
//     );
//   }

//   bool isOut = false;
// }


// // Animating Deck.
// class AnimatedCardDeck extends StatelessWidget {
//   const AnimatedCardDeck({
//     Key key,
//     @required Animation<double> moveController,
//     @required Animation<double> shiftController,
//     @required this.isOut,
//     @required this.cardsDetailsList,
//   })  : _moveController = moveController,
//         _shiftController = shiftController,
//         super(key: key);

//   final Animation<double> _moveController;
//   final Animation<double> _shiftController;
//   final bool isOut;
//   final List<ATMCardUIDetails> cardsDetailsList;

//   double getAnimValue({double start, double end, Animation<double> animation}) {
//     return ((end - start) * animation.value) + start;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final int numberOfCards = cardsDetailsList.length;
//     return TwoAnimatedBuilders(
//       animations: [_moveController, _shiftController],
//       builder: () {
//         return Stack(
//           children: List.generate(
//             numberOfCards + 1,
//             (index) {
//               final double multiplier = (numberOfCards + 1) - index.toDouble();
//               return Builder(
//                 builder: (context) {
//                   final yRotate = getAnimValue(
//                       start: 0.5, end: 0.6, animation: _moveController);
//                   final xRotate = getAnimValue(
//                       start: -0.8, end: -0.1, animation: _moveController);
//                   final yTranslate = -300 * _moveController.value;

//                   //TOP CARD.
//                   final topCardAnimDetails = ATMCardAnimationDetails(
//                     move: multiplier,
//                     rotateX: xRotate,
//                     rotateY: yRotate,
//                     translateY: yTranslate,
//                     index: index.toDouble(),
//                   );
//                   if (index == numberOfCards) {
//                     return Opacity(
//                       opacity: isOut ? 0 : 1,
//                       child: ATMCard(
//                         animationDetails: topCardAnimDetails,
//                         atmCardUIDetails: cardsDetailsList.first,
//                       ),
//                     );
//                   }

//                   //3d EFFECT CARD.
//                   //Index starts at 0 and ends at number of cards
//                   //Move starts at multiplier * 1.0 but ends at (n)
//                   final double moveEnd =
//                       (numberOfCards + 1) - numberOfCards.toDouble();
//                   final double moveStart = multiplier;
//                   final _3DEffectCardAnimDetails = ATMCardAnimationDetails(
//                     move: isOut
//                         ? getAnimValue(
//                             animation: _moveController,
//                             start: (numberOfCards + 1) - 1.0,
//                             end: moveEnd)
//                         : getAnimValue(
//                             start: moveStart,
//                             end: moveEnd,
//                             animation: _moveController,
//                           ),
//                     index: isOut
//                         ? getAnimValue(
//                             start: 1.0,
//                             end: numberOfCards.toDouble(),
//                             animation: _moveController,
//                           )
//                         : numberOfCards * _moveController.value,
//                     rotateX: xRotate,
//                     rotateY: yRotate,
//                     translateY: yTranslate,
//                   );
//                   if (index == 0) {
//                     return Opacity(
//                       opacity: isOut ? 1 : 0,
//                       child: ATMCard(
//                         animationDetails: _3DEffectCardAnimDetails,
//                         atmCardUIDetails: cardsDetailsList.first,
//                       ),
//                     );
//                   }

//                   //OTHER CARDS.
//                   final otherCardAnimDetails = ATMCardAnimationDetails(
//                     move: getAnimValue(
//                       start: multiplier,
//                       end: (numberOfCards + 1) - (index.toDouble() + 1),
//                       animation: _shiftController,
//                     ),
//                     index: getAnimValue(
//                       start: index.toDouble(),
//                       end: index.toDouble() + 1,
//                       animation: _shiftController,
//                     ),
//                   );
//                   final List<ATMCardUIDetails> leftDetails = [];
//                   for (int i = cardsDetailsList.length - 1; i > 0; i--) {
//                     leftDetails.add(cardsDetailsList[i]);
//                   }
//                   return ATMCard(
//                     animationDetails: otherCardAnimDetails,
//                     atmCardUIDetails: leftDetails[index - 1],
//                   );
//                 },
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

// //Two chained Animated Builders.
// class TwoAnimatedBuilders extends StatefulWidget {
//   final List<Listenable> animations;
//   final Widget Function() builder;
//   const TwoAnimatedBuilders({
//     Key key,
//     @required this.animations,
//     this.builder,
//   }) : super(key: key);
//   @override
//   _TwoAnimatedBuildersState createState() => _TwoAnimatedBuildersState();
// }

// class _TwoAnimatedBuildersState extends State<TwoAnimatedBuilders> {
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: widget.animations.first,
//       builder: (context, _) {
//         return AnimatedBuilder(
//           animation: widget.animations.last,
//           builder: (context, _) {
//             return widget.builder();
//           },
//         );
//       },
//     );
//   }
// }

// //The ATMCard
// class ATMCard extends StatefulWidget {
//   final ATMCardAnimationDetails animationDetails;
//   final ATMCardUIDetails atmCardUIDetails;
//   const ATMCard({
//     Key key,
//     @required this.animationDetails,
//     @required this.atmCardUIDetails,
//   }) : super(key: key);

//   @override
//   _ATMCardState createState() => _ATMCardState();
// }

// class _ATMCardState extends State<ATMCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Transform.translate(
//       offset: Offset(
//         (widget.animationDetails.index * -20.0),
//         widget.animationDetails.move * 30.0,
//       ),
//       child: Transform(
//         transform: Matrix4.identity()
//           ..setEntry(3, 2, 0.0008)
//           ..rotateY(widget.animationDetails.rotateY ?? 0.5)
//           ..rotateX(widget.animationDetails.rotateX ?? -0.8)
//           ..rotateZ(0.1)
//           ..translate(20.0, widget.animationDetails.translateY ?? 0.0, 0.0),
//         child: Container(
//           width: 450,
//           height: 280,
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Icon(
//                 widget.atmCardUIDetails.cardIcon ?? Icons.masks_rounded,
//                 color: Colors.white,
//                 size: 60,
//               ),
//               Transform.translate(
//                 offset: Offset(0, -2),
//                 child: Text(
//                   "${widget.atmCardUIDetails.cardName ?? "Mask"} Card",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Spacer(),
//               Text(
//                 (widget.atmCardUIDetails.cardPan ?? "1234567890181234")
//                     .replaceAllMapped(
//                         RegExp(r".{4}"), (match) => "${match.group(0)}       "),
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.white, fontSize: 25),
//               ),
//               Spacer(),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "VALID\nTRU",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 10,
//                               ),
//                             ),
//                             SizedBox(width: 10),
//                             Text(
//                               "10/21",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             )
//                           ],
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           widget.atmCardUIDetails.cardOwner?.toUpperCase() ??
//                               "JOSTEVE ADEKANBI",
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Text(
//                     "VISA",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             gradient: LinearGradient(
//               colors: widget.atmCardUIDetails.gradientColors,
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 blurRadius: 1.0,
//                 spreadRadius: 1.0,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// //ATMCARD Details
// class ATMCardAnimationDetails {
//   final double rotateX, rotateY, translateY, int, index, move;

//   ATMCardAnimationDetails(
//       {this.rotateX,
//       this.rotateY,
//       this.translateY,
//       this.int,
//       this.index,
//       this.move});
// }

// class ATMCardUIDetails {
//   final List<Color> gradientColors;
//   final String cardName;
//   final IconData cardIcon;
//   final String cardOwner;
//   final String cardPan;
//   final String validThru;

//   ATMCardUIDetails(
//       {this.gradientColors,
//       this.cardName,
//       this.cardIcon,
//       this.cardOwner,
//       this.cardPan,
//       this.validThru});
// }
