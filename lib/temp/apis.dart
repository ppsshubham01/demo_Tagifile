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
// "parent_id": 36206,
// "user_id": 552,
// "shared_created_by_id": null,
// "shared_updated_by_id": null,
// "create_date": "2024-01-11T05:31:05.144888Z",
// "update_date": "2024-01-11T05:31:05.465245Z",
// "content_name": "55587lkjhgf4",
// "content_id": 37298,
// "content_parent_id": 36206,
// "content_size": 0,
// "system_last_modified": "2024-01-11T05:31:05.465286Z",
// "is_file": false,
// "blocks_count": 0,
// "is_directory": true,
// "shared_created_by_name": "",
// "shared_updated_by_name": ""
// },
// {
// "parent_id": 36206,
// "user_id": 552,
// "shared_created_by_id": null,
// "shared_updated_by_id": null,
// "create_date": "2024-01-11T05:27:55.353652Z",
// "update_date": "2024-01-11T05:27:55.941476Z",
// "content_name": "5874",
// "content_id": 37295,
// "content_parent_id": 36206,
// "content_size": 0,
// "system_last_modified": "2024-01-11T05:27:55.941515Z",
// "is_file": false,
// "blocks_count": 0,
// "is_directory": true,
// "shared_created_by_name": "",
// "shared_updated_by_name": ""
// },
// {
// "parent_id": 36206,
// "user_id": 552,
// "shared_created_by_id": null,
// "shared_updated_by_id": null,
// "create_date": "2024-01-11T05:25:34.263847Z",
// "update_date": "2024-01-11T05:25:34.621276Z",
// "content_name": "kk5678",
// "content_id": 37294,
// "content_parent_id": 36206,
// "content_size": 0,
// "system_last_modified": "2024-01-11T05:25:34.621320Z",
// "is_file": false,
// "blocks_count": 0,
// "is_directory": true,
// "shared_created_by_name": "",
// "shared_updated_by_name": ""
// },
// {
// "parent_id": 36206,
// "user_id": 552,
// "shared_created_by_id": null,
// "shared_updated_by_id": null,
// "create_date": "2024-01-11T05:04:48.077732Z",
// "update_date": "2024-01-11T05:04:48.750942Z",
// "content_name": "abc",
// "content_id": 37292,
// "content_parent_id": 36206,
// "content_size": 0,
// "system_last_modified": "2024-01-11T05:04:48.750985Z",
// "is_file": false,
// "blocks_count": 0,
// "is_directory": true,
// "shared_created_by_name": "",
// "shared_updated_by_name": ""
// },
// {
// "parent_id": 36206,
// "user_id": 552,
// "shared_created_by_id": null,
// "shared_updated_by_id": null,
// "create_date": "2024-01-10T05:27:49.942520Z",
// "update_date": "2024-01-10T05:27:50.312979Z",
// "content_name": "abcd",
// "content_id": 37260,
// "content_parent_id": 36206,
// "content_size": 0,
// "system_last_modified": "2024-01-10T05:27:50.313019Z",
// "is_file": false,
// "blocks_count": 0,
// "is_directory": true,
// "shared_created_by_name": "",
// "shared_updated_by_name": ""
// },
// {
// "parent_id": 36206,
// "user_id": 552,
// "shared_created_by_id": null,
// "shared_updated_by_id": null,
// "create_date": "2023-12-28T05:09:16.623319Z",
// "update_date": "2023-12-28T05:09:16.891936Z",
// "content_name": "123",
// "content_id": 36729,
// "content_parent_id": 36206,
// "content_size": 0,
// "system_last_modified": "2023-12-28T05:09:16.891976Z",
// "is_file": false,
// "blocks_count": 0,
// "is_directory": true,
// "shared_created_by_name": "",
// "shared_updated_by_name": ""
// },
// {
// "user_id": 552,
// "shared_created_by_id": null,
// "shared_updated_by_id": null,
// "create_date": "2023-11-22T06:46:13.629619Z",
// "update_date": "2023-11-22T06:46:16.825832Z",
// "content_name": "tagifiles-logo_White.svg",
// "content_id": 193595,
// "content_size": 2510,
// "parent_id": 36206,
// "is_file": true,
// "content_parent_id": 36206,
// "system_last_modified": "2023-11-22T06:46:16.825865Z",
// "blocks_count": 1,
// "is_directory": false,
// "shared_created_by_name": "",
// "shared_updated_by_name": ""
// }
// ],
// "path": "",
// "current_parent": 36206,
// "sharing_data": {
// "193595": {
// "groups": false,
// "users": false
// },
// "D37298": {
// "users": false,
// "groups": false
// },
// "D37295": {
// "users": false,
// "groups": false
// },
// "D37294": {
// "users": false,
// "groups": false
// },
// "D37292": {
// "users": false,
// "groups": false
// },
// "D37260": {
// "users": false,
// "groups": false
// },
// "D36729": {
// "users": false,
// "groups": false
// }
// },
// "shared_with": [],
// "page_data": {
// "count_of_files": 1,
// "count_of_folders": 6
// }
// }


// Headers:-

// Accept:application/json
// Authorization : Token 1938157ea06eae6a70567e31a10c2fbb287bca5b
// Connection : keep-alive
// Content-Length : 156
// Content-Type : application/json




