---
title: "Create An Endpoint"
date: 2022-09-15T22:37:32+02:00
draft: false
weight: 1
---

Creating a new webhook endpoint is very important process, but simple to achieve with our api.

{{% notice note %}}
Base url `https://api.omegastream.net/company` this will be called from now as *`[base_url]`*
{{% /notice %}}

### Endpoint

```url
GET: [base_url]/client/webhooks
```

### Request Body

#### Fields

| Field       | Required | Description                                                         | Example                       |
|-------------|----------|---------------------------------------------------------------------|-------------------------------|
| url         | **true** | Must be a valid url with method **POST**                            | http://localhost:8888/webhook |
| description | false    | It is just for viewing                                              |                               |
| [events](#events)      | **true** | A list of events string on which you want to receive a notification |                               |

#### Headers

| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |     

#### Events

They are the triggers on which you will be receiving a new event with a structure of the following
```json
{
    "id" : "630fac88bd5bb64cf8b24b99",
    "coid" : "omega-cop-OyJrgi5-fx",
    "api_version" : "v1",
    "created" : 1661971592,
    "type" : "video.process_failed",
    "data" : {
        
    },
    "endpoint_id" : "6307b4d6570090479813a762",
    "response" : {
        "status_code" : 200,
        "status" : "200 OK",
        "body" : "webhook received\n",
        "message" : "webhook event with type video.process_failed succeeded"
    }
}
```

{{% notice info %}}
`response` field is the response we got from your endpoint.
{{% /notice %}}

#### Available events are

- `video.process_failed` ✅ Triggered when video processing failed.

- `video.process_succeeded` ✅ Triggered when video processing succeeded.

- `video.deleted` ✅ Triggered when the video is successfully deleted.

    > Called when the video is marked for deletion. (not when it is actually deleted.)

- `video.failed_to_delete` ✅ Triggered when the video deleted failed.

    > Called when the video failed to be marked for deletion. (not when it is actually deleted)

- `video.deletion_reverted` ✅ Triggered when the video deletion is reverted.

    > Called when the video deletion is reverted.

- `video.uploaded` ⚠️ Triggered when video is uploaded or ready to be pushed for processing.

- `video.ready_for_processing` ❌ Triggered when video is pushed for processing and ready (but not yet processed).

- `video.in_progress` ❌ Triggered when video is being processed right now.

- `video.completed_processing` ❌ Triggered when video processing is complete. (but not yet confirmed to be working and with no confirmed success)

- `video.ready_to_watch` ❌ Triggered when video is ready to be watched right now.

**Keys:**

 - ✅ Alive and kicking.

 - ⚠️ Only available for some features. (send to **Omega** support to learn more)

 - ❌ Doesn't have any effect right now.

{{% notice note %}}
As of now (*2022-10-01*) you can use `video.process_succeeded` to indicate video process complete.
{{% /notice %}}

{{% notice tip %}}
To View endpoint events and each event details go to [Events](/video/webhooks/events)
{{% /notice %}}

### Response

Status code: `OK 200`
```json
{
    "id": "6323940afc8e1c02d9f3b155",
    "created_at": "2022-09-15T21:07:22.823797Z",
    "updated_at": "2022-09-15T21:07:22.824194Z",
    "coid": "omega-cop-OyJrgi5-fx",
    "url": "http://localhost:6060/webhook",
    "description": null,
    "events": [
        "video.completed_processing",
        "video.process_failed",
        "video.process_succeeded",
        "video.ready_to_watch",
        "video.uploaded",
        "video.ready_for_processing",
        "video.in_progress"
    ],
    "active": true
}
```

{{% notice tip %}}
You can learn more about **active** field from [here](/video/webhooks/managment/#update-status)
{{% /notice %}}
