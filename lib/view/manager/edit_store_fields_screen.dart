import 'package:flutter/material.dart';
import 'package:universal_store/view/authentication/widgets/error_text.dart';

class EditStoreFieldsScreen extends StatelessWidget {
  final bool error;
  final bool changed;

  const EditStoreFieldsScreen({this.error = false, this.changed = false});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          brightness: Brightness.light, // this makes the status bar black
          iconTheme: new IconThemeData(
              color: Colors.black), // this changes color of hamburger icon
          backgroundColor: Colors.white,
          title: Text('Edit Email', style: TextStyle(color: Colors.black)),
        ),
        body: Container(
          color: Colors.black12,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: error ? Colors.red : Colors.black38,
                    width: 1,
                  ),
                ),
                height: 50.0,
                child: TextFormField(
                  autofocus: true,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  initialValue: 'outdoormart@outdoormart.com',
                  onChanged: (e) {},
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(14.0),
                    hintText: 'test',
                  ),
                ),
              ),
              ErrorText('error would go here'),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: FlatButton(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(color: Colors.white70)),
                    color: Colors.blue,
                    disabledColor: Colors.grey,
                    onPressed: error || !changed ? null : () {},
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
