part of './structural_inspection_form.dart';

class NonDestructiveTestView extends StatefulWidget {
  const NonDestructiveTestView({Key key, this.onFormSave, this.value})
      : super(key: key);
  final ValueChanged<NonDestructiveTest> onFormSave;
  final NonDestructiveTest value;
  @override
  _NonDestructiveTestViewState createState() => _NonDestructiveTestViewState();
}

class _NonDestructiveTestViewState extends State<NonDestructiveTestView> {
  NonDestructiveTest nonDestructiveTest = NonDestructiveTest();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    nonDestructiveTest = widget.value ?? nonDestructiveTest;
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      onChanged: () {
        debounceEvent(() {
          _formKey.currentState.save();
          widget.onFormSave(nonDestructiveTest);
        });
      },
      child: CustomListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: HeadingText('Non Destructive Test'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText(
              'Non Destructive Test - Photo using Schmidt Hammer',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SizedBox(
                height: 80,
                child: ImageListViewBuilder(
                  onImageAdd: (path) {
                    setState(() {
                      nonDestructiveTest.photoSchmidtHammer.add(path);
                    });
                    widget.onFormSave(nonDestructiveTest);
                  },
                  onImageTap: (index) {},
                  images: nonDestructiveTest.photoSchmidtHammer,
                )),
          ),
          AppInputTextField(
            initialValue: nonDestructiveTest.structureElement,
            labelText: 'Element of Structure',
            onSaved: (newValue) {
              nonDestructiveTest.structureElement = newValue;
            },
          ),
          AppInputTextField(
            initialValue: nonDestructiveTest.concreteGrade,
            labelText: 'Concrete Grade',
            onSaved: (newValue) {
              nonDestructiveTest.concreteGrade = newValue;
            },
          ),
          AppInputTextField(
            initialValue: nonDestructiveTest.impactDirection,
            labelText: 'Direction of Impact',
            onSaved: (newValue) {
              nonDestructiveTest.impactDirection = newValue;
            },
          ),
          AppInputTextField(
            initialValue: nonDestructiveTest.location,
            labelText: 'Location',
            onSaved: (newValue) {
              nonDestructiveTest.location = newValue;
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText(
              'Non Destructive Test - Reading',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: DataTable(
              columns: [
                DataColumn(label: Text('S.N.')),
                DataColumn(label: Text('Readings')),
              ],
              rows: [
                ...createDataRow(),
                DataRow(
                  cells: [
                    DataCell(
                      Text('Average (1 to 10)'),
                    ),
                    DataCell(
                      Text('Auto Generated'),
                      onTap: null,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<DataRow> createDataRow() => nonDestructiveTest.readings
      .asMap()
      .keys
      .map(
        (e) => DataRow(
          cells: [
            DataCell(
              Text((e + 1).toString()),
              placeholder: true,
            ),
            DataCell(
              Text(nonDestructiveTest.readings[e].toString()),
              placeholder: true,
              showEditIcon: true,
              onTap: () {
                showAddReadingDialog(e);
              },
            )
          ],
        ),
      )
      .toList()
        ..add(DataRow(
          cells: [
            DataCell(
              Text((nonDestructiveTest.readings.length + 1).toString()),
              placeholder: true,
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text('Enter Readings Here'),
              ),
              onTap: () {
                showAddReadingDialog();
              },
              placeholder: true,
              showEditIcon: true,
            )
          ],
        ));

  Future showAddReadingDialog([int readingIndex]) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('Non Destructive Test Reading'),
          children: <Widget>[
            AddNonDestructiveTestReadingForm(
              onFormSave: (value) {
                if (readingIndex == null) {
                  setState(() {
                    nonDestructiveTest.readings.add(double.tryParse(value));
                  });
                  Navigator.of(context).pop();
                } else {
                  setState(() {
                    nonDestructiveTest.readings[readingIndex] =
                        double.tryParse(value);
                  });
                  Navigator.of(context).pop();
                }
                widget.onFormSave(nonDestructiveTest);
              },
              toEditValue: readingIndex != null
                  ? nonDestructiveTest.readings[readingIndex].toString()
                  : null,
            ),
          ],
        );
      },
    );
  }
}
