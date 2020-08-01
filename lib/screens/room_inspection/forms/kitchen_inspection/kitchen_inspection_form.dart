import 'package:flutter/material.dart';
import 'package:house_review/components/app_input_text_field.dart';
import 'package:house_review/components/custom_list_view.dart';
import 'package:house_review/components/heading_text.dart';
import 'package:house_review/models/image_comment.dart';
import 'package:house_review/models/kitchen_inspection/kitchen_inspection.dart';
import 'package:house_review/screens/room_inspection/components/inspection_image_comment.dart';
import 'package:house_review/utility/debounce.dart';

part 'kitchen_cabinet_view.dart';
part 'dish_washer_view.dart';
part 'garbage_disposal_view.dart';
part 'kitchen_sink_view.dart';
part 'gas_gas_stove_view.dart';
part 'kitchen_plumbing_view.dart';

class KitchenInspectionForm extends StatelessWidget {
  const KitchenInspectionForm(
      {Key key, @required this.onDataChanged, this.value})
      : assert(onDataChanged != null),
        super(key: key);
  final ValueChanged<KitchenInspection> onDataChanged;
  final KitchenInspection value;

  @override
  Widget build(BuildContext context) {
    KitchenInspection kitchenInspection = value ?? KitchenInspection();
    return DefaultTabController(
      length: 6,
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            child: TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  text: 'Kitchen Cabinet',
                ),
                Tab(
                  text: 'Dish Washer',
                ),
                Tab(
                  text: 'Garbage Disposal',
                ),
                Tab(
                  text: 'Kitchen Sink',
                ),
                Tab(
                  text: 'Gas & Gas Stove',
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
                KitchenCabinetView(
                  value: kitchenInspection.kitchenCabinet,
                  onDataChange: (value) {
                    kitchenInspection.kitchenCabinet = value;
                    onDataChanged(kitchenInspection);
                  },
                ),
                DishWasherView(
                  value: kitchenInspection.dishWasher,
                  onDataChange: (value) {
                    kitchenInspection.dishWasher = value;
                    onDataChanged(kitchenInspection);
                  },
                ),
                GarbageDisposalView(
                  value: kitchenInspection.garbageDisposal,
                  onDataChange: (value) {
                    kitchenInspection.garbageDisposal = value;
                    onDataChanged(kitchenInspection);
                  },
                ),
                KitchenSinkView(
                  value: kitchenInspection.kitchenSink,
                  onDataChange: (value) {
                    kitchenInspection.kitchenSink = value;
                    onDataChanged(kitchenInspection);
                  },
                ),
                GasAndGasStoveView(
                  value: kitchenInspection.gasAndGasStove,
                  onDataChange: (value) {
                    kitchenInspection.gasAndGasStove = value;
                    onDataChanged(kitchenInspection);
                  },
                ),
                KitchenPlumbingView(
                  value: kitchenInspection.plumbing,
                  onDataChange: (value) {
                    kitchenInspection.plumbing = value;
                    onDataChanged(kitchenInspection);
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
