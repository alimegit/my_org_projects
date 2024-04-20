// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'bloc/qr_bloc.dart';
// import 'bloc/qr_event.dart';
// import 'bloc/qr_state.dart';
// class GameScreen extends StatelessWidget {
//   const GameScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => GameBloc(),
//       child: Scaffold(
//         appBar: AppBar(title: Text("4 Rasm 1 So'z")),
//         body: BlocBuilder<GameBloc, GameState>(
//           builder: (context, state) {
//             if (state is GameLoaded) {
//               return Column(
//                 children: [
//                   Wrap(
//                     children: state.images.map((url) => Image.network(url)).toList(),
//                   ),
//                   TextField(
//                     onChanged: (value) => context.read<GameBloc>().add(UpdateAnswer(value)),
//                   ),
//                   TextButton(
//                     onPressed: () => context.read<GameBloc>().add(CheckAnswer()),
//                     child: Text("Tekshirish"),
//                   ),
//                   Text(state.isCorrect ? "To'g'ri!" : "Noto'g'ri!"),
//                 ],
//               );
//             } else {
//               return const Center(child: Text("O'yin yuklanmoqda..."));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
