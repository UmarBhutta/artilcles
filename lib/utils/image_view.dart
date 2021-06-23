import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_list/api/models/image.dart';

import 'image_placeholder.dart';

// Width and height for thumbnail images.
const mobileThumbnailSize = 60.0;

class NetworkImageView extends StatelessWidget {
  const NetworkImageView({@required this.articleImage});
  final ArticleImage articleImage;
  @override
  Widget build(BuildContext context) {
    return Semantics(
      child: ExcludeSemantics(
        child: FadeInImagePlaceholder(
          image: CachedNetworkImageProvider(articleImage.url),
          fit: BoxFit.scaleDown,
          width:  mobileThumbnailSize,
          height: mobileThumbnailSize,
          placeholder: Container(
              width: mobileThumbnailSize,
              height: mobileThumbnailSize,
              child: Center(child:Icon(Icons.article,color: Colors.blueAccent,size: 30,)),
            ),),
        ),
      label: articleImage != null ? articleImage.url : '',
    );
  }
}
