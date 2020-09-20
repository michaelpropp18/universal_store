import 'package:flutter/material.dart';
import 'package:universal_store/view/authentication/widgets/error_text.dart';

class EditStoreWebsiteScreen extends StatefulWidget {
  final String originalWebsite;

  const EditStoreWebsiteScreen({this.originalWebsite = 'www.outdoormart.com'});
  @override
  _EditStoreWebsiteScreenState createState() => _EditStoreWebsiteScreenState();
}

class _EditStoreWebsiteScreenState extends State<EditStoreWebsiteScreen> {
  String website;
  String errorText;

  @override
  void initState() {
    website = widget.originalWebsite;
    errorText = generateError();
    super.initState();
  }

//TODO make this a utility method
  String generateError() {
    if (website == '') {
      return 'Website field cannot be empty';
    } else if (website == widget.originalWebsite) {
     return 'New website must be different from old';
    } else if (!website.contains('www.')) {
      return 'Please enter a valid website';
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
          title: Text('Edit Website', style: TextStyle(color: Colors.black)),
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
                  initialValue: widget.originalWebsite,
                  onChanged: (e) {
                    setState(() {
                      website = e;
                      errorText = generateError();
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(14.0),
                    hintText: 'Website',
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
                    onPressed: errorText != '' || website == widget.originalWebsite
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
