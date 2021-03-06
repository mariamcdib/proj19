import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'database.dart';
import 'homePages/homePageProfessional.dart';
import 'userData.dart';

class FormScreen extends StatefulWidget {
  final User user;

  FormScreen(this.user);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String _fieldofWork; //dropdownvalue
  String _fieldofStudy;
  String _phone;
  String _url;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void submit() {
    var user = new UserData(widget.user.displayName, widget.user.email,
        widget.user.uid, _fieldofWork);

    getAllUid().then((uids) => {
          print(uids),
          if (!uids.contains(widget.user.uid)) {user.setId(addUser(user))}
        });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePagePro(widget.user, user.role)));
  }

  Widget _buildWork() {
    return DropdownButton<String>(
      hint: Text("Work Field"),
      value: _fieldofWork,
      icon: Icon(
        Icons.import_export_sharp,
      ),
      iconSize: 16,
      itemHeight: 70,
      elevation: 8,
      onChanged: (String newValue) {
        setState(() {
          _fieldofWork = newValue;
        });
      },
      items: <String>[
        'Architecture',
        'Interior Design',
        'Civil Engineering',
        'Mechancal Engineering',
        'Electrical & Communications Engineering'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildStudyfield() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Field of Study"),
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return "Field of Study Required";
        }
      },
      onSaved: (String value) {
        _fieldofStudy = value;
      },
    );
  }

  Widget _buildphonefield() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _url = value;
      },
    );
  }

  Widget _buildURLfield() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'LinkedIn or Portfolio URL'),
      keyboardType: TextInputType.url,
      onSaved: (String value) {
        _url = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Center(child: Text("Complete Professional Profile"))),
        body: Container(
            margin: EdgeInsets.all(24),
            child: Form(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  _buildStudyfield(),
                  _buildWork(),
                  _buildphonefield(),
                  _buildURLfield(),
                  SizedBox(height: 35),
                  RaisedButton(
                    child: Text("Submit"),
                    color: Colors.orange,
                    splashColor: Colors.blue,
                    onPressed: this.submit,
                  )
                ]))));
  }
}
