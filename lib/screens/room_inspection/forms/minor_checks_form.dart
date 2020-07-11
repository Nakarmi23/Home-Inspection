part of '../room_inspection_screen.dart';

class MinorChecksForm extends StatelessWidget {
  const MinorChecksForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: HeadingText('Door'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText('Door 1'),
          ),
          AppInputTextField(
            labelText: 'Door Material',
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText('Door Checklist'),
          ),
          AppInputTextField(
            labelText: 'Condition',
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
            child: HeadingText('Windows'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText('Window 1'),
          ),
          AppInputTextField(
            labelText: 'Door Material',
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText('Window Checklist'),
          ),
          AppInputTextField(
            labelText: 'Condition',
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
            child: HeadingText('Celling'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText('Celling Checklist'),
          ),
          AppInputTextField(
            labelText: 'Condition',
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
            child: HeadingText('Walls'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText('Walls Checklist'),
          ),
          AppInputTextField(
            labelText: 'Condition',
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
            child: HeadingText('Electrical Fittings'),
          ),
          AppInputTextField(
            labelText: 'Age of Electrical Inspection',
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText('Electrical Fittings Checklist'),
          ),
          AppInputTextField(
            labelText: 'Condition',
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
            child: HeadingText('Pest Inspection'),
          ),
          AppInputTextField(
            labelText: 'Surrounding Condition of House',
          ),
          AppInputTextField(
            labelText: 'Condition',
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
            child: HeadingText('Carpentry (Wood Works'),
          ),
          AppInputTextField(
            labelText: 'Condition',
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
            child: HeadingText('Metal and Alumunium Works'),
          ),
          AppInputTextField(
            labelText: 'Condition',
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
            child: HeadingText('Cleaning'),
          ),
          AppInputTextField(
            labelText: 'Condition',
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
        ],
      ),
    );
  }
}
