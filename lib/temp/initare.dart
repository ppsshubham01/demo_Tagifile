//
//
// initiate
// http://192.168.1.142:8001/tf/core/api/service/dev/v1/personal/content/v1/upload/initiate/
// Get method


//     Header
// Accept:*/*
// Accept-Encoding:gzip, deflate
// Accept-Language:en-GB,en-US;q=0.9,en;q=0.8,gu;q=0.7
// Authorization:Token 1938157ea06eae6a70567e31a10c2fbb287bca5b
// Connection:keep-alive
// Content-Type:application/json
// Host:192.168.1.142:8001
// Origin:http://192.168.1.142:3000
// Referer:http://192.168.1.142:3000/
// User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36
//
//
// Response
// {
//     "status": 200,
//         "upload_tracker_key
//     "msg": "Successfully created upload tracker.",
//     "data": {": "7287d3a7-6ed0-4203-b6af-1cf351d7ff76",
//         "target_id": 36206
//     }
// }
//
// Upload
// http://192.168.1.142:8006/tf/core/api/service/dev/v1/personal/content/file/v1/upload/
// POST
// HEADERS
//
// Accept:application/json, text/plain, */*
// Accept-Encoding:gzip, deflate
// Accept-Language:en-GB,en-US;q=0.9,en;q=0.8,gu;q=0.7
// Authorization:Token 1938157ea06eae6a70567e31a10c2fbb287bca5b
// Connection:keep-alive
// Content-Length:123710
// Content-Type:multipart/form-data; boundary=----WebKitFormBoundaryHtZePkk8l8uelzBB
// Host:192.168.1.142:8006
// In_org:false
//
// pAYLOAD
// name: photo-1705318778520-3367daf5ace7.jpg
// B_size: 122779
// upload_to: 36206
// type: image/jpeg
// directory_path:
// file: (binary)
// org_id:
// org_owner_id:
//
// rESPONCE
//
// {"data":195864,"message":"OK","status":200}

// LISTcONTENT
// content_path: ""
// filter_by: ""
// only_dirs: false
// org_id: null
// page_range: {pg_from: 0, pg_to: 100}
// pg_from: 0
// pg_to: 100
// parent_id: 0
// sort_by: "NULL"
// sort_order: "NULL"

// dETAILS