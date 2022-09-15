---
title: "Update Endpoint"
date: 2022-09-15T23:09:58+02:00
draft: false
---

{{% notice note %}}
Base url `https://omega-stream.site/company` this will be called from now as *`[base_url]`*
{{% /notice %}}

### Endpoint
```url
PUT: [base_url]/company/webhooks/:id
```

- **:id** is the endpoint `_id` value.
 
{{% notice warning %}}
Updating the webhook endpoint is the same as [creating a new one](/video/webhooks/create_endpoint/)
{{% /notice %}}