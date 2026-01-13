import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/data/models/news.dart';

class NewsCard extends StatelessWidget {
  final News news;
  const NewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Container(
        width: 171.w,
        // height: 97.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorContants.text_grey_white,
        ),
        // padding: EdgeInsets.all(8),
        child: Stack(
          children: [
            if (news.isStarred)
              Positioned(
                top: -10.h,
                right: -10.w,
                child: Container(
                  height: 40.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                    ),
                    color: ColorContants.purple_text_headings,
                  ),
                  child: Icon(Icons.star, color: ColorContants.text_grey_white),
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8, 16, 8),
              child: Column(
                children: [
                  RichText(
                    maxLines: 3,
                    softWrap: true,
                    text: TextSpan(
                      style: DefaultTextStyle.of(
                        context,
                      ).style.copyWith(fontSize: 14, color: Colors.black),
                      children: [
                        TextSpan(text: news.content),

                        TextSpan(
                          text: " Read more",
                          style: TextStyle(
                            color: ColorContants.error_red,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("Read more tapped");
                              // Navigate or expand text
                            },
                        ),
                      ],
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Yesterday",
                        style: TextStyle(color: ColorContants.sub_heading_grey),
                      ),
                      Text(
                        "By HR",
                        style: TextStyle(color: ColorContants.sub_heading_grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
