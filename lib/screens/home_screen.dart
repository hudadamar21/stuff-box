import 'dart:math';

import 'package:stuffbox/widgets/app_header.dart';
import 'package:stuffbox/widgets/drawer/app_drawer.dart';
import 'package:flutter/material.dart';

import 'package:stuffbox/widgets/stuff_list.dart';
import 'package:stuffbox/data/data_stuff_list.dart';
import 'package:stuffbox/consts/PADDING_X.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _closeDrawer() {
    _scaffoldKey.currentState?.closeDrawer();
  }

  List<Stuff> stuffList = [...stuffs];
  String selectedColor = 'blue';

  List<Stuff> filteredItems = [];

  TextEditingController searchController = TextEditingController();
  final TextEditingController _nameStuffController = TextEditingController();
  final TextEditingController _priceStuffController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems.addAll(stuffList);
  }

  void addStuff(Stuff value) {
    setState(() {
      stuffList.add(value);
      filterSearchResults(searchController.text);
    });
  }

  void removeStuff(Stuff value) {
    setState(() {
      stuffList.remove(value);
      filterSearchResults(searchController.text);
    });
  }

  void filterSearchResults(String query) {
    List<Stuff> searchResults = [];

    if (query.isNotEmpty) {
      stuffList.forEach((item) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          searchResults.add(item);
        }
      });
    } else {
      searchResults.addAll(stuffList);
    }

    setState(() {
      filteredItems.clear();
      filteredItems.addAll(searchResults);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 30, right: 16),
        child: FloatingActionButton(
          onPressed: () {
            _showModalAddNewStuff(
                context: context,
                name: _nameStuffController,
                price: _priceStuffController,
                getValues: () {
                  Random random = Random();
                  int randomNumber = random.nextInt(4);
                  if (_nameStuffController.text.isNotEmpty &&
                      _priceStuffController.text.isNotEmpty) {
                    addStuff(
                      Stuff(
                        name: _nameStuffController.text,
                        price: int.parse(_priceStuffController.text),
                        bgColor: colorStuff[randomNumber].bgColor,
                        fgColor: colorStuff[randomNumber].fgColor,
                      ),
                    );
                    _nameStuffController.clear();
                    _priceStuffController.clear();
                    Navigator.of(context).pop();
                  }
                });
          },
          backgroundColor: const Color(0xFF22215B),
          child: const Icon(Icons.add),
        ),
      ),
      drawer: AppDrawer(onClose: _closeDrawer),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            AppHeader(openDrawer: _openDrawer),
            const SizedBox(height: 20),
            Padding(
              padding: PADDING_X,
              child: TextField(
                controller: searchController,
                onChanged: filterSearchResults,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.grey[800],
                  hintText: 'Search Stuff',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  contentPadding: const EdgeInsets.all(16),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const SizedBox(height: 12),
            Expanded(
              flex: 1,
              child: filteredItems.isNotEmpty
                  ? StuffList(
                      stuffList: filteredItems,
                      removeStuff: (value) {
                        removeStuff(value);
                      })
                  : const Text('Folder Not Found!'),
            ),
          ],
        ),
      ),
    );
  }
}

void _showModalAddNewStuff({
  required BuildContext context,
  required TextEditingController name,
  required TextEditingController price,
  required Function getValues,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
      return AlertDialog(
        title: const Text(
          'Add New Stuff',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Remove rounded corners
        ),
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              width: screenWidth,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: name,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.apps),
                      prefixIconColor: Colors.grey[800],
                      hintText: 'Name..',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: price,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.attach_money),
                      prefixIconColor: Colors.grey[800],
                      hintText: 'Price..',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(224, 224, 224, 1),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        actions: [
          InkWell(
            onTap: () {
              getValues();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 86, 125, 244),
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 12,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 24,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12.0),
        ],
      );
    },
  );
}
