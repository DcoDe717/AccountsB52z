import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}

class ScreenSelectEntryFields extends StatefulWidget {
  const ScreenSelectEntryFields({super.key});

  @override
  State<ScreenSelectEntryFields> createState() =>
      _ScreenSelectEntryFieldsState();
}

class _ScreenSelectEntryFieldsState extends State<ScreenSelectEntryFields> {
  static final List<Animal> _animals = [   
    Animal(id: 6, name: "July 22"),
    Animal(id: 7, name: "Aug 22"),
    Animal(id: 8, name: "Sept 22"),
    Animal(id: 9, name: "Oct 22"),
    Animal(id: 10, name: "Nov 22"),
    Animal(id: 11, name: "Dec 22"),
    Animal(id: 12, name: "Jan 23"),
    Animal(id: 13, name: "Feb 23"),
    Animal(id: 14, name: "March 23"),
 
  ];

  final _items = _animals
      .map((animal) => MultiSelectItem<Animal?>(animal, animal.name))
      .toList();

  List<Animal?> _selectedAnimals1 = [];
  List<Animal?> _selectedAnimals2 = [];
  List<Animal?> _selectedAnimals3 = [];
  List<Animal?> _selectedAnimals4 = [];
  List<Animal?> _selectedAnimals5 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
                    colors: [Color.fromARGB(202, 237, 123, 132), Color.fromARGB(195, 144, 85, 255)])),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              // labelTitle("Select Monthly Installments"),
              MultiSelectChipField<Animal?>(
                // chipShape: StadiumBorder(side:BorderSide(width: 20) ),
                // closeSearchIcon: Icon(Icons.search_rounded),
                // chipWidth: 50,
                // height: 25,
                scrollBar: HorizontalScrollBar(isAlwaysShown: true),
                scroll: false,
                // closeSearchIcon: Icon(Icons.search),

                title: const Text("Select Monthly Installments"),

                items: _items,
                icon: const Icon(Icons.check),
                onTap: (values) {
                  _selectedAnimals1 = values;
                },
              ),
              SizedBox(height: 40),

              MultiSelectChipField<Animal?>(
                // chipShape: StadiumBorder(side:BorderSide(width: 20) ),
                // closeSearchIcon: Icon(Icons.search_rounded),
                // chipWidth: 50,
                // height: 25,
                scrollBar: HorizontalScrollBar(isAlwaysShown: true),
                scroll: false,
                // closeSearchIcon: Icon(Icons.search),

                title: const Text("Select Loan Installments"),

                items: _items,
                icon: const Icon(Icons.check),
                onTap: (values) {
                  _selectedAnimals1 = values;
                },
              ),
              SizedBox(height: 40),
              FilledButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.done),
                  label: Text('Submit'))
            ],
          ),
        ),
      ),
    ));
  }

  // void _startAnimation(ScrollController controller) {
  //   // when using more than one animation, use async/await
  //   Future.delayed(const Duration(milliseconds: 5000), () async {
  //     await controller.animateTo(controller.position.maxScrollExtent,
  //         duration: Duration(milliseconds: 8000), curve: Curves.linear);

  //     await controller.animateTo(controller.position.minScrollExtent,
  //         duration: Duration(milliseconds: 1250),
  //         curve: Curves.fastLinearToSlowEaseIn);
  //   });
  // }

  Widget labelTitle(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 16.5,
        letterSpacing: 0.2,
      ),
    );
  }
}
