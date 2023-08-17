---
title: "Events"
date: 2022-09-17T16:06:58+02:00
draft: false
weight: 5
---

{{% notice note %}}
Base url `https://api.omegastream.net/company` this will be called from now as *`[base_url]`*
{{% /notice %}}

## List webhook endpoint event

### Endpoint

```url
GET: [base_url]/client/webhooks/:id
```

- **:id**: webhook endpoint document id. (take a look at [Hooks](/video/webhooks/hooks))

### Headers

| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |                                                         |

### Response

```json
[
    {
        "id": "63377e715790c27875f70dbd",
        "created_at": "0001-01-01T00:00:00Z",
        "ocid": "omega-cop-KoNef9DB5i",
        "api_version": "v1",
        "created": 1664581231,
        "type": "video.process_succeeded",
        "data": null,
        "endpoint_id": "6336cd2b5790c27875f70d96",
        "response": null
    },
    {
        "id": "633772fa5790c27875f70dbb",
        "created_at": "0001-01-01T00:00:00Z",
        "ocid": "omega-cop-KoNef9DB5i",
        "api_version": "v1",
        "created": 1664578297,
        "type": "video.uploaded",
        "data": null,
        "endpoint_id": "6336cd2b5790c27875f70d96",
        "response": null
    }
[
```

{{% notice tip %}}
From you can see in [response](#response) `data` and `response` are null here to optimize response size, to view full event details [see](#view-event-details).
{{% /notice %}}

---

## View event details

### Endpoint

```url
GET: [base_url]/client/webhooks/:id/events/:eid
```

- **:id**: webhook endpoint document id. (take a look at [Hooks](/video/webhooks/hooks))
- **:eid**: event id.

### Headers

| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |                                                         |

### Response

```json
{
    "id" : "630fac88bd5bb64cf8b24b99",
    "created_at": "2022-10-01T00:00:00Z",
    "coid" : "omega-cop-OyJrgi5-fx",
    "api_version" : "v1",
    "created" : 1661971592,
    "type" : "video.process_succeeded",
    "data" : {
        "video" : {
           ....
        }
    },
    "endpoint_id" : "6307b4d6570090479813a762",
    "response" : {
        "status_code" : 200,
        "status" : "200 OK",
        "body" : "webhook received\n",
        "message" : "webhook event with type video.process_succeeded succeeded"
    }
}
```

| Field       | Type               | Description                                                                     | Nullable |
|-------------|--------------------|---------------------------------------------------------------------------------|----------|
| id          | string             | document id.                                                                     | NO       |
| created_at  | string (date time) | event creation ISO [date](https://en.wikipedia.org/wiki/ISO_8601).               | NO       |
| created     | integer            | Time at which the object was created. Measured in seconds since the Unix epoch. | NO       |
| api_version | string             | Omega API version used to render data.                                           | NO       |
| type        | string (enum)      | Description of the event (e.g., video.failed_to_delete or video.process_failed). [see](/video/webhooks/create_endpoint#available-events-are).                                                    | NO       |
| endpoint_id | string             | webhook endpoint id.                                                             | NO       |
| response    | [Response](#event-response)          |                                                                                 | ⚠️ NO      |
| data        | [Data](#event-data)              | event data object that will be used to retrieve all associated information.      | ⚠️ NO      |

- ⚠️ These fields are **Non-nullable** by default, but null in some contexts. [see](#response)

#### Event Data

Event data is the associated [video data](/video/managment/video_model).

#### Event Response

This is your response to our webhook POST request.

| Field       | Type    | Description                                                                       | Nullable |
|-------------|---------|-----------------------------------------------------------------------------------|----------|
| status_code | integer | response [status code](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status). | NO       |
| status      | string  | consist of status code and status label.                                          | NO       |
| body        | string  | response body string formatted.                                                   | NO       |
| message     | string  | message metadata                                                                  | NO       |