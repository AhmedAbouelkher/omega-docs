---
title: "Delete Endpoint"
date: 2022-09-15T23:10:05+02:00
draft: false
---

Delete a specific webhook, thus not sending any future event to it.

{{% notice note %}}
Base url `https://omega-stream.site/company` this will be called from now as *`[base_url]`*
{{% /notice %}}

### Endpoint
```url
DELETE: [base_url]/company/webhooks/:id
```

- **:id** is the endpoint `_id` value.
 
### Headers
| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer {{api_key}} | api key is very important here to authorize your request. |
| Content-Type  | application/json   |                                                         |

### Response
Response code: `OK 200`
```json
{
    "message": "webhook endpoint deleted"
}
```