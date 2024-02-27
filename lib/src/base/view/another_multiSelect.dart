import 'package:flutter/material.dart';
import 'package:multiselect_dropdown_flutter/multiselect_dropdown_flutter.dart';

class MultiSelectExample extends StatelessWidget {
  const MultiSelectExample({super.key});

  final List myList2 = const ['Dog', 'Cat', 'Mouse', 'Rabbit'];

  final List myList = const [
    {'id': 'dog', 'label': 'Dog'},
    {'id': 'cat', 'label': 'Cat'},
    {'id': 'mouse', 'label': 'Mouse'},
    {'id': 'rabbit', 'label': 'Rabbit'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Image.asset('assets/icon/voucher_title.png',
                    width: 18, height: 18, fit: BoxFit.fill),
                MultiSelectDropdown(
                  boxDecoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 0),
                  ),
                  list: myList,
                  initiallySelected: const [],
                  onChange: (newList) {
                    // your logic
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Image.asset('assets/icon/voucher_title.png',
                    width: 18, height: 18, fit: BoxFit.fill),
                MultiSelectDropdown.simpleList(
                  boxDecoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 0),
                  ),
                  list: myList2,
                  initiallySelected: const [],
                  onChange: (newList) {
                    // your logic
                  },
                  includeSearch: true,
                  includeSelectAll: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
