import 'package:clima/model/customer.dart';
import 'package:flutter/material.dart';

class CustomerAdd extends StatefulWidget {
  @override
  _CustomerAddState createState() => _CustomerAddState();
}

class _CustomerAddState extends State<CustomerAdd> {
  final _formKey = GlobalKey<FormState>();
  final _customer = CustomerAddForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Builder(
                builder: (context) => Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'First name'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your first name';
                              }
                            },
                            onSaved: (val) =>
                                setState(() => _customer.firstName = val),
                          ),
                          TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Last name'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your last name.';
                                }
                              },
                              onSaved: (val) =>
                                  setState(() => _customer.lastName = val)),
                          TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Phone Number'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your phone number.';
                                }
                              },
                              onSaved: (val) =>
                                  setState(() => _customer.phoneNumber = val)),
                          TextFormField(
                              decoration: InputDecoration(labelText: 'Seal'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your seal';
                                }
                              },
                              onSaved: (val) =>
                                  setState(() => _customer.seal = val)),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 16.0),
                              child: RaisedButton(
                                  onPressed: () {
                                    final form = _formKey.currentState;
                                    if (form.validate()) {
                                      form.save();
                                      _customer.save(_customer.toMap());
                                      _showDialog(context);
                                    }
                                  },
                                  child: Text('Save'))),
                        ])))));
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Submitting form')));
  }
}
