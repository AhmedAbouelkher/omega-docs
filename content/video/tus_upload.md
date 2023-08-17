---
title: "Upload Video"
date: 2023-06-22T20:52:43+03:00
draft: false
---

{{% notice warning %}}
Current TUS upload endpoint `https://api.omegastream.net/company/client/video/stream` is **deprecated** and will not receive future support.
This implementation will be removed in **01/01/2024**.
You can migrate to the [latest version V2](/tus_upload) which is more **secure** and **easier** to use.
{{% /notice %}}

{{% notice note %}}
Base url `https://api.omegastream.net/company/client/video/stream` this will be called from now as *`{base_url}`*
{{% /notice %}}


## Resumable uploads with tus (for large files)

### What is tus?

> tus is a protocol based on HTTP for resumable file uploads. Resumable means that an upload can be interrupted at any moment and can be resumed without re-uploading the previous data again. An interruption may happen willingly, if the user wants to pause, or by accident in case of an network issue or server outage.

[tus protocol](https://tus.io) is the recommended method for uploading large files to Omegastream from a computer. Popular programming languages have [tus client implementations](https://tus.io/implementations.html).

{{% notice note %}}
Important: Omegastream requires a minimum chunk size of 5,242,880 bytes when using TUS, unless the entire file is less than this amount.
We recommend increasing the chunk size to 52,428,800 bytes for better performance when the client connection is expected to be reliable.
Maximum chunk size can be 209,715,200 bytes.
{{% /notice %}}

{{% notice note %}}
Important: Omegastream requires a chunk size divisible by 256KiB (256x1024 bytes). Please round your desired chunk size to the nearest multiple of 256KiB.
The final chunk of an upload or uploads that fit within a single chunk are exempt from this requirement.
{{% /notice %}}

### Specifying upload options

The tus protocol allows you to add optional parameters [in the `Upload-Metadata` header](https://tus.io/protocols/resumable-upload.html#upload-metadata).

### Supported options in "Upload-Metadata"

- `title` Setting this key will set `meta.title` in the API and display the value as the name of the video in the dashboard.

- `collection`: collection id. ex: `63fcdbd82eec9b89aa5bfdf3` it can be empty.
  > if you don't want to add this video to any collection, you can leave this field empty.

    > You can move a video later to a collection using [Move Videos to Collection](/collection/move_videos_to_collection)

### Getting the video ID when using TUS

When an initial TUS request is made, Stream responds with a URL in the location header. While this URL may contain the video ID, it is not recommend to parse this URL to get the ID.

Instead, the `stream-media-id` HTTP header in the response should be used to retrieve the video ID.

For example, a request made to `https://api.omegastream.net/company/client/video/stream` with the TUS protocol, the response will contain a HTTP header like this:

```
stream-media-id: "3b1d4369-3b85-4c8e-bc91-83e519ee6ab3"
```

### Command-line example

You will also need to download a tus client. This tutorial will use the [tus Python client](https://github.com/tus/tus-py-client), available through pip, Python's package manager.

```bash
pip install -U tus.py
```

```bash
tus-upload --chunk-size 52428800 --header Authorization "Bearer <API_KEY>" <PATH_TO_VIDEO> https://api.omegastream.net/company/client/video/stream
```

In the beginning of the response from tus, you’ll see the endpoint for getting information about your newly uploaded video.

```bash
INFO Creating file endpoint
INFO Created: https://api.omegastream.net/company/client/video/stream3b1d4369-3b85-4c8e-bc91-83e519ee6ab3
...
```

### Golang Example

To get started, import a [tus](https://tus.io) client. You can use the [go-tus](https://github.com/eventials/go-tus) by [eventials](https://github.com/eventials) to upload from your Go applications.

```go
package main

import (
	"net/http"
	"os"

	tus "github.com/eventials/go-tus"
)

func main() {
	f, err := os.Open("videofile.mp4")

	if err != nil {
		panic(err)
	}

	defer f.Close()

	headers := make(http.Header)
	headers.Add("Authorization", "Bearer <API_KEY>")

	config := &tus.Config{
		ChunkSize:           50 * 1024 * 1024, // Required a minimum chunk size of 5MB, here we use 50MB.
		Header:              headers,
	}

	client, _ := tus.NewClient("https://api.omegastream.net/company/client/video/stream", config)

	upload, _ := tus.NewUploadFromFile(f)

	uploader, _ := client.CreateUpload(upload)

	_ := uploader.Upload()
}
```

You can also get the progress of the upload if you're running the upload in a goroutine.

```go
// returns the progress percentage.
upload.Progress()

// returns whether or not the upload is complete.
upload.Finished()
```

Please see [go-tus](https://github.com/eventials/go-tus) on GitHub for functionality such as resuming uploads and getting more details about the progress of the upload.

### Node.js Example

1. Install tus-js-client

```bash
npm install tus-js-client
```

1. Set up an index.js and configure:

- API endpoint with your Omega Account ID
- Request headers to include a API token

```js
var fs = require('fs');
var tus = require('tus-js-client');

// specify location of file you'd like to upload below
var path = __dirname + '/test.mp4';
var file = fs.createReadStream(path);
var size = fs.statSync(path).size;
var mediaId = '';

var options = {
  endpoint: 'https://api.omegastream.net/company/client/video/stream',
  headers: {
    Authorization: 'Bearer <API_KEY>',
  },
  chunkSize: 50 * 1024 * 1024, // Required a minimum chunk size of 5MB, here we use 50MB.
  resume: true,
  metadata: {
    filename: 'test.mp4',
    filetype: 'video/mp4',
    // The collection id of the uploaded video
    collection: "<COLLECTION_ID>"
  },
  uploadSize: size,
  onError: function (error) {
    throw error;
  },
  onProgress: function (bytesUploaded, bytesTotal) {
    var percentage = ((bytesUploaded / bytesTotal) * 100).toFixed(2);
    console.log(bytesUploaded, bytesTotal, percentage + '%');
  },
  onSuccess: function () {
    console.log('Upload finished');
  },
  onAfterResponse: function (req, res) {
    return new Promise(resolve => {
      var mediaIdHeader = res.getHeader('stream-media-id');
      if (mediaIdHeader) {
        mediaId = mediaIdHeader;
      }
      return resolve();
    });
  },
};

var upload = new tus.Upload(file, options);
upload.start();
```