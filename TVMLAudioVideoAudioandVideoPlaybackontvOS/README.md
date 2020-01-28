# TVMLAudioVideo: Audio and Video Playback on tvOS

## Requirements
Build Requirements: Xcode 7.1, tvOS 9.0 SDK
Runtime Requirements: tvOS 9.0 or later

## Introduction
This sample app is intended as a primer to help you start using the TVMLKit framework. The sample focuses on demonstrating the basics of integrating the TVMLKit framework in a tvOS application to use for audio and video playback. It also shows how to display a template on screen and how to handle user initiated events with JavaScript event listeners. 

## Structure
The project is split into two parts:
- TVMLAudioVideo: this directory contains the Xcode project. The AppDelegate.swift file handles the setup of the TVMLKit framework and launching the JavaScript context to manage the app.
- client: this directory contains the JavaScript and XML files needed to render the application. The contents of this directory must be hosted on a server accessible from the device.

Once the application has been setup and is running you will primarily be working in the client directory. This is where you define the templates you want to present to the user, and control the presentation and lifecyle of the application with JavaScript. As you define new templates to present, experiment with the available styles to get a feel for the flexibility provided in TVMLKit and how customizable they are.

To help debug and experiment you can use the Safari WebInspector to attach to the JavaScript context. WebInspector will provide you will a full JavaScript debugging environment. You will need to turn on the Develop menu from Safari > Preferences > Advance. Your devices and the JavaScript contexts available for debugging will be listed in the drop down menu.

When you are ready to add more advanced features to your application, open the TVMLAudioVideo files and read through the TVMLKit documentation. You can add new JavaScript APIs, create new XML templates or elements, and pass additional information into the JavaScript context at launch. You can also expand the capabilities of your application by creating a TopShelfExtenstion for presenting items in the top shelf when your Application is moved to the first row of Apple TV main menu.


## Installation instructions:
To start a local server run the following command in a terminal within the 'client' folder to create a simple webserver.

```
python -m SimpleHTTPServer 9001
```

- Open the TVMLAudioVideo.xcodeproj project in Xcode
- If the client code is hosted on a remote server, or you are running this app on the Apple TV change the following property in AppDelegate.swift:
	- Change the TVBaseURL value to the URL hosting the contents of the client directory
- Build and run the application



Copyright (C) 2015 Apple Inc. All rights reserved.
