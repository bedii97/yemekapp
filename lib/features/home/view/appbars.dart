// appBar: AppBar(
//         elevation = 0,
//         toolbarHeight = 200.v,
//         backgroundColor = Palette.greenColor,
//         leading = Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Row(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AppbarImageButton(),
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0, top: 8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Merhaba, Muhammed Bedii Yürek",
//                       style: CustomTextStyles.titleSmallPrimaryBold,
//                     ),
//                     Text(
//                       "Welcome Back!",
//                       style: CustomTextStyles.titleSmallGray500,
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//         leadingWidth = 0.7.ofWidth,
//         actions = [
//           Align(
//             alignment: Alignment.topRight,
//             child: AppbarIconbutton(
//               icon: Icons.notifications_outlined,
//               iconColor: Palette.whiteColor.withOpacity(0.6),
//               margin: EdgeInsets.only(
//                 right: 16.h,
//                 // top: 7.v,
//                 // bottom: 16.v,
//                 //Ortaladığına inanıyorum
//                 // bottom: 0.5.ofTopHeight,
//               ),
//             ),
//           )
//         ],
//         flexibleSpace = Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 32.0),
//               child: Container(
//                 width: 200,
//                 height: 50,
//                 color: Colors.red,
//               ),
//             ),
//           ],
//         ),
//       ),