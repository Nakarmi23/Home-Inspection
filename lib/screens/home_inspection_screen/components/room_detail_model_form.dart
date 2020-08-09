import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:house_review/components/app_dropdown_menu.dart';
import 'package:house_review/components/app_input_text_field.dart';
import 'package:house_review/cubit/room_purpose_cubit/room_purpose_cubit.dart';
import 'package:house_review/models/room.dart';
import 'package:house_review/models/room_purpose.dart';

typedef void RoomDetailFormSave(Room value);

class RoomDetailModelForm extends StatefulWidget {
  final double buildingStorey;
  final RoomDetailFormSave onFormSave;
  final Room toEditValue;

  RoomDetailModelForm({
    Key key,
    @required this.buildingStorey,
    @required this.onFormSave,
    this.toEditValue,
  })  : assert(buildingStorey != null),
        assert(!buildingStorey.isNegative),
        assert(onFormSave != null),
        super(key: key);

  @override
  _RoomDetailModelFormState createState() => _RoomDetailModelFormState();
}

class _RoomDetailModelFormState extends State<RoomDetailModelForm> {
  Room roomDetail = Room();

  @override
  void initState() {
    super.initState();
    if (widget.toEditValue != null) roomDetail = widget.toEditValue;
  }

  GlobalKey<FormState> roomDetailFromKey = GlobalKey<FormState>();
  List<RoomPurpose> roomPurposeList = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: roomDetailFromKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          AppInputTextField(
            autofocus: true,
            labelText: 'Room Number',
            keyboardType: TextInputType.number,
            initialValue: widget.toEditValue != null
                ? roomDetail?.roomNo.toString()
                : '1',
            validator: roomNumberValidator,
            onSaved: (newValue) {
              roomDetail.roomNo = int.tryParse(newValue);
            },
          ),
          AppInputTextField(
            labelText: 'Storey Number',
            keyboardType: TextInputType.number,
            initialValue: widget.toEditValue != null
                ? roomDetail?.storeyNo.toString()
                : '1',
            validator: storeyNumberValidation,
            onSaved: (newValue) {
              roomDetail.storeyNo = double.tryParse(newValue);
            },
          ),
          CubitBuilder<RoomPurposeCubit, RoomPurposeState>(
            builder: (context, state) {
              if (state is RoomPurposeSuccess) {
                roomPurposeList = state.roomPurpose;
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: AppDropdownMenu<RoomPurpose>(
                  title: 'Room Purpose',
                  value: roomDetail?.roomPurpose != null
                      ? roomDetail?.roomPurpose
                      : roomPurposeList[0],
                  items: createDropdownList(roomPurposeList),
                  onChanged: (value) {
                    setState(() {
                      roomDetail.roomPurpose = value;
                    });
                  },
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  child: Text(widget.toEditValue == null ? 'Add' : 'Edit'),
                  onPressed: () {
                    if (roomDetailFromKey.currentState.validate()) {
                      roomDetailFromKey.currentState.save();
                      if (roomDetail.roomPurpose == null)
                        roomDetail.roomPurpose = roomPurposeList[0];
                      widget.onFormSave(roomDetail);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<RoomPurpose>> createDropdownList(
      List<RoomPurpose> data) {
    return data
        .map(
          (purpose) => DropdownMenuItem(
            child: Text(purpose.purpose),
            value: purpose,
          ),
        )
        .toList();
  }

  String storeyNumberValidation(value) {
    switch (value) {
      case '':
        return 'Storey Number is required';
      case '0':
        return 'Storey Number can not be 0';
      default:
        if (int.tryParse(value) > widget.buildingStorey) {
          return 'Storey Num is greater building\'s Storey No.';
        }
        return null;
    }
  }

  String roomNumberValidator(value) {
    switch (value) {
      case '':
        return 'Room Number is required';
      case '0':
        return 'Room Number can not be 0';
      default:
        return null;
    }
  }
}
