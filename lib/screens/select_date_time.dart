// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:gap/gap.dart';
// import 'package:my_attendance/providers/date_provider.dart';
// import 'package:my_attendance/providers/time_provider.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class SelectDateTime extends ConsumerWidget {
//   const SelectDateTime({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final time = ref.watch(timeProvider);
//     final date = ref.watch(dateProvider);

//     return Row(
//       children: [
//         Expanded(
//           child: TextField(
//             title: 'Date',
//             hintText: Helpers.dateFormatter(date),
//             readOnly: true,
//             suffixIcon: IconButton(
//               onPressed: () => Helpers.selectDate(context, ref),
//               icon: const Icon(FontAwesomeIcons.calendar),
//             ),
//           ),
//         ),
//         const Gap(10),
//         Expanded(
//           child: TextField(
//             title: 'Time',
//             hintText: Helpers.timeToString(time),
//             readOnly: true,
//             suffixIcon: IconButton(
//               onPressed: () => _selectTime(context, ref),
//               icon: const Icon(FontAwesomeIcons.clock),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   void _selectTime(BuildContext context, WidgetRef ref) async {
//     TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (pickedTime != null) {
//       ref.read(timeProvider.notifier).state = pickedTime;
//     }
//   }
// }