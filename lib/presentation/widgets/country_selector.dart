import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsapp/data/controllers/news_controller.dart';

class CountrySelector extends StatefulWidget{
  final String category;

  const CountrySelector({super.key, required this.category});

  @override
  State<CountrySelector> createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {
  final countries = ['ae', 'ar', 'at', 'au', 'be', 'bg', 'br', 'ca', 'ch', 'cn', 'co', 'cu', 'cz', 'de', 'ee', 'gf', 'gb', 'gr', 'hk', 'hu', 'id', 'ie', 'il', 'in', 'it', 'jp', 'kr', 'lt', 'lv', 'ma', 'mx', 'my', 'ng', 'nl', 'no', 'nz', 'ph', 'pl', 'pt', 'ro', 'rs', 'ru', 'sa', 'se', 'sg', 'si', 'sk', 'th', 'tr', 'tw', 'ua', 'us', 've', 'za'];
  late Box<String> countryBox;
  String? selectedCountry;

  final newsController = Get.put(NewsController());

  @override
  void initState() {
    super.initState();
    countryBox = Hive.box<String>('countryBox');
    selectedCountry = countryBox.get('selectedCountry');
    if (selectedCountry == null || selectedCountry == '') {
      countryBox.put('selectedCountry', 'us');
      selectedCountry = 'us';
    }
  }

  void saveCountry(String country) {
    setState(() {
      selectedCountry = country;
      countryBox.put('selectedCountry', country);
      newsController.fetchNews(selectedCountry!, widget.category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedCountry,
      dropdownColor: const Color(0xff0b4f7d),
      icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
      elevation: 16,
      underline: Container(
        height: 2,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          saveCountry(value!);
          selectedCountry = value;
        });
      },
      items: countries.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Center(
            child: Flag.fromString(value, borderRadius: 100, width: 32, height: 32, fit: BoxFit.fill),
          ),
        );
      }).toList(),
    );
  }
}