// import 'package:anime_fever/api/get_anime_by_ranking_type.dart';
// import 'package:anime_fever/models/node_class.dart';
// import 'package:anime_fever/views/featured_animes.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../models/anime_model.dart';
//
//
// class SimilarAnimeView extends StatelessWidget {
//   SimilarAnimeView({super.key, required this.node, required this.label});
//
//   final List<Node?> node;
//   final String label;
//
//   final rr = RankedAnimeRepo();
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//         SizedBox(
//           height: 300,
//           child: ListView.separated(
//             scrollDirection: Axis.horizontal,
//             itemCount: node.length,
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               final anime = node.elementAt(index);
//               return AnimeTile(anime: AnimeModel(node: anime));
//             },
//
//             separatorBuilder: (context, index) => const SizedBox(
//               width: 10,
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
//
