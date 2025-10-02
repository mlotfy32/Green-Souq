import 'package:flutter/material.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';

class CourceDetails extends StatelessWidget {
  const CourceDetails({
    super.key,
    required this.channelLogo,
    required this.channelTitle,
    required this.publishedAt,
    required this.title,
  });
  final String channelLogo;
  final String channelTitle;
  final String publishedAt;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        color: Colors.black12,
      ),
      child: SizedBox(
        width: context.getWidth(context: context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: context.getWidth(context: context) - 30,
              child: Row(
                children: [
                  CircleAvatar(backgroundImage: NetworkImage(channelLogo)),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: context.getWidth(context: context) - 80,
                    child: Text(
                      channelTitle,
                      style: FontStyle.f16w500black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.data_saver_off_sharp, color: Colors.black),
                const SizedBox(width: 10),
                Text(
                  publishedAt,
                  overflow: TextOverflow.ellipsis,
                  style: FontStyle.f16w500black,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: FontStyle.f16w500black,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
