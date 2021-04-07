
// import '../../size_config.dart';
// import '../componants.dart';
//
// class InputField extends StatelessWidget {
//
//   final String hintText;
//   final bool pass;
//   final TextEditingController controller;
//
//   InputField({this.hintText, this.pass, this.controller});
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       width: SizeConfig().width(context) * 0.80,
//       height: SizeConfig().heigth(context) * 0.07,
//       child: TextField(
//
//         controller: controller,
//         obscureText: pass,
//         style: textStyle.copyWith(
//           fontSize: SizeConfig().heigth(context) * 0.025,
//           color: Colors.blue.shade500,
//         ),
//         decoration: InputDecoration(
//           hintText: hintText,
//           hintStyle: textStyle.copyWith(
//             fontSize: SizeConfig().heigth(context) * 0.02,
//             color: Colors.blue.shade700,
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: BorderSide(
//               color: Colors.blueAccent,
//             ),
//           ),
//
//           disabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: BorderSide(
//               color: Colors.blueAccent,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class PassInputField extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
