// country form
import 'package:flutter/material.dart';
import 'package:maqqi/model/country/country.dart';
import 'package:maqqi/provider/country_provider/country_provider.dart';
import 'package:provider/provider.dart';

class CountryForm extends StatefulWidget {
  const CountryForm({Key? key}) : super(key: key);
  @override
  _CountryFormState createState() => _CountryFormState();
}

class _CountryFormState extends State<CountryForm> {
  final TextStyle textstyle =
      const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

// global key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // name controller
  final TextEditingController _nameController = TextEditingController();
  // capital controller
  final TextEditingController _capitalController = TextEditingController();
  // country code controller
  final TextEditingController _countryCodeController = TextEditingController();
  // currency controller
  final TextEditingController _currencyController = TextEditingController();
  // latitude controller
  final TextEditingController _latitudeController = TextEditingController();
  // longitude controller
  final TextEditingController _longitudeController = TextEditingController();
  // phone code controller
  final TextEditingController _phoneCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Country Form"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a name";
                        }
                        return null;
                      },
                      controller: _nameController,
                      decoration: inputDecoration('Name', 'Enter name'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Country code";
                        }
                        return null;
                      },
                      controller: _countryCodeController,
                      decoration:
                          inputDecoration('Country Code', 'Enter country code'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Capital city name";
                        }
                        return null;
                      },
                      controller: _capitalController,
                      decoration:
                          inputDecoration('Capital', 'Enter capital city name'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Currency symbol";
                        }
                        return null;
                      },
                      controller: _currencyController,
                      decoration:
                          inputDecoration('Currency', 'Enter currency symbol'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Phone code";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: _phoneCodeController,
                      decoration:
                          inputDecoration('Phone Code', 'Enter phone code'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Latitude";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: _latitudeController,
                      decoration: inputDecoration(
                          'Latitude', 'Enter Latitude Coordinates'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Longitude";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: _longitudeController,
                      decoration: inputDecoration(
                          'Longitude', 'Enter Longitude Coordinates'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      color: Colors.red,
                      minWidth: 160,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );

                          // create country model
                          final Country country = Country(
                            Name: _nameController.text,
                            Capital: _capitalController.text,
                            CountryCode:
                                int.tryParse(_countryCodeController.text),
                            Currency: _currencyController.text,
                            PhoneCode: int.tryParse(_phoneCodeController.text),
                            Latitude: _latitudeController.text,
                            Longitude: _longitudeController.text,
                          );
                          // add country to provider state management
                          Provider.of<CountryProvider>(context, listen: false)
                              .addCountry(country)
                              .then((Country newCountry) {
                            Navigator.pop(context);
                          });
                        }
                      },
                      child: Text(
                        'Save',
                        style: textstyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String text, String hint,
      {String value = ""}) {
    return InputDecoration(
      border: OutlineInputBorder(),
      hintText: hint,
      label: Text(text),
    );
  }
}
