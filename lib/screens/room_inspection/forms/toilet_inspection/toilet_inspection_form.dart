import 'package:flutter/material.dart';
import 'package:house_review/components/custom_list_view.dart';
import 'package:house_review/components/heading_text.dart';
import 'package:house_review/models/image_comment.dart';
import 'package:house_review/models/toilet_inspection/toilet_inspection.dart';
import 'package:house_review/screens/room_inspection/components/inspection_image_comment.dart';

part 'wash_basin_view.dart';
part 'mirror_view.dart';
part 'water_closet_view.dart';
part 'flush_view.dart';
part 'toilet_plumbing_view.dart';

class ToiletInspectionForm extends StatelessWidget {
  const ToiletInspectionForm({
    Key key,
    @required this.onDateChanged,
    this.value,
  })  : assert(onDateChanged != null),
        super(key: key);
  final ValueChanged<ToiletInspection> onDateChanged;
  final ToiletInspection value;
  @override
  Widget build(BuildContext context) {
    ToiletInspection toiletInspection = value ?? ToiletInspection();
    return DefaultTabController(
      length: 5,
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            child: TabBar(
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  text: 'Wash Basin',
                ),
                Tab(
                  text: 'Mirror',
                ),
                Tab(
                  text: 'Water Closet',
                ),
                Tab(
                  text: 'Flush',
                ),
                Tab(
                  text: 'Plumbing',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                WashBasinView(
                  value: toiletInspection.washBasin,
                  onDataChange: (value) {
                    toiletInspection.washBasin = value;
                    onDateChanged(toiletInspection);
                  },
                ),
                MirrorView(
                  value: toiletInspection.mirror,
                  onDataChange: (value) {
                    toiletInspection.mirror = value;
                    onDateChanged(toiletInspection);
                  },
                ),
                WaterClosetView(
                  value: toiletInspection.waterCloset,
                  onDataChange: (value) {
                    toiletInspection.waterCloset = value;
                    onDateChanged(toiletInspection);
                  },
                ),
                FlushView(
                  value: toiletInspection.flush,
                  onDataChange: (value) {
                    toiletInspection.flush = value;
                    onDateChanged(toiletInspection);
                  },
                ),
                ToiletPlumbingView(
                  value: toiletInspection.plumbing,
                  onDataChange: (value) {
                    toiletInspection.plumbing = value;
                    onDateChanged(toiletInspection);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
