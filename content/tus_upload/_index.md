---
title: "TUS Resumable Upload"
date: 2023-08-17T17:13:04+03:00
draft: false
---

The resumable upload endpoint allows resumable and presigned uploads of video files. This allows end-users to upload directly to Omegastream and greatly improves reliability on poor networks and mobile connections.

The endpoint uses the open protocol for resumable file uploads called [tus](https://tus.io/). Before a video can be uploaded through the tus endpoint a video object must be created through the Create Video call to obtain the video ID.

### TUS Endpoint

```url
https://api.omegastream.net/tusupload
```

### Authentication

To authenticate a request, two headers must be passed with the tus upload.

- `Signature`: should contain the pre-generated SHA256 header.
- `Expiration`: should contain the UNIX timestamp of the upload expiration time.
- `Video-Id`: should contain the video ID of the [previously created video](/video/create_video) object.

### Video Metadata Parameters

- `filetype`: should contain the file type of the uploaded video.
- `fileName`: should contain the file name of the uploaded video.

### Presigned Request Signature Generation

To generate the authorization signature, the following pseudo-function should be used:

```c
sha256(apiKey + expiration + videoId)
```

### Upload Example JavaScript

```javascript
const fs = require('fs');
const tus = require('tus-js-client');
const crypto = require('crypto');

// Path to local file
const path = "PATH_TO_LOCAL_FILE"

// Your API key from the dashboard
const apiKey = "ky_6cf8213c7badf0b3c03f"

// The video UUID of the previously created video object
const videoId = "a23fe4e9-dc10-4f6b-bda5-afe93f8d5d4a"

// Expiration time in seconds should be at least 1 hour from now
const expiration = Math.floor(Date.now() / 1000) + 3600;

function getSignature() {
    const val = apiKey + expiration + videoId
    const signature = crypto.createHash('sha256').update(val).digest('hex');
    return signature;    
}

function main() {
    const file = fs.createReadStream(path);
    const signature = getSignature();

    const upload = new tus.Upload(file, {
        endpoint: "https://api.omegastream.net/tusupload",
        retryDelays: [0, 3000, 5000, 10000, 20000, 60000, 60000],
        // Upload headers with the signature and expiration
        headers: {
            signature: signature,
            expiration: expiration,
            'Video-Id': videoId,
        },
        // The metadata contains the file name and file type
        metadata: {
            filename: 'video.mp4',
            filetype: 'video/mp4',
        },
        onError: function (error) {
            console.log("Failed because: " + error)
        },
        onProgress: function (bytesUploaded, bytesTotal) {
            var percentage = (bytesUploaded / bytesTotal * 100).toFixed(2)
            console.log(bytesUploaded, bytesTotal, percentage + "%")
        },
        onSuccess: function () {
            console.log("Uploaded %s", upload.url)
        },        
    })
    upload.start()
}

main();
```
