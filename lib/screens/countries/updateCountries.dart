// country form
import 'package:flutter/material.dart';
import 'package:maqqi/model/country/country.dart';
import 'package:maqqi/provider/country_provider/country_provider.dart';
import 'package:provider/provider.dart';

class updateCountry extends StatefulWidget {
  const updateCountry({Key? key}) : super(key: key);
  @override
  _updateCountryState createState() => _updateCountryState();
}

class _updateCountryState extends State<updateCountry> {
  final TextStyle textstyle =
      const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

// global key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // id controller
  final TextEditingController _id = TextEditingController();
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
        title: const Text("Update Country Form"),
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
                      controller: _id,
                      decoration: inputDecoration('id', 'Enter id'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: inputDecoration('Name', 'Enter name'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _countryCodeController,
                      decoration:
                          inputDecoration('Country Code', 'Enter country code'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _capitalController,
                      decoration:
                          inputDecoration('Capital', 'Enter capital city name'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _currencyController,
                      decoration:
                          inputDecoration('Currency', 'Enter currency symbol'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _phoneCodeController,
                      decoration:
                          inputDecoration('Phone Code', 'Enter phone code'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _latitudeController,
                      decoration: inputDecoration(
                          'Latitude', 'Enter Latitude Coordinates'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
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
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );

                        // update country model
                        final Country updatecountry = Country(
                          Id: int.tryParse(_id.text),
                          Name: _nameController.text,
                          Capital: _capitalController.text,
                          CountryCode:
                              int.tryParse(_countryCodeController.text),
                          Currency: _currencyController.text,
                          PhoneCode: int.tryParse(_phoneCodeController.text),
                          Latitude: double.tryParse(_latitudeController.text),
                          Longitude: double.tryParse(_longitudeController.text),
                        );
                        // update country to provider state management
                        Provider.of<CountryProvider>(context, listen: false)
                            .updateCountry(updatecountry)
                            .then((Country updatedCountry) {
                          Navigator.pop(context);
                        });
                      },
                      child: Text(
                        'Update',
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
