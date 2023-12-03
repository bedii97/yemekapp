import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chip_tags/flutter_chip_tags.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yemek_app/constants/ui_constants.dart';
import 'package:yemek_app/core/utils/size_utils.dart';
import 'package:yemek_app/core/utils/token_manager.dart';
import 'package:yemek_app/features/post/provider/post_provider.dart';
import 'package:yemek_app/features/post/provider/selected_images_provider.dart';
import 'package:yemek_app/features/post/service/post_service.dart';
import 'package:yemek_app/features/post/widgets/carousel.dart';
import 'package:yemek_app/theme/palette.dart';

class CreatePostScreen extends ConsumerStatefulWidget with TokenManager {
  CreatePostScreen({super.key});

  @override
  ConsumerState<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends ConsumerState<CreatePostScreen> {
  List<String> chipList = [];

  final titleController = TextEditingController();

  final bodyController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    bodyController.dispose();
    //Chiplist i nullable yapıp nulla çekmem gerekir mi acaba
  }

  @override
  Widget build(BuildContext context) {
    bool buttonClicked = false;
    var methodMaxLines = 10;
    return Scaffold(
      appBar: UiConstants.appBarTransparent(),
      body: Form(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: _getTextFormFieldDecoration('lbl_title'),
              ),
              SizedBox(height: 0.01.ofSafeHeight),
              ChipTags(
                list: chipList,
                createTagOnSubmit: true,
                chipColor: Palette.white200Color,
                iconColor: Palette.greenColor,
                textColor: Palette.greenColor,
                decoration: _getTextFormFieldDecoration('lbl_ingredients'),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 0.01.ofSafeHeight,
              ),
              TextFormField(
                controller: bodyController,
                decoration: _getTextFormFieldDecoration('lbl_method'),
                maxLines: methodMaxLines,
              ),
              SizedBox(height: 0.01.ofSafeHeight),
              ref.watch(selectedImagesProvider)!.isEmpty
                  ? const SizedBox.shrink()
                  : Carousel(
                      height: 0.3.ofSafeHeight,
                      width: 0.3.ofWidth,
                      activateIndicatorColor: Palette.greenColor,
                      unActivatedIndicatorColor: Palette.greyColor,
                      indicatorBarColor: Colors.transparent,
                      items: ref.watch(selectedImagesProvider)!.map(
                        (e) {
                          return Image.file(
                            File(e.path),
                            width: 0.3.ofWidth,
                            height: 0.3.ofSafeHeight,
                          );
                        },
                      ).toList()),
              //Resim eklenecek
              // Row(
              //   children: ref.watch(selectedImagesProvider)?.map(
              //         (e) {
              //           print('Girdi');
              //           return Image.file(
              //             File(e.path),
              //             width: 100,
              //             height: 100,
              //           );
              //         },
              //       ).toList() ??
              //       [
              //         Container(
              //           height: 30,
              //           width: 30,
              //           color: Colors.red,
              //         )
              //       ],
              // ),
              SizedBox(height: 0.01.ofSafeHeight),
              ElevatedButton(
                  onPressed: () async {
                    //Pick image kısmını utils içinde yapıp sağda solda öyle çağır
                    if (buttonClicked) return;
                    if (await Permission.photos.isPermanentlyDenied) {
                      openAppSettings();
                    }
                    buttonClicked = true;
                    final picker = ImagePicker();
                    ref.read(selectedImagesProvider.notifier).images =
                        await picker.pickMultiImage();
                    buttonClicked = false;
                    return;
                  },
                  child: const Text('btn_pick_image').tr()),
              SizedBox(height: 0.01.ofSafeHeight),
              ElevatedButton(
                onPressed: () async {
                  if (buttonClicked) return;
                  buttonClicked = true;
                  ref.read(postStateNotifierProvider.notifier).createPost(
                      context: context,
                      title: titleController.text,
                      images: ref.read(selectedImagesProvider),
                      materials: chipList,
                      body: bodyController.text);
                  buttonClicked = false;
                  return;
                },
                child: const Text('lbl_send').tr(),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Future<void> _getSendButtonClick(bool buttonClicked) async {
    {
      if (buttonClicked) return;
      buttonClicked = true;
      List<XFile>? pickedFiles;
      final picker = ImagePicker();
      pickedFiles = await picker.pickMultiImage();
      final postService = ref.read(postServiceProvider);
      postService.createPost(
          title: titleController.text,
          images: pickedFiles,
          materials: chipList,
          body: bodyController.text);
      buttonClicked = false;
      return;
    }
  }

  InputDecoration _getTextFormFieldDecoration(String hint) {
    return InputDecoration(
      enabledBorder: getOutlineInputBorder(),
      border: getOutlineInputBorder(),
      focusedBorder: getOutlineInputBorder(),
      hintText: hint.tr(),
    );
  }

  OutlineInputBorder getOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
        color: Palette.greenColor,
      ),
    );
  }
}
