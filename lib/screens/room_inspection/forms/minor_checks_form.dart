part of '../room_inspection_screen.dart';

class MinorChecksForm extends StatelessWidget {
  const MinorChecksForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Door Frames',
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Door Panels',
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Hinges',
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Holder',
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Other Fixtures',
          ),
          controlAffinity: ListTileControlAffinity.leading,
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
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Door Frames',
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Door Panels',
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Hinges',
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Holder',
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Other Fixture',
          ),
          controlAffinity: ListTileControlAffinity.leading,
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
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Painting',
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Plastering',
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'False Ceilings',
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Mason Problems',
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Other Problems',
          ),
          controlAffinity: ListTileControlAffinity.leading,
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
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Painting',
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Plastering',
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Mason Problems',
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Other Problems',
          ),
          controlAffinity: ListTileControlAffinity.leading,
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
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Wiring',
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Switches',
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Lights',
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Ceiling Fan',
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(
            'Other Accessories',
          ),
          controlAffinity: ListTileControlAffinity.leading,
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
          child: HeadingText('Carpentry (Wood Works)'),
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
    );
  }
}
