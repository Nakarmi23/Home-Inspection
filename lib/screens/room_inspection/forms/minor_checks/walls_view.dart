part of './minor_checks_form.dart';

class WallsView extends StatelessWidget {
  const WallsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
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
      ],
    );
  }
}
