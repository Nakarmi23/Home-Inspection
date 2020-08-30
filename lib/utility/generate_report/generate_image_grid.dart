part of './generate_report.dart';

Column generateImageGrid(PdfDocument doc, List<String> imageList) {
  List<Widget> rows = [];
  for (var i = 0; i <= (imageList.length / 4).round(); i++) {
    List<Widget> images = [];
    for (var imageIndex = 4 * i; imageIndex < (4 * (i + 1)); imageIndex++) {
      if ((imageList.length - 1) - imageIndex >= 0) {
        images.add(
          Image(
            PdfImage.file(
              doc,
              bytes: File(imageList[imageIndex])
                  .readAsBytesSync()
                  .buffer
                  .asUint8List(),
            ),
            width: 110,
          ),
        );
      } else {
        images.add(Container(width: 110));
      }
    }
    rows.add(
      Padding(
        padding: EdgeInsets.only(
          bottom: 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: images,
        ),
      ),
    );
    images = [];
  }
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: rows,
  );
}
