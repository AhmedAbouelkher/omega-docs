---
title: "Video Privacy"
date: 2023-06-22T20:49:12+03:00
draft: false
---


{{% notice note %}}
Base url `https://api.omegastream.net/company/client/video` this will be called from now as *`{base_url}`*
{{% /notice %}}

You can get the combined traffic for your videos starting from the subscription period start date till now.

### Endpoint
```url
PUT: {base_url}/:uuid/privacy
```
- **:uuid**: video's uuid. (ex: `a0dc8dbf-3126-4805-89a1-662a33331f93`)

```json
{
    "privacy": "private"
}
```

- Privacy can be `public` or `private`.

### Headers
| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |                                                         |

### Response
Status Code: `204`