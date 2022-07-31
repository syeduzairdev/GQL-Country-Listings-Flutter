import 'package:flutter/material.dart';
import 'package:maqqi/model/country/country.dart';
import 'package:maqqi/provider/country_provider/country_provider.dart';
import 'package:maqqi/screens/countries/country_form.dart';
import 'package:maqqi/screens/countries/updateCountries.dart';
import 'package:provider/provider.dart';

class CountriesList extends StatelessWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // call provider to get the countries list
    final countriesModel = Provider.of<CountryProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Countries"),
      ),
      body: ListView.builder(
        itemCount: countriesModel.countries.length,
        itemBuilder: (context, index) {
          return Consumer<CountryProvider>(builder: (context, model, child) {
            return ListTile(
              title: Text(
                  ", ${model.countries[index].Capital}, ${model.countries[index].Currency}"),
              subtitle: Text(
                  "${model.countries[index].PhoneCode} ${model.countries[index].Longitude}, ${model.countries[index].Latitude}"),
              leading: IconButton(
                icon: const Icon(Icons.delete_forever, color: Colors.red),
                onPressed: () {
                  // alert dialog
                  showDeleteDialog(context, index);
                },
              ),
              trailing: IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: () {
                  // show updation country form
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const updateCountry();
                  }));
                },
              ),
            );
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
        onPressed: () {
          // show country form
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const CountryForm();
          }));
        },
      ),
    );
  }

  showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete"),
        content: const Text("Are you sure you want to delete?"),
        actions: <Widget>[
          ElevatedButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.redAccent),
            ),
            onPressed: () {
              // delete country from provider and provider delete form list and service
              Provider.of<CountryProvider>(context, listen: false)
                  .deleteCountry(index)
                  .then((Country deletedCountry) {
                Navigator.pop(context);
              });
            },
          ),
        ],
      ),
    );
  }
}
