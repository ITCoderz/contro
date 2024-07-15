import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../../utils/colors/app_colors.dart';

class VariantItemComponent extends StatelessWidget {
  final int index;

  const VariantItemComponent({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: CColors.borderOneColor),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Variant ${index + 1}",
            style: CustomTextStyles.darkGreyTwoColor411,
          ),
          10.ph,
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 4,
              mainAxisExtent: 25,
            ),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return SlideAnimation(
                verticalOffset: 30.0,
                child: FadeInAnimation(
                  child: VariantOptionComponent(
                    index: index,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class VariantOptionComponent extends StatelessWidget {
  final int index;

  const VariantOptionComponent({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: CColors.borderOneColor),
      ),
      child: Text(
        "Option ${index + 1}",
        style: CustomTextStyles.lightGreyTwoColor410,
      ),
    );
  }
}
