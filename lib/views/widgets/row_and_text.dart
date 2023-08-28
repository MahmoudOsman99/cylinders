// import 'package:cylinders/extensions/app_extentions.dart';
// import 'package:flutter/material.dart';
// import 'package:percent_indicator/percent_indicator.dart';

// import '../../core/app_colors.dart';

// class RowAndDetails extends StatelessWidget {
//   const RowAndDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'قطر من 275 : 268 يبقي: 48 وردة',
//               style: context.textList.bodyMedium!.copyWith(
//                 color: AppColors.blackTextColor,
//               ),
//             ),
//             Text(
//               'قطر من 268 : 260 يبقي: 46 وردة',
//               style: context.textList.bodyMedium!.copyWith(
//                 color: AppColors.blackTextColor,
//               ),
//             ),
//             Text(
//               'قطر من 260 : 255 يبقي: 44 وردة',
//               style: context.textList.bodyMedium!.copyWith(
//                 color: AppColors.blackTextColor,
//               ),
//             ),
//             Text(
//               'قطر من 255 : 250 يبقي:  42 وردة',
//               style: context.textList.bodyMedium!.copyWith(
//                 color: AppColors.blackTextColor,
//               ),
//             ),
//             Text(
//               'قطر اقل من 250 يبقي:    40 وردة',
//               style: context.textList.bodyMedium!.copyWith(
//                 color: AppColors.blackTextColor,
//               ),
//             ),
//           ],
//         ),
//         CircularPercentIndicator(
//           radius: 50.0,
//           lineWidth: 10.0,
//           animation: true,
//           percent: gapVlaue / 100,
//           center: Text(
//             "spring $springCount",
//             style: context.textList.displayMedium,
//           ),
//           footer: Padding(
//             padding: const EdgeInsetsDirectional.only(top: 10),
//             child: Text(
//               "عدد ورد Spring\n من 48",
//               style: context.textList.displayMedium!.copyWith(
//                 height: 1.5,
//               ),
//               maxLines: 2,
//               textAlign: TextAlign.center,
//             ),
//           ),
//           circularStrokeCap: CircularStrokeCap.round,
//           progressColor: AppColors.lightOrangeColor,
//         ),
//       ],
//     );
//   }
// }
