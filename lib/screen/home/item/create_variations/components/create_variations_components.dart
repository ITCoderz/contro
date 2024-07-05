import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.dart';
import '../../../../../reusable_widgets/custom_text_fields/custom_text_field.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/text_styles/text_styles.dart';

class VariationComponent extends StatelessWidget {
  final Function()? addOptionFunction,
      galleryOptionFunction,
      optionDeletedFunction,
      removeVariations;
  final int numberOfOptions;

  const VariationComponent({
    super.key,
    required this.addOptionFunction,
    required this.numberOfOptions,
    required this.galleryOptionFunction,
    required this.optionDeletedFunction,
    required this.removeVariations,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: CColors.whiteColor,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Variation Name",
                style: CustomTextStyles.darkGreyColor414,
              ),
              InkWell(
                onTap: removeVariations,
                borderRadius: BorderRadius.circular(2),
                child: SvgPicture.asset(Assets.iconsDeleteVariationIcon),
              ),
            ],
          ),
          10.ph,
          CustomTextField(
            textEditingController: TextEditingController(),
            hintText: "Enter Variation (eg. Colour, Size, Flavours, etc.) ",
          ),
          10.ph,
          const Text(
            "Option",
            style: CustomTextStyles.darkGreyColor414,
          ),
          10.ph,
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int index = 0; index < numberOfOptions; index++) ...[
                CustomTextField(
                  textEditingController: TextEditingController(),
                  hintText: "Enter Option",
                  needSuffix: true,
                  suffixMinWidth: 50,
                  suffixWidget: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: galleryOptionFunction,
                        child: SvgPicture.asset(
                          Assets.iconsVariationGalleryIcon,
                        ),
                      ),
                      5.pw,
                      InkWell(
                        onTap: optionDeletedFunction,
                        child: SvgPicture.asset(
                          Assets.iconsDeleteVariationIconTwo,
                        ),
                      ),
                    ],
                  ),
                ),
                if (index != numberOfOptions - 1) 10.ph,
              ]
            ],
          ),
          10.ph,
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: addOptionFunction,
                child: Ink(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: const BoxDecoration(
                    color: CColors.scaffoldColor,
                  ),
                  width: context.width,
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.iconsAddBankIcon,
                          width: 25,
                          colorFilter: const ColorFilter.mode(
                            CColors.greyTwoColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        10.pw,
                        const Expanded(
                          child: Text(
                            "Add Option",
                            style: CustomTextStyles.greyTwoColor412,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
