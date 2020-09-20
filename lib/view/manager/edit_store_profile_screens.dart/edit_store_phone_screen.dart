import 'package:flutter/material.dart';
import 'package:universal_store/view/authentication/widgets/error_text.dart';

class EditStorePhoneScreen extends StatefulWidget {
  final String originalPhone;

  const EditStorePhoneScreen({this.originalPhone = '404-444-4444'});
  @override
  _EditStorePhoneScreenState createState() => _EditStorePhoneScreenState();
}

class _EditStorePhoneScreenState extends State<EditStorePhoneScreen> {
  String phone;
  String errorText;

  @override
  void initState() {
    phone = widget.originalPhone;
    errorText = generateError();
    super.initState();
  }

//TODO make this a utility method
  String generateError() {
    if (phone == '') {
      return 'Phone field cannot be empty';
    } else if (phone == widget.originalPhone) {
     return 'New phone must be different from old';
    } else if (!phone.contains('-')) {
      return 'Please enter a valid phone';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    //final viewModel = Provider.of<StoreProfileViewModel>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          brightness: Brightness.light, // this makes the status bar black
          iconTheme: new IconThemeData(
              color: Colors.black), // this changes color of hamburger icon
          backgroundColor: Colors.white,
          title: Text('Edit Phone', style: TextStyle(color: Colors.black)),
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
                    color: errorText != '' ? Colors.red : Colors.black38,
                    width: 1,
                  ),
                ),
                height: 50.0,
                child: TextFormField(
                  autofocus: true,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  initialValue: widget.originalPhone,
                  onChanged: (e) {
                    setState(() {
                      phone = e;
                      errorText = generateError();
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(14.0),
                    hintText: 'Phone',
                  ),
                ),
              ),
              ErrorText(errorText),
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
                    onPressed: errorText != '' || phone == widget.originalPhone
                        ? null
                        : () {
                          Navigator.pop(context);
                          //TODO update backend
                        },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
