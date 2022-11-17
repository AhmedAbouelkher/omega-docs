---
title: "Revoke Api Key"
date: 2022-09-15T17:39:41+02:00
draft: false
---

If your api key has been compromised or you simply want to change it, you can revoke the old one and request a securely generated api key.

{{% notice note %}}
Base url `https://api.omegastream.net/company` this will be called from now as *`[base_url]`*
{{% /notice %}}

### Endpoint
```url
POST: [base_url]/client/account/revoke_api_key
```

### Headers
| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   | Content type is very important   |


### Request Body
```json
{
    "key": "71daba89c8ca6db220020b89eb251cc237633f78964a09e570dfbc62363fa67e"
}
```
- **key**: Your old api key.

### Response
Status code: `OK 200`

```json
{
    "api_key": "0d4d5e5f031058aca521cff367585281aae16b0ff498983fd478c7404bf56f40",
    "message": "api key revoked",
    "token_type": "Bearer"
}
```
- **api_key**: Your newly created api key.