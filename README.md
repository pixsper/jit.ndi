<img alt="LXMax" src="https://raw.githubusercontent.com/impsnldavid/jit.ndi/develop/icon.png" width="200" height="200">

Extensions for sending/receiving video and audio using the [Newtek NDI®](https://ndi.tv/) protocol in [Cycling 74's Max](https://cycling74.com/products/max/)

## Overview

The [NewTek NDI®](https://ndi.tv/) protocol allows high-quality, high-performance, low-latency streaming of video and audio over a local network. jit.ndi provides a pair of objects to interface this protocol with the Max/Jitter environment, allowing sending/receiving of jitter matrices and MSP signals to/from any other device supporting NDI.

## Features
- Send/receive 2D jitter matrices of any size. 3-plane RGB and 4-plane RGBA both supported.
- YUV mode for high-performance usage.
- Send/receive unlimited number of audio channels.
- Objects can set/report preview/program tally status on a video source.

## Requirements
- Max 8 (64-bit) - Windows or Mac
- [Newtek NDI® Runtime](http://new.tk/NDIRedistV4)
- [NewTek NDI® Tools](https://ndi.tv/tools/) - Required if using NDI-HX equipment (and also useful for testing)

## License
jit.ndi is licensed under LGPL 3.0. This means you are free to use the objects in any commercial/non-commercial project but any changes to the source code must be released under the same license.

## Installation
- jit.ndi is supplied as a Max package.
- Download the latest package version from https://github.com/impsnldavid/jit.ndi/releases.
- Unzip and place the entire jit.ndi directory in your Max packages directory (`C:/Users/[username]/Documents/Max 8/Packages` on Windows, `/Users/[username]/Documents/Max 8/Packages` on Mac OS).

## Documentation
Help patchers and Max documentation metadata included in the package.

## Copyright
jit.ndi Copyright (C) 2020 David Butler / The Impersonal Stereo  
www.davidbutlerdesign.co.uk  
www.theimpersonalstereo.com  

NDI® is a registered trademark of NewTek, Inc  
https://ndi.tv/
