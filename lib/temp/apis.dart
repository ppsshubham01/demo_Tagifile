// // Fetched data after login:
// /// ######################### after log in fetched Data get this
// // {
// // result: [
// // {
// // parent_id: 36206,
// // user_id: 552,
// // shared_created_by_id: null,
// // shared_updated_by_id: null,
// // create_date: 2023-12-28T05:09:16.623319Z,
// // update_date: 2023-12-28T05:09:16.891936Z,
// // content_name: 123,
// content_id: 36729,
// // content_parent_id: 36206,
// // content_size: 0,
// // system_last_modified: 2023-12-28T05:09:16.891976Z,
// // is_file: false,
// // blocks_count: 0, is_directory: true, shared_created_by_name: ,
// // shared_updated_by_name:
// // },
// //
// // {
// // parent_id: 36206, user_id: 552, shared_created_by_id: null,
// // shared_updated_by_id: null, create_date: 2024-01-11T05:31:05.144888Z,
// // update_date: 2024-01-11T05:31:05.465245Z, content_name: 55587lkjhgf4,
// // content_id: 37298, content_parent_id: 36206, content_size: 0, system_last_modified: 2024-01-11T05:31:05.465286Z,
// // is_file: false, blocks_count: 0, is_directory: true, shared_created_by_name: , shared_updated_by_name: },
// //
// // {parent_id: 36206, user_id: 552, shared_created_by_id: null, shared_updated_by_id: null,
// // create_date: 2024-01-11T05:27:55.353652Z, update_date: 2024-01-11T0



// ///######### api for list-Content Getting Data

// api link: POST method http://192.168.1.142:8001/tf/core/api/service/dev/v1/personal/content/v1/list_content/

// header: Content-Type : application/json

// Payload:

// {parent_id: 0, sort_order: "NULL", sort_by: "NULL", filter_by: "", content_path: "", only_dirs: false,…}
//
// content_path: ""filter_by: ""
// only_dirs: false
// org_id: null
// page_range: {pg_from: 0, pg_to: 100}
// pg_from: 0
// pg_to: 100
// parent_id: 0
// sort_by: "NULL"
// sort_order: "NULL"


// Preview:
// {,…}
// current_parent: 36206
// page_data: {count_of_files: 1, count_of_folders: 6}
// count_of_files: 1
// count_of_folders: 6
// path: ""
// result: [{parent_id: 36206, user_id: 552, shared_created_by_id: null, shared_updated_by_id: null,…},…]
// 0: {parent_id: 36206, user_id: 552, shared_created_by_id: null, shared_updated_by_id: null,…}
// 1: {parent_id: 36206, user_id: 552, shared_created_by_id: null, shared_updated_by_id: null,…}
// 2: {parent_id: 36206, user_id: 552, shared_created_by_id: null, shared_updated_by_id: null,…}
// 3: {parent_id: 36206, user_id: 552, shared_created_by_id: null, shared_updated_by_id: null,…}
// 4: {parent_id: 36206, user_id: 552, shared_created_by_id: null, shared_updated_by_id: null,…}
// 5: {parent_id: 36206, user_id: 552, shared_created_by_id: null, shared_updated_by_id: null,…}
// 6: {user_id: 552, shared_created_by_id: null, shared_updated_by_id: null,…}
// shared_with: []
// sharing_data: {
// 193595: {groups: false, users: false}, D37298: {users: false, groups: false},…}
// 193595: {groups: false, users: false}
// D36729: {users: false, groups: false}
// D37260: {users: false, groups: false}
// D37292: {users: false, groups: false}
// D37294: {users: false, groups: false}
// D37295: {users: false, groups: false}
// D37298: {users: false, groups: false}
// groups: false
// users: false


// Whole Response:--

// {
// "result": [
// {
// "parent_id": 37439,
// "user_id": 610,
// "shared_created_by_id": null,
// "shared_updated_by_id": null,
// "create_date": "2024-01-29T06:38:21.271123Z",
// "update_date": "2024-01-29T06:38:21.867282Z",
// "content_name": "daq",
// "content_id": 37492,
// "content_parent_id": 37439,
// "content_size": 0,
// "system_last_modified": "2024-01-29T06:38:21.867326Z",
// "is_file": false,
// "blocks_count": 0,
// "is_directory": true,
// "shared_created_by_name": "",
// "shared_updated_by_name": "",
// "shared_created_by_username": "",
// "shared_updated_by_username": ""
// },
// {
// "parent_id": 37439,
// "user_id": 610,
// "shared_created_by_id": null,
// "shared_updated_by_id": null,
// "create_date": "2024-01-28T05:27:40.737354Z",
// "update_date": "2024-01-28T05:27:41.513071Z",
// "content_name": "shubh",
// "content_id": 37484,
// "content_parent_id": 37439,
// "content_size": 0,
// "system_last_modified": "2024-01-28T05:27:41.513113Z",
// "is_file": false,
// "blocks_count": 0,
// "is_directory": true,
// "shared_created_by_name": "",
// "shared_updated_by_name": "",
// "shared_created_by_username": "",
// "shared_updated_by_username": ""
// },
// {
// "parent_id": 37439,
// "user_id": 610,
// "shared_created_by_id": null,
// "shared_updated_by_id": null,
// "create_date": "2024-01-22T11:05:22.537702Z",
// "update_date": "2024-01-22T11:05:22.539537Z",
// "content_name": "tagi-Audio",
// "content_id": 37452,
// "content_parent_id": 37439,
// "content_size": 0,
// "system_last_modified": "2024-01-22T11:05:22.539573Z",
// "is_file": false,
// "blocks_count": 0,
// "is_directory": true,
// "shared_created_by_name": "",
// "shared_updated_by_name": "",
// "shared_created_by_username": "",
// "shared_updated_by_username": ""
// },
// {
// "user_id": 610,
// "shared_created_by_id": null,
// "shared_updated_by_id": null,
// "create_date": "2024-01-19T07:57:06.825433Z",
// "update_date": "2024-01-19T07:57:09.513936Z",
// "content_name": "lake.jpg",
// "content_id": 195723,
// "content_size": 278910,
// "parent_id": 37439,
// "is_file": true,
// "content_parent_id": 37439,
// "system_last_modified": "2024-01-19T07:57:09.513970Z",
// "blocks_count": 1,
// "is_directory": false,
// "shared_created_by_name": "",
// "shared_updated_by_name": ""
// },
// {
// "user_id": 610,
// "shared_created_by_id": null,
// "shared_updated_by_id": null,
// "create_date": "2024-01-24T11:11:03.308167Z",
// "update_date": "2024-01-24T11:11:05.920146Z",
// "content_name": "photo-1705318778520-3367daf5ace7.jpg",
// "content_id": 195890,
// "content_size": 122779,
// "parent_id": 37439,
// "is_file": true,
// "content_parent_id": 37439,
// "system_last_modified": "2024-01-24T11:11:05.920178Z",
// "blocks_count": 1,
// "is_directory": false,
// "shared_created_by_name": "",
// "shared_updated_by_name": ""
// },
// {
// "user_id": 610,
// "shared_created_by_id": null,
// "shared_updated_by_id": null,
// "create_date": "2024-01-27T06:24:03.953493Z",
// "update_date": "2024-01-27T06:24:06.713801Z",
// "content_name": "user.jpg",
// "content_id": 195914,
// "content_size": 154686,
// "parent_id": 37439,
// "is_file": true,
// "content_parent_id": 37439,
// "system_last_modified": "2024-01-27T06:24:06.713843Z",
// "blocks_count": 1,
// "is_directory": false,
// "shared_created_by_name": "",
// "shared_updated_by_name": ""
// },
// {
// "user_id": 610,
// "shared_created_by_id": null,
// "shared_updated_by_id": null,
// "create_date": "2024-01-27T13:01:34.220446Z",
// "update_date": "2024-01-27T13:01:37.041224Z",
// "content_name": "ice-creame.mp4",
// "content_id": 195929,
// "content_size": 42007,
// "parent_id": 37439,
// "is_file": true,
// "content_parent_id": 37439,
// "system_last_modified": "2024-01-27T13:01:37.041256Z",
// "blocks_count": 1,
// "is_directory": false,
// "shared_created_by_name": "",
// "shared_updated_by_name": ""
// },
// {
// "user_id": 610,
// "shared_created_by_id": null,
// "shared_updated_by_id": null,
// "create_date": "2024-01-29T09:06:46.110449Z",
// "update_date": "2024-01-29T09:06:49.044895Z",
// "content_name": "917069865887_status_03878ce99dd04157bf87d4b05a036080.mp4",
// "content_id": 195966,
// "content_size": 2528409,
// "parent_id": 37439,
// "is_file": true,
// "content_parent_id": 37439,
// "system_last_modified": "2024-01-29T09:06:49.044928Z",
// "blocks_count": 1,
// "is_directory": false,
// "shared_created_by_name": "",
// "shared_updated_by_name": ""
// }
// ],
// "path": "",
// "current_parent": 37439,
// "sharing_data": {
// "195723": {
// "groups": false,
// "users": true
// },
// "195890": {
// "groups": false,
// "users": false
// },
// "195914": {
// "groups": false,
// "users": false
// },
// "195929": {
// "groups": false,
// "users": false
// },
// "195966": {
// "groups": false,
// "users": false
// },
// "D37492": {
// "users": false,
// "groups": false
// },
// "D37484": {
// "users": false,
// "groups": false
// },
// "D37452": {
// "users": true,
// "groups": false
// }
// },
// "shared_with": [],
// "page_data": {
// "count_of_files": 5,
// "count_of_folders": 3,
// "page_data": {
// "next_files_from": 0,
// "next_files_till": 20,
// "next_folders_from": 0,
// "next_folders_till": 20,
// "file_sort_key": "TYPE",
// "folder_sort_key": "DATE",
// "file_sort_order": "ASC",
// "folder_sort_order": "DESC",
// "next_files_only": false,
// "next_folders_only": false
// }
// }
// }

// Headers:-

// Accept:application/json
// Authorization : Token 1938157ea06eae6a70567e31a10c2fbb287bca5b
// Connection : keep-alive
// Content-Length : 156
// Content-Type : application/json


//method for storing Data
// FutureBuilder(
// builder: (context, snapshot) {
// if (snapshot.connectionState == ConnectionState.waiting) {
// return const Center(
// child: CircularProgressIndicator(),
// );
// } else if (snapshot.hasError) {
// return Center(
// child: Text('Error: ${snapshot.error}'),
// );
// } else if (!snapshot.hasData) {
// return const Center(
// child: Text('No data available'),
// );
// } else {
// // Get the list of user details
// print(snapshot.data);
// List<UserIdSuccess>? userList = [];
// // List<UserIdSuccess>? userList = snapshot.data as List<UserIdSuccess>;// Got a null data
// userList = snapshot.data; // Got a null data
//
// print(userList);
// print("----------------useridlist");
//
// return SingleChildScrollView(
// child: Padding(
// padding: const EdgeInsets.all(18.0),
// child: Container(
// color: Colors.red,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: userList!.map((user) {
// return ListTile(
// title:
// Text('Email: ${user.data?.user.email}'),
// subtitle:
// Text('TfName: ${user.data?.token}'),
// );
// }).toList(),
// ),
// ),
// ),
// );
// }
// },
// future: ApiService().getuserSwitchIdPrefs(),
// ),


