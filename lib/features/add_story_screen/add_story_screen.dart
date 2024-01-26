import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider/provider.dart';
import '../../common/components/components.dart';
import '../../common/utils/utils.dart';
import 'components/components.dart';
import 'controllers/controllers.dart';
import 'utils/textfield_mixin.dart';

class AddStoryScreen extends StatelessWidget with TextFieldMixin {
  AddStoryScreen({super.key}) : addStoryProvider = AddStoryProvider();

  final AddStoryProvider addStoryProvider;

  void onPressOpenCamera(BuildContext context) {
    context.read<AddStoryProvider>().openCamera();
  }

  void onPressOpenGallery(BuildContext context) async {
    context.read<AddStoryProvider>().openGallery();
  }

  void onPressPostStory(BuildContext context) async {
    context.read<AddStoryProvider>().postStory(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => addStoryProvider,
      builder: (context, child) => DefaultScaffold(
        appBar: const DefaultAppBar(
          title: 'Add Story',
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => onPressPostStory(context),
          backgroundColor: AppColors.blackColor,
          mini: true,
          child: const Icon(
            Icons.send,
            color: AppColors.whiteColor,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Consumer<AddStoryProvider>(
                builder: (context, value, child) => Center(
                  child: DefaultImage(
                    isFromNetwork: false,
                    height: 150,
                    width: 150,
                    imageUrl: value.imagePath ?? '',
                    cacheKey: 'Add-Story',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultButton(
                    padding: const EdgeInsets.all(10),
                    onPress: () => onPressOpenCamera(context),
                    child: const DefaultText('Camera'),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  DefaultButton(
                    padding: const EdgeInsets.all(10),
                    onPress: () => onPressOpenGallery(context),
                    child: const DefaultText('Gallery'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              DescriptionTextField(
                hintText: 'Your description',
                controller: controller,
              )
            ],
          ),
        ),
      ),
    );
  }
}
