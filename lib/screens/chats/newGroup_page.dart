import 'package:flutter/material.dart';

class NewGroupPage extends StatefulWidget {
  const NewGroupPage({super.key});

  @override
  State<NewGroupPage> createState() => _NewGroupPageState();
}

class _NewGroupPageState extends State<NewGroupPage> {
  String dropDownList = 'Viewer';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 18,
                    )),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  'Create New Group',
                  style: TextStyle(fontSize: 18),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.cancel_outlined)),
              ],
            ),
            const Divider(
              endIndent: 15,
              indent: 15,
              thickness: 1,
            ),
            const SizedBox(height: 10),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 11.0, bottom: 5),
                            child: Text("Group Name"),
                          ),
                          TextFormField(

                              // autofocus: true,
                              decoration: InputDecoration(
                                hintText: 'Enter Group Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF1D55A4),
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF1D55A4)),
                                ),
                              ),
                              onTap: () {}),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 11.0, bottom: 5),
                            child: Text(
                              "Add Members",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextFormField(
                              autofocus: true,
                              decoration: InputDecoration(
                                suffixIcon: const Icon(Icons.search),
                                hintText: 'Search by name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF1D55A4),
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 20),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF1D55A4)),
                                ),
                              ),
                              onTap: () {}),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                    "https://source.unsplash.com/random"),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Shubham Prajapati",
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    "@softHeartedGentalmen",
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              //--------DropDown for Viewver Admin----------------
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFFBEBEBE), width: 1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                height: 30, // Set your desired height
                                width: 120, // Set your desired width
                                child: Center(
                                  child: DropdownButton<String>(
                                    value: dropDownList,
                                    icon: const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Icon(Icons
                                          .arrow_drop_down_circle_outlined),
                                    ),
                                    iconSize: 18,
                                    elevation: 16,
                                    style: const TextStyle(color: Colors.black),
                                    underline: const SizedBox(),
                                    // Hide the default underline
                                    onChanged: (String? newValue) {
                                      if (newValue != null) {
                                        // Update the selected value on user interaction
                                        dropDownList = newValue;
                                        // You can add additional functionality here based on the selection
                                      }
                                    },
                                    items: <String>['Viewer', 'Admin']
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.remove_red_eye_outlined,
                                              color: Color(0xFF0AB210),
                                            ),
                                            // Leading icon
                                            const SizedBox(width: 8),
                                            // Adjust the spacing
                                            Text(value),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              //---------------------------

                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.do_disturb_on_outlined,
                                    color: Colors.red,
                                  ))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(height: 130,color: Colors.white,
        child: Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // createfolderProvider.createfoldertext;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color((0xFF1D55A4)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    fixedSize: const Size(358, 35),
                  ),
                  child: const Text(
                    'Create',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  // Close bottom sheet
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Color(0xFF7A7A7A)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
