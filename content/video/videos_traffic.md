---
title: "Videos Traffic"
date: 2023-06-22T20:43:57+03:00
draft: false
---

You can get the combined traffic for your videos starting from the subscription period start date till now.

{{% notice note %}}
Base url `https://api.omegastream.net/company/client/video` this will be called from now as *`{base_url}`*
{{% /notice %}}

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

- ```uuids```: array of video's uuids. min length is 1 and max length is 50.

### Query Params

- `start_time` (optional): start time to get the traffic from. format is `YYYY-MM-DDTHH:mm:ssZ`.
- `end_time` (optional): end time to get the traffic to. format is `YYYY-MM-DDTHH:mm:ssZ`.

### Headers

| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |   |


### Response

Status Code: `200` OK

```json
{
    "checked_uuids": [
        "a0dc8dbf-3126-4805-89a1-662a33331f93"
        "ec070291-f584-4ce0-af1a-58fbe46cb905"
    ],
    "end_time": "2023-07-29T00:00:14Z",
    "queried_at": "2023-09-26T19:10:37.996208329Z",
    "start_time": "2023-06-01T00:00:14Z",
    "videos_traffic": {
        "number_of_requests": 6650,
        "traffic_in_bytes": 1231674842132,
        "traffic_in_gb": 1231.67,
        "traffic_in_tb": 1.23
    }
}
```

- `end_time` and `start_time` are nullable.