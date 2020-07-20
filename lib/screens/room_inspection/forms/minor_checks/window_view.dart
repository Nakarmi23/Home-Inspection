part of './minor_checks_form.dart';

class WindowView extends StatelessWidget {
  const WindowView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
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
      ],
    );
  }
}
