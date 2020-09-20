import 'package:flutter/material.dart';
import 'package:universal_store/view/authentication/widgets/error_text.dart';

class EditStoreEmailScreen extends StatefulWidget {
  final String originalEmail;

  const EditStoreEmailScreen({this.originalEmail = 'outdoormart@gmail.com'});
  @override
  _EditStoreEmailScreenState createState() => _EditStoreEmailScreenState();
}

class _EditStoreEmailScreenState extends State<EditStoreEmailScreen> {
  String email;
  String errorText;

  @override
  void initState() {
    email = widget.originalEmail;
    errorText = generateError();
    super.initState();
  }

//TODO make this a utility method
  String generateError() {
    if (email == '') {
      return 'Email field cannot be empty';
    } else if (email == widget.originalEmail) {
     return 'New email must be different from old';
    } else if (!email.contains('@')) {
      return 'Please enter a valid email';
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
                  initialValue: widget.originalEmail,
                  onChanged: (e) {
                    setState(() {
                      email = e;
                      errorText = generateError();
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(14.0),
                    hintText: 'Email',
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
                    onPressed: errorText != '' || email == widget.originalEmail
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
