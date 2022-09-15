---
title: "Fetch All"
date: 2022-09-15T22:33:02+02:00
draft: false
---

Fetches all company webhooks endpoints.

{{% notice note %}}
Base url `https://omega-stream.site/company` this will be called from now as *`[base_url]`*
{{% /notice %}}

### Endpoint
```url
GET: [base_url]/client/webhooks/all
```

### Headers
| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer {{api_key}} | api key is very important here to authorize your request. |
| Content-Type  | application/json   |                                                         |


### Response
```json
[
    {
        "id": "631c652c15fa642045c1a003",
        "created_at": "2022-09-10T10:21:32.192Z",
        "updated_at": "2022-09-10T10:21:32.192Z",
        "coid": "omega-cop-KoNef9DB5i",
        "url": "http://localhost:6060/webhook",
        "description": null,
        "events": [
            "video.uploaded",
            "video.ready_for_processing",
            "video.in_progress",
            "video.completed_processing",
            "video.process_failed",
            "video.process_succeeded",
            "video.ready_to_watch"
        ],
        "active": true
    }
]
```

{{% notice tip %}}
To learn more about the available *events* and how to use theme, checkout [Create Endpoint](/video/webhooks/create_endpoint.md).
{{% /notice %}}