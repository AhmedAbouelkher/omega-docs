---
title: "Update Collection"
date: 2023-08-17T17:00:07+03:00
draft: false
---

## Endpoint

```url
PUT: https://api.omegastream.net/company/client/collections
```

```json
{
    "name": "new collection name",
}
```

- `name`: new collection name. it should be at most 128 characters length.


## Headers

| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |   |


## Response

Status Code: `201` Created

```json
{
    "id": "64dcdbe1ae6153f5cc03a735",
    "created_at": "2023-08-16T14:23:29.471Z",
    "updated_at": "2023-08-16T14:23:29.471Z",
    "deleted_at": null,
    "coid": "omega-cop-223411c1",
    "name": "new collection name"
}
```