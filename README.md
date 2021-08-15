# Welcome to Soil-Food-Web Microorganism App.

## Description

This is an open-source app currently in development phase that helps you to identify organisms with other users. You can upload photos or short 10 second videos to identify organisms, see how other people voted and later on have a chat about the organisms.

[SFW Microorganism App Wireframes](https://drive.google.com/file/d/1a_gFOeLnrD9907lD4xzv-vF1aDkN3X6V/view?usp=sharing)

### Donation
- ETH:
- BTC:
- BCH:
- BSC:

## Table of Contents

 1. Project's Information
 2. Tech stacks used
 3. Cloning this project
 4. Project structure
 5. Testing
 6. Roadmap
 7. Support us
 8. License

## 1. Project's information

Johannes wanted to create an open source app to collect biological microscopic photos and 10 second videos. These photos and videos are provided by biologists, who also get to classify other microorganisms through voting. Biologists can also view and filter micro-organism and find out how other biologists voted for it.

--- Screenshots should be attached as soon as they are ready

## 2. Tech stack used

**Flutter ( Mobile + Web ) and Firebase**
[Flutter](https://flutter.dev/) - [Firebase](https://firebase.google.com/)

The UI for this project is built with Flutter for cross-platform mobile apps and web. The backend is created with firebase. If you would like to clone or take part in the development of this project you are going to need a firebase account and create a new firebase app following the instructions in the next chapter. Johannes would like to also integrate other centralized and decentralized storage providers like [siasky.net](https://siasky.net/) and [storj.io](https://www.storj.io).

## 3. Cloning this project

After cloning this app, go to [firebase.com](https://firebase.com) and create and account if you don't have one. Then, create a new app with analytics enabled if you would prefer.

**STEP 1: Setting up the application name:**
First you will need to change the name of the project to be able to publish it on Google Play and App Store. Usually the app name starts with com.companyname.appname. Depending on your default code editor, you can find out how to do that.

**STEP 2: Firebase configuration for Android:**
You will need to download the *google-services.json* file from firebase Android app configuration  and place it in the directory
`./android/app/`

**STEP 3: Firebase configuration for iOS:**
You will need to download the *GoogleService-Info.plist* file from firebase iOS app configuration and place it in the directory.
`./ios/runner/`

**STEP 4: Firebase configuration for web:**
rename the file *firebase-config-sample.js* to *firebase-config.js* and then copy the web configuration you got from firebase ---> new web app.
`./web/firebase-config-sample.js`



## 4. Project Structure

**./assets**
The assets folder contains app assets. Those include images, maybe fonts, and other global assets.

**./lib**
Contains the flutter code for the app with the entry point as *main.dart* file

**./lib/screens**
Contains the screens of the app

**./lib/widgets**
Contains the widgets shared across screens

**./lib/utils**
Contains general app classes and functions.

## 5. Testing
All tests are placed in the *./test* directory. We are using dart and flutter's default testing libraries. More information on testing on Flutter's official docs found at the following link:
https://flutter.dev/docs/testing

## 6. Roadmap

**Current Phase**
Currently we are still in the development phase. We are planning to launch the initial release with the features mentioned in the wireframe file [SFW Microorganism App Wireframes](https://drive.google.com/file/d/1a_gFOeLnrD9907lD4xzv-vF1aDkN3X6V/view?usp=sharing).

**Future  Vision**
After launching the app on the store, we are looking forward to integrate the app with other decentralized storage mediums mentioned above in the tech stack. We are still entertaining the idea. A more clear direction will be established after gaining user feedback.


## 7. Support us

We would love you to help us on this project. If you are interested to contribute with code, please check the issues for available to find tasks you think you can do and then create a pull request. This project follows the [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/). Please use is to make your commits. 

For financial support, we are working to create a completely transparent option to gain financial support for development through cryptocurrencies. All the development invoices can be found on [SFW Invoices](https://docs.google.com/spreadsheets/d/165NP_1uvO7J4LWyUNuq9B9GrtpmxK9cLvNutP7BcJzU/edit?usp=sharing).



## 8. License

Thanks to [kn9ts](https://gist.github.com/kn9ts) for summarizing the license details below. [Original Source](https://gist.github.com/kn9ts/cbe95340d29fc1aaeaa5dd5c059d2e60)

### GPL3 LICENSE SYNOPSIS

**_TL;DR_*** Here's what the license entails:

1. Anyone can copy, modify and distribute this software.
2. You have to include the license and copyright notice with each and every distribution.
3. You can use this software privately.
4. You can use this software for commercial purposes.
5. If you dare build your business solely from this code, you risk open-sourcing the whole code base.
6. If you modify it, you have to indicate changes made to the code.
7. Any modifications of this code base MUST be distributed with the same license, GPLv3.
8. This software is provided without warranty.
9. The software author or license can not be held liable for any damages inflicted by the software.
=======
