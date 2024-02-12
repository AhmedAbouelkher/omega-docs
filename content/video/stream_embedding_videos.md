---
title: "Embedding Videos"
date: 2023-11-04T15:27:46+02:00
draft: true
---

Omegastream was designed for developers to easily upload, process, and display videos in any type of use-case. To display a video on your website, you can use the embed view. The embed code is provided in the interface to be able to easily copy-paste into your website HTML.

## How to embed a video?

To embed a video, you will need to create an iframe to the URL below. Each URL is structured from the video ID.

```uri
https://api.omegastream.net/player/{video_uuid}/embedded
```

- `video_uuid`: this is the video uuid.

This will return a json object you can use to create your iframe according to the [examples](#example-code-responsive) below.

#### Response

```json
{
    "uuid": "b22336c5-e319-4948-b9f0-23c5d44ef100",
    "source": "/player/b22336c5-e319-4948-b9f0-23c5d44ef100/embedded",
    "signature": "5f2efdf5727783cdb8958ce2bf8af951e299922b"
}
```

- `uuid`: video uuid. ex: `b22336c5-e319-4948-b9f0-23c5d44ef100`
- `source`: video embeddings source. ex: `/player/b22336c5-e319-4948-b9f0-23c5d44ef100/embedded`
- `signature`: video source signature. ex: `5f2efdf5727783cdb8958ce2bf8af951e299922b`
    > **Note:** The signature may be **empty** if the video is **public**.

    > **Note:** The signature is used to **verify** the source of the video. It is important to use this signature to prevent unauthorized access to your videos.

#### Creation structure of the iframe

```uri
https://api.omegastream.net/player/{uuid}/embedded?{query_params}
```

- `uuid`: this is the video uuid which you can find in the [response](#response) above.

- `query_params`: this is the query parameters you can use to control the video. You can find more information about the query parameters in the [parameters](#parameters) section below.

## Parameters

It is possible to control the embedded video with custom parameters.

#### autoplay (true, false)

The autoplay query parameter controls whether the video should start playing automatically when the page loads. Note that due to browser restrictions that prevent auto-playable videos, this might not always work correctly. The default value is set to true.

#### preload (true, false)

The preload parameter controls the preload behavior of the player. True by default, the player will immediately start preloading the video files to allow quick playback once the user starts playing the video. You can see this by false to save bandwidth and only start loading the video once the Play button is clicked.

#### loop (true, false)

The loop parameter controls whether the video should loop once it reaches the end. The default value is set to false.

#### muted (true, false)

The muted parameter controls whether the video should be muted. The default value is set to false.

#### t (time format string) Video start time

The t parameter sets the player video start time. for specifying "seconds" insert the format "Xs" where "X" represents the time slot number and "s" stands for seconds, such as "45s". Hours and minutes can be added to format, for example "1h20m45s" or "20m45s". The maximum time is 24 hours.

#### fw_text (string)

#### fw_color (string)

#### fw_interval (string)

#### fw_size (string)

#### fw_alpha (string)

## Custom Integration

If you wish to use your own player or video integration, we also expose the video files directly. To learn more about the video storage structure to use with your own solution, you can see the [Video Storage Structure](/video/video_model) page.
