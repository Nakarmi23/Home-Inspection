import 'package:flutter/material.dart';
import 'package:house_review/components/app_input_text_field.dart';
import 'package:house_review/components/custom_list_view.dart';
import 'package:house_review/components/heading_text.dart';

part 'kitchen_cabinet_view.dart';
part 'dish_washer_view.dart';
part 'garbage_disposal_view.dart';
part 'kitchen_sink_view.dart';
part 'gas_gas_stove_view.dart';
part 'kitchen_plumbing_view.dart';

class KitchenInspectionForm extends StatelessWidget {
  const KitchenInspectionForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                KitchenCabinetView(),
                DishWasherView(),
                GarbageDisposalView(),
                KitchenSinkView(),
                GasAndGasStoveView(),
                KitchenPlumbingView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
