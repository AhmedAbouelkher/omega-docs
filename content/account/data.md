---
title: "Company Data"
date: 2022-09-15T17:39:41+02:00
draft: false
---

{{% notice note %}}
Base url `https://omegastream.net/company` this will be called from now as *`[base_url]`*
{{% /notice %}}

From here you can fetch your basic company info using your api key.

### Endpoint
```url
GET: [base_url]/client/account/data
```

### Headers
| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |                                                         |


### Response
```json
{
    "id": "6318b6badf1e5679e5ce6bb4",
    "created_at": "2022-09-07T15:20:26.78Z",
    "updated_at": "2022-09-07T15:20:26.78Z",
    "deleted_at": null,
    "ocid": "omega-cop-KoNef9DB5i",
    "title": "kain edu",
    "email": "kain@omega.com",
    "phone_number": "01555555555",
    "storage_code": "93db1c64",
    "address": {
        "address_1": "",
        "country": "",
        "city": "",
        "state": "",
        "zip": ""
    },
    "Metadata": null
}
```