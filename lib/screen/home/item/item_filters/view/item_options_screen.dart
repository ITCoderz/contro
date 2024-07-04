import 'package:contro/screen/home/item/item_landing/controller/item_landing_controller.dart';
import 'package:contro/screen/home/settings/qr_codes/qr_filter/components/qr_filter_components.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../generated/assets.dart';
import '../../../../../../utils/colors/app_colors.dart';

class ItemOptionsScreen extends StatelessWidget {
  const ItemOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itemLandingController = Get.find<ItemLandingController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.height,
          width: context.width,
          padding:
              const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 5,
                  width: 60,
                  decoration: BoxDecoration(
                      color: CColors.greyColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              20.ph,
              const QrCodesOptionTile(
                iconAsset: Assets.iconsQrCodeEdit,
                title: "Edit",
              ),
              10.ph,
              const QrCodesOptionTile(
                iconAsset: Assets.iconsQrCodeDelete,
                title: "Delete",
              ),
              10.ph,
              const QrCodesOptionTile(
                iconAsset: Assets.iconsQrCodeShare,
                title: "Share",
              ),
              10.ph,
              const QrCodesOptionTile(
                iconAsset: Assets.iconsQrcodeIcon,
                title: "Create QR Code",
              ),
              10.ph,
            ],
          ),
        ),
      ),
    );
  }
}
