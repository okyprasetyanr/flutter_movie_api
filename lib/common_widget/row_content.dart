import 'package:flutte_movie_api/app_properties/app_properties_text_style.dart';
import 'package:flutter/material.dart';

Widget rowContent({
  required Icon icon,
  required String text,
  TextAlign? align,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      icon,
      const SizedBox(width: 5),
      Expanded(
        child: Text(
          text,
          style: lv05TextStyle,
          textAlign: align ?? TextAlign.end,
          maxLines: 8,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}
