part of '../room_inspection_screen.dart';

class SeepageAnalysisFrom extends StatelessWidget {
  const SeepageAnalysisFrom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AppInputTextField(
            labelText: 'Temperature',
          ),
          AppInputTextField(
            labelText: 'Condition',
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText(
              'Visual Inspection - Upload photo (Normal Camera)',
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
            child: SubHeadingText(
              'Visual Inspection - Upload photo (Thermal Camera)',
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
            child: SubHeadingText(
              'Visual Inspection - Moisture Meter Reading',
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
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText(
              'Visual Inspection - Upload Photo using Moisture Meter',
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
            child: SubHeadingText(
              'Visual Inspection (Digital Level)- Upload Photo',
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
            labelText: 'Comment on Digital Level Verification',
          ),
          Padding(padding: EdgeInsets.only(top: 16.0)),
        ],
      ),
    );
  }
}
