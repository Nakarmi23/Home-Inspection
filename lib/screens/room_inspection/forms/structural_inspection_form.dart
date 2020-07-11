part of '../room_inspection_screen.dart';

class StructuralInspectionForm extends StatelessWidget {
  const StructuralInspectionForm({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: HeadingText('Visual Inspection Sheet'),
          ),
          AppInputTextField(
            labelText: ' Location of Visual Inspection',
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText(
              'Spalling',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 80,
                    width: 80,
                    child: Material(
                      borderRadius: BorderRadius.circular(7.0),
                      color: Colors.grey.shade300,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(7.0),
                        onTap: () {},
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.add,
                                color: Colors.grey.shade600,
                              ),
                              Text(
                                'Add Photo',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          AppInputTextField(
            labelText: ' Comment',
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText(
              'Cracking',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 80,
                    width: 80,
                    child: Material(
                      borderRadius: BorderRadius.circular(7.0),
                      color: Colors.grey.shade300,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(7.0),
                        onTap: () {},
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.add,
                                color: Colors.grey.shade600,
                              ),
                              Text(
                                'Add Photo',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          AppInputTextField(
            labelText: ' Comment',
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText(
              'Cracking - Verneir Reading',
              subHeading: SubHeading.sub2,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: AppInputTextField(
                  labelText: ' Depth',
                ),
              ),
              Expanded(
                child: AppInputTextField(
                  labelText: ' Width',
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText(
              'Bulging',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 80,
                    width: 80,
                    child: Material(
                      borderRadius: BorderRadius.circular(7.0),
                      color: Colors.grey.shade300,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(7.0),
                        onTap: () {},
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.add,
                                color: Colors.grey.shade600,
                              ),
                              Text(
                                'Add Photo',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          AppInputTextField(
            labelText: ' Comment',
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText(
              'Bulging - Verneir Reading',
              subHeading: SubHeading.sub2,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: AppInputTextField(
                  labelText: ' Depth',
                ),
              ),
              Expanded(
                child: AppInputTextField(
                  labelText: ' Width',
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText(
              'Tilting',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 80,
                    width: 80,
                    child: Material(
                      borderRadius: BorderRadius.circular(7.0),
                      color: Colors.grey.shade300,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(7.0),
                        onTap: () {},
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.add,
                                color: Colors.grey.shade600,
                              ),
                              Text(
                                'Add Photo',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          AppInputTextField(
            labelText: ' Comment',
          ),
          AppInputTextField(
            labelText: ' Tilting Reading',
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText(
              'Tilting - Photo using Digital Level Meter',
              subHeading: SubHeading.sub2,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 80,
                    width: 80,
                    child: Material(
                      borderRadius: BorderRadius.circular(7.0),
                      color: Colors.grey.shade300,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(7.0),
                        onTap: () {},
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.add,
                                color: Colors.grey.shade600,
                              ),
                              Text(
                                'Add Photo',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: HeadingText('Non Destructive Test'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText(
              'Non Destructive Test - Photo using Schmidt Hammer',
              subHeading: SubHeading.sub2,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 80,
                    width: 80,
                    child: Material(
                      borderRadius: BorderRadius.circular(7.0),
                      color: Colors.grey.shade300,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(7.0),
                        onTap: () {},
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.add,
                                color: Colors.grey.shade600,
                              ),
                              Text(
                                'Add Photo',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          AppInputTextField(
            labelText: ' Element of Structure',
          ),
          AppInputTextField(
            labelText: ' Tilting Reading',
          ),
          AppInputTextField(
            labelText: ' Concrete Grade',
          ),
          AppInputTextField(
            labelText: ' Direction of Impact',
          ),
          AppInputTextField(
            labelText: ' Location',
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText(
              'Non Destructive Test - Reading',
              subHeading: SubHeading.sub2,
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
                DataRow(
                  cells: [
                    DataCell(
                      Text('1'),
                      placeholder: true,
                    ),
                    DataCell(
                      Text('Enter Readings Here'),
                      placeholder: true,
                      showEditIcon: true,
                    )
                  ],
                ),
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
}
