<img alt="LXMax" src="https://raw.githubusercontent.com/impsnldavid/jit.ndi/develop/icon.png" width="200" height="200">

Extensions for sending/receiving video and audio using the [Newtek NDI®](https://ndi.tv/) protocol in [Cycling 74's Max](https://cycling74.com/products/max/)

## Overview

The [NewTek NDI®](https://ndi.tv/) protocol allows high-quality, high-performance, low-latency streaming of video and audio over a local network. jit.ndi provides a pair of objects to interface this protocol with the Max/Jitter environment, allowing sending/receiving of jitter matrices and MSP signals to/from any other device supporting NDI.

## Features
- NDI 5.0 compatible (runtime is dynamically loaded so will work with any installed compatible NDI version)
- Send/receive 2D jitter matrices of any size. 3-plane RGB and 4-plane RGBA both supported.
- YUV mode for high-performance usage.
- Send/receive unlimited number of audio channels.
- Objects can set/report preview/program tally status on a video source.

## Requirements
- Max 8 (64-bit) - Windows or Mac (Intel/Apple Silicon)
- Newtek NDI® Runtime - [Windows](http://new.tk/NDIRedistV5) or [Mac](http://new.tk/NDIRedistV5Apple)
- [NewTek NDI® Tools](https://ndi.tv/tools/) - Required if using NDI-HX equipment (such as the [NewTek NDI®|HX Camera app](https://www.newtek.com/software/ndi-camera/)) (and also useful for testing)

## License
jit.ndi is licensed under LGPL 3.0. This means you are free to use the objects in any commercial/non-commercial project but any changes to the source code must be released under the same license.

## Installation
- jit.ndi is supplied as a Max package. Download available from the [releases](https://github.com/pixsper/jit.ndi/releases/latest) page.
- Unzip and place the entire jit.ndi directory in your Max packages directory (`C:/Users/[username]/Documents/Max 8/Packages` on Windows, `/Users/[username]/Documents/Max 8/Packages` on Mac OS).

## Documentation
Help patchers and Max documentation metadata included in the package.

## Copyright
jit.ndi Copyright (C) 2021 Pixsper Ltd.
www.pixsper.com

NDI® is a registered trademark of NewTek, Inc  
https://ndi.tv/

Includes [yxml](https://dev.yorhel.nl/yxml) (C) 2013-2014 Yoran Heling
