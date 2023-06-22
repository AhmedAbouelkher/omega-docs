---
title: "Videos Traffic"
date: 2023-06-22T20:43:57+03:00
draft: false
---

{{% notice note %}}
Base url `https://api.omegastream.net/company/client/video` this will be called from now as *`{base_url}`*
{{% /notice %}}

You can get the combined traffic for your videos starting from the subscription period start date till now.

### Endpoint

```url
POST: {base_url}/traffic
```

### Request Body

```json
{
    "uuids": [
        "a0dc8dbf-3126-4805-89a1-662a33331f93"
        "ec070291-f584-4ce0-af1a-58fbe46cb905"
    ]
}
```

- ```uuids```: array of video's uuids. min length is 1 and max length is 30.

### Headers

| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |   


### Response

Status Code: `200`

```json
{
    "checked_uuids": [
        "a0dc8dbf-3126-4805-89a1-662a33331f93"
        "ec070291-f584-4ce0-af1a-58fbe46cb905"
    ],
    "queried_at": "2023-06-22T17:04:05Z",
    "videos_traffic": {
        "number_of_requests": 6650,
        "traffic_in_bytes": 1231674842132,
        "traffic_in_gb": 1231.67,
        "traffic_in_tb": 1.23
    }
}
```