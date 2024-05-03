import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/articalModel.dart';

class NewsListView extends StatelessWidget {
  NewsListView({super.key ,required this.articels});
  List<ArticelModel> articels = [];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articels.length,
            (context, i) {
          return Padding(
            padding: const EdgeInsets.all(9.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: '${articels[i].img}',
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  articels[i].title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  articels[i].subtitle??'',
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


