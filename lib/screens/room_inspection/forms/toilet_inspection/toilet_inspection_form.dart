import 'package:flutter/material.dart';
import 'package:house_review/components/app_input_text_field.dart';
import 'package:house_review/components/custom_list_view.dart';
import 'package:house_review/components/heading_text.dart';

part 'wash_basin_view.dart';
part 'mirror_view.dart';
part 'water_closet_view.dart';
part 'flush_view.dart';
part 'toilet_plumbing_view.dart';

class ToiletInspectionForm extends StatelessWidget {
  const ToiletInspectionForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                WashBasinView(),
                MirrorView(),
                WaterClosetView(),
                FlushView(),
                ToiletPlumbingView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
