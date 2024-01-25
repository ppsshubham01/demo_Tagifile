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
// "create_date": "2024-01-25T06:53:38.974157Z",
// "update_date": "2024-01-25T06:53:39.304467Z",
// "content_name": "ssq",
// "content_id": 37464,
// "content_parent_id": 37439,
// "content_size": 0,
// "system_last_modified": "2024-01-25T06:53:39.304507Z",
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
// "create_date": "2024-01-25T06:44:54.509082Z",
// "update_date": "2024-01-25T06:44:55.197406Z",
// "content_name": "aa",
// "content_id": 37463,
// "content_parent_id": 37439,
// "content_size": 0,
// "system_last_modified": "2024-01-25T06:44:55.197449Z",
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
// "create_date": "2024-01-24T11:11:48.989212Z",
// "update_date": "2024-01-24T11:11:49.226163Z",
// "content_name": "G-an",
// "content_id": 37462,
// "content_parent_id": 37439,
// "content_size": 0,
// "system_last_modified": "2024-01-24T11:11:49.226203Z",
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
// "parent_id": 37439,
// "user_id": 610,
// "shared_created_by_id": null,
// "shared_updated_by_id": null,
// "create_date": "2024-01-19T07:54:31.593625Z",
// "update_date": "2024-01-19T07:54:31.852500Z",
// "content_name": "gavar1",
// "content_id": 37440,
// "content_parent_id": 37439,
// "content_size": 0,
// "system_last_modified": "2024-01-19T07:54:31.852528Z",
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
// }
// ],
// "path": "",
// "current_parent": 37439,
// "sharing_data": {
// "195890": {
// "groups": false,
// "users": false
// },
// "195723": {
// "groups": false,
// "users": true
// },
// "D37464": {
// "users": true,
// "groups": false
// },
// "D37463": {
// "users": false,
// "groups": false
// },
// "D37462": {
// "users": false,
// "groups": false
// },
// "D37452": {
// "users": false,
// "groups": false
// },
// "D37440": {
// "users": false,
// "groups": false
// }
// },
// "shared_with": [],
// "page_data": {
// "count_of_files": 2,
// "count_of_folders": 5
// }
// }


// Headers:-

// Accept:application/json
// Authorization : Token 1938157ea06eae6a70567e31a10c2fbb287bca5b
// Connection : keep-alive
// Content-Length : 156
// Content-Type : application/json




