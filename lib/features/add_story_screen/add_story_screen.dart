import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../maps_screen/utils/utils.dart';
import '../../common/common.dart';
import 'components/components.dart';
import 'controllers/controllers.dart';
import 'utils/textfield_mixin.dart';

class AddStoryScreen extends StatefulWidget {
  const AddStoryScreen({super.key});

  @override
  State<AddStoryScreen> createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> with TextFieldMixin {
  final AddStoryProvider addStoryProvider = AddStoryProvider();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onPressOpenCamera(BuildContext context) {
    context.read<AddStoryProvider>().openCamera();
  }

  void onPressOpenGallery(BuildContext context) async {
    context.read<AddStoryProvider>().openGallery();
  }

  void onPressPostStory(BuildContext context) async {
    context.read<AddStoryProvider>().postStory(controller.text);
  }

  void onPressAddLocation(BuildContext context) {
    context.read<AddStoryProvider>().pickLocation();
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DefaultText(
                    'Lokasi : ',
                    color: AppColors.blackColor,
                  ),
                  Flexible(
                    flex: 1,
                    child: DefaultText(
                      addStoryProvider.placemark != null
                          ? MapsUtil.convertToAddress(
                              addStoryProvider.placemark)
                          : 'tambah lokasi',
                      decoration: TextDecoration.underline,
                      color: AppColors.blueColor,
                      onTap: () => onPressAddLocation(context),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
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
