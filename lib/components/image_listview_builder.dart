import 'dart:io';

import 'package:flutter/material.dart';
import 'package:house_review/components/image_picker_bottomsheet.dart';

typedef void OnImageAdd(String path);
typedef void OnImageTap(int index);

class ImageListViewBuilder extends StatelessWidget {
  const ImageListViewBuilder({
    Key key,
    @required this.onImageAdd,
    @required this.onImageTap,
    @required this.images,
    this.enabled = true,
  })  : assert(onImageAdd != null),
        assert(onImageTap != null),
        assert(images != null),
        super(key: key);
  final OnImageAdd onImageAdd;
  final List<String> images;
  final OnImageTap onImageTap;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: images.length + 1,
      itemBuilder: (context, index) {
        if (index < images.length) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7.0),
              child: Material(
                color: Colors.grey.shade300,
                child: Ink.image(
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  image: FileImage(
                    File(images[index]),
                  ),
                  child: InkWell(
                    onTap: () {
                      onImageTap(index);
                    },
                  ),
                ),
              ),
            ),
          );
        } else {
          return SizedBox(
            height: 80,
            width: 80,
            child: Material(
              borderRadius: BorderRadius.circular(7.0),
              color: enabled ? Colors.grey.shade300 : Colors.grey.shade200,
              child: InkWell(
                borderRadius: BorderRadius.circular(7.0),
                onTap: enabled
                    ? () {
                        showImagePickerBottomSheet(
                          context,
                          onImage: (path) {
                            onImageAdd(path);
                          },
                        );
                      }
                    : null,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: enabled
                            ? Colors.grey.shade600
                            : Colors.grey.shade400,
                      ),
                      Text(
                        'Add Photo',
                        style: TextStyle(
                          color: enabled
                              ? Colors.grey.shade600
                              : Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
