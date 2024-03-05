import 'package:flutter/material.dart';
import 'package:multiple_search_selection/createable/create_options.dart';
import 'package:multiple_search_selection/multiple_search_selection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<City> cities = [];
  @override
  void initState() {
    cities = [
      City(name: 'Mumbai'),
      City(name: 'Delhi'),
      City(name: 'Bangalore'),
      City(name: 'Chennai'),
      City(name: 'Kolkata'),
      City(name: 'Hyderabad'),
      City(name: 'Ahmedabad'),
      City(name: 'Jaipur'),
      City(name: 'Lucknow'),
      City(name: 'Surat'),
      City(name: 'Kanpur'),
      City(name: 'Nagpur'),
      City(name: 'Patna'),
      City(name: 'Indore'),
      City(name: 'Thane'),
      City(name: 'Bhopal'),
      City(name: 'Visakhapatnam'),
      City(name: 'Vadodara'),
      City(name: 'Miami'),
      City(name: 'New York'),
      City(name: 'Los Angeles'),
      City(name: 'Chicago'),
      City(name: 'San Francisco'),
      City(name: 'Miami'),
      City(name: 'Philadelphia'),
      City(name: 'San Antonio'),
      City(name: 'San Diego'),
      City(name: 'Dallas'),
      City(name: 'San Jose'),
      City(name: 'Austin'),
      City(name: 'Jacksonville'),
      City(name: 'Indianapolis'),
      City(name: 'Columbus'),
      City(name: 'Fort Worth'),
      City(name: 'Charlotte'),
      City(name: 'Seattle'),
      City(name: 'Denver'),
      City(name: 'Washington, D.C.'),
      City(name: 'Boston'),
      City(name: 'El Paso'),
      City(name: 'Nashville'),
      City(name: 'Oklahoma City'),
      City(name: 'Pune'),
      City(name: 'Kathmandu'),
      City(name: 'Pokhara'),
      City(name: 'Lalitpur'),
      City(name: 'Bhaktapur'),
      City(name: 'Biratnagar'),
      City(name: 'Butwal'),
      City(name: 'Nepalgunj'),
      City(name: 'Dharan'),
      City(name: 'Hetauda'),
      City(name: 'Birgunj'),
      City(name: 'Janakpur'),
      City(name: 'Dhangadhi'),
      City(name: 'Bharatpur'),
      City(name: 'Siddharthanagar'),
      City(name: 'Ghorahi'),
      City(name: 'Dhankuta'),
      City(name: 'Ilam'),
      City(name: 'Birendranagar'),
      City(name: 'Tansen'),
      City(name: 'Rajbiraj'),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Multiple Search Selection")),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.5,
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: MultipleSearchSelection<City>.creatable(
              // title: Padding(
              //   padding: const EdgeInsets.all(12.0),
              //   child: Text(
              //     'City',
              //     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              //           fontSize: 22,
              //           fontWeight: FontWeight.bold,
              //         ),
              //   ),
              // ),
              // showClearSearchFieldButton: true,
              createOptions: CreateOptions(
                create: (text) {
                  return City(
                    name: text,
                  );
                },
                createBuilder: (text) => Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Create "$text"'),
                  ),
                ),
                // pickCreatedItem: true,
              ),
              items: cities,
              fieldToCheck: (c) {
                return c.name;
              },
              itemBuilder: (country, index) {
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color.fromARGB(255, 120, 143, 161),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 12,
                      ),
                      child: Text(country.name),
                    ),
                  ),
                );
              },
              pickedItemBuilder: (country) {
                return Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 211, 150, 150),
                      borderRadius: BorderRadius.circular(4)),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [Text(country.name), Icon(Icons.close)],
                    ),
                  ),
                );
              },
              selectAllButton: Padding(
                padding: const EdgeInsets.all(12.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 209, 100, 100)),
                      borderRadius: BorderRadius.circular(4)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Select All',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
              clearAllButton: Padding(
                padding: const EdgeInsets.all(12.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(4)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Clear All',
                      style: TextStyle(color: Colors.red),
                      // style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
              caseSensitiveSearch: false,
              fuzzySearch: FuzzySearch.none,
              itemsVisibility: ShowedItemsVisibility.alwaysOn,
              showSelectAllButton: true,
              maximumShowItemsHeight: 525,
              searchField: TextField(
                decoration: InputDecoration(
                  disabledBorder: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey[100],
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Type here to search',
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(8),
                  // ),
                  contentPadding: const EdgeInsets.all(12),
                ),
              )),
        ),
      ),
    );
  }
}

class City {
  final String name;
  City({required this.name});
}
