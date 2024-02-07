import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tagifiles/provider/auth_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


  void searchingElements(String text) {


  }

  final TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final globalProvider = Provider.of<AuthProvider>(context);

    return  Scaffold(
      appBar:  AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        title: Container(
          // height: 45,
          margin: const EdgeInsets.only(top: 5.0, bottom: 10.0),
          child: Center(
            child: SizedBox(
              width: double.infinity,
              height: 50.0,
              child: TextField(
                // maxLines: 1,
                //maxLength: 100,
                controller: searchTextController,
                onChanged: (value){
                  globalProvider.globalSearch(value);
                  // searchingElements(value);
                  
                },
                style: const TextStyle(overflow: TextOverflow.fade),
                decoration: InputDecoration(
                  hintText: 'Search..',
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                      const BorderSide(color: Colors.white, width: 2.0)
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                ),
                expands: false,
              ),
            ),
          ),
        ),
        backgroundColor: const Color(0xFF1D55A4),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.filter_list_outlined,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),

      body: Container(
        child: Text("Search_Tab"),
      ),
    );
  }
}
