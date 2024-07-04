import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QrCodesOptionTile extends StatelessWidget {
  final String iconAsset, title;

  const QrCodesOptionTile({
    super.key,
    required this.iconAsset,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(iconAsset),
            10.pw,
            Expanded(
              child: Text(
                title,
                style: CustomTextStyles.darkGreyColor414,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
