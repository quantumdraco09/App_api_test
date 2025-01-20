// import 'package:flutter/material.dart';
// import 'package:food_delivery/utils/color.dart';
// import 'package:introduction_screen/introduction_screen.dart';


// class OnBoardingScreeen extends StatefulWidget {
//   const OnBoardingScreeen({super.key});

//   @override
//   State<OnBoardingScreeen> createState() => _OnBoardingScreeenState();
// }

// class _OnBoardingScreeenState extends State<OnBoardingScreeen> {
//   @override
//   Widget build(BuildContext context) {

//     final pageDecoration = PageDecoration(
//       titleTextStyle: TextStyle(
//         fontSize: 28,
//         fontWeight: FontWeight.w700,

//       ),
//       bodyTextStyle: TextStyle(fontSize: 19),
//       bodyPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
//       pageColor: Colors.white,
//       imagePadding: EdgeInsets.zero
//     );


//     return IntroductionScreen (
//       globalBackgroundColor: Colors.white,
//       pages: [
//         PageViewModel(
//           title: 'All your favorites',
//           body: 'Get all your loved foods in one once place, you just place the order we do the rest',
//           image: Image.asset('assets/intro1.png')
//         ),

//          PageViewModel(
//           title: 'All your favorites',
//           body: 'Get all your loved foods in one once place, you just place the order we do the rest',
//           image: Image.asset('assets/intro2.png')
//         ),

//          PageViewModel(
//           title: 'All your favorites',
//           body: 'Get all your loved foods in one once place, you just place the order we do the rest',
//           image: Image.asset('assets/intro3.png'),
//           decoration: pageDecoration,
//           footer: Padding(
//             padding: EdgeInsets.fromLTRB(15, 160, 15, 0),
//               child: ElevatedButton(onPressed: (){}, child: Text('Next', style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18
//                    ),
//                    ),
//                    style: ElevatedButton.styleFrom(
//                     minimumSize: Size.fromHeight(50),
//                     backgroundColor: primaryShade ,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8)
//                     )
//                    ),
                   
//                    ),
//             )
//         )
//       ],
//       showSkipButton: true,
//       showDoneButton: false,
//       showBackButton: false,
//       showNextButton: false,
//         back: Text('Back',
//          style: TextStyle(
//           fontWeight: FontWeight.w600,
//           color: primaryShade
//          ),
//          ),
//          done: Text('Done',
//          style: TextStyle(
//           fontWeight: FontWeight.w600,
//           color: primaryShade
//          ),
//          ),
//          skip: Text('Skip',
//          style: TextStyle(
//           fontWeight: FontWeight.w600,
//           color: primaryShade
//          ),
//          ),
//          onDone: (){},
//          onSkip: (){ },
//          dotsDecorator: DotsDecorator(
//           size : Size.square(10),
//           activeColor: primaryShade,
//           activeSize: Size(20, 10),
//           color: Colors.black26,
//           spacing: EdgeInsets.symmetric(horizontal: 3),
          

//          ),




//     );
//   }
// }