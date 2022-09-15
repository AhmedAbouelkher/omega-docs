---
title: "Update Status"
date: 2022-09-15T23:15:34+02:00
draft: false
---

You simply activate or deactivate your endpoint.

{{% notice note %}}
Base url `https://omega-stream.site/company` this will be called from now as *`[base_url]`*
{{% /notice %}}

### Endpoint
```url
POST: [base_url]/company/webhooks/:id/status
```

- **:id** is the endpoint `_id` value.


### Headers
| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer {{api_key}} | api key is very important here to authorize your request. |
| Content-Type  | application/json   |     

### Request body
```json
{
    "active": true
}
```

- `active: true` the endpoint will be active and can receive its events.
- `active: false` the endpoint will be completely has no effect.