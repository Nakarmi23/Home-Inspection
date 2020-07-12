import 'package:flutter/material.dart';
import 'package:house_review/components/heading_text.dart';
import 'package:image_picker/image_picker.dart';

typedef OnImage = Function(String image);

class ImagePickerBottomSheet extends StatelessWidget {
  final OnImage onImage;
  const ImagePickerBottomSheet({Key key, this.onImage}) : super(key: key);

  Future<String> _getImage(ImageSource source) async {
    PickedFile pickedFile = await ImagePicker().getImage(source: source);
    return pickedFile != null ? pickedFile.path : null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0).copyWith(top: 24.0),
      height: 200,
      child: Column(
        children: <Widget>[
          HeadingText('Choose Action'),
          Expanded(
            child: Container(),
            flex: 1,
          ),
          Expanded(
            flex: 9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ImagePickerBottomSheetButton(
                  onTap: () async {
                    String image = await _getImage(ImageSource.gallery);
                    if (onImage != null && image != null) onImage(image);
                  },
                  icon: Icon(Icons.image),
                  label: 'Choose from Gallery',
                ),
                ImagePickerBottomSheetButton(
                  onTap: () async {
                    String image = await _getImage(ImageSource.camera);
                    if (onImage != null && image != null) onImage(image);
                  },
                  icon: Icon(Icons.camera_alt),
                  label: 'Take a Picture',
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
            flex: 1,
          ),
        ],
      ),
    );
  }
}

class ImagePickerBottomSheetButton extends StatelessWidget {
  final void Function() onTap;
  final Icon icon;
  final String label;
  const ImagePickerBottomSheetButton({
    Key key,
    this.onTap,
    this.icon,
    this.label,
  })  : assert(icon != null, label != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: icon,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
