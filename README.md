<p align="center"> 
<img src="https://user-images.githubusercontent.com/52453582/134106131-da0dc609-4d1c-46e2-9786-f8cf0b2b851e.png" alt="Screenshot 2021-09-21 at 05 10 47 2"/> 
 </p>

# Welcome to Soil-Food-Web Microorganism App.
This open-source app is made for the [SFW-Community](https://www.soilfoodweb.com/). It is currently in development phase. The App helps users to identify soil microorganisms with each other. You cam upload photos or short 10 second static videos, see how other people voted and even have a chat about the organisms. </br>
</br>
[![figma](https://user-images.githubusercontent.com/52453582/134105644-92379e2b-eb88-43c5-9eb5-7e3b8f1fc3f9.png)](https://www.figma.com/proto/QMm6yXvIhIDIcTLM4nfMEY/SFW-Microorganisms-App?node-id=716%3A3346&scaling=min-zoom&page-id=4%3A0) 
[![discord](https://user-images.githubusercontent.com/52453582/134105526-58408c2f-e6df-422b-9e81-758b2387e3ed.png)](https://discord.gg/ddejrzzFBb)
[![faq](https://user-images.githubusercontent.com/52453582/134108903-86e219d9-abe1-4718-8b06-8ea071d6a7aa.png)](https://github.com/mylife-plus/SFW-Microorganism-App/wiki)



## Table of Contents

1. [Tech stack used](#1-tech-stack-used)
2. [Cloning this project](#2-cloning-this-project)
3. [Project structure](3-project-structure)
4. [Testing](4-testing)
5. [Roadmap](5-roadmap)
6. [Support us](6-support-us)
7. [License](7-license)



## 1 Tech stack used

[Flutter (Mobile + Web)](https://flutter.dev/) - [Firebase](https://firebase.google.com/)

The UI for this project is built with Flutter for cross-platform mobile apps and web. The backend is created with firebase. 



## 2 Cloning this project

To clone this project you need a firebase account and create a new firebase app.

After cloning this app, go to [firebase.com](https://firebase.com) and create and account if you don't have one. Then, create a new app with analytics (optional).

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



## 3 Project Structure

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



## 4 Testing
All tests are placed in the *./test* directory. We are using dart and flutter's default testing libraries. More information on testing on Flutter's official docs https://flutter.dev/docs/testing



## 5 Roadmap

**Current Phase:** 

All our finished and current milestones are published [here](https://github.com/mylife-plus/SFW-Microorganism-App/milestones). The milestones are based on the features mentioned in the wireframe file [SFW Microorganism App Wireframes](https://drive.google.com/file/d/1a_gFOeLnrD9907lD4xzv-vF1aDkN3X6V/view?usp=sharing).

**Future Milestones:** 

- Integrate decentralised cloud storage solutions like www.siasky.net and www.storj.io so users can own their data. 
- Integrate a service like www.moonpay.com to the app so people can donate money to our project DAO.
- integrate www.aragon.org into the app so users can receive governance tokens to control the project DAO by creating proposals and vote on proposals.  



## 6 Support us

**Developers**

If you like this project and want to contribute with code, please check the issues to find tasks you want to do. Please follow the [conventional commits rules](https://www.conventionalcommits.org/en/v1.0.0/) when committing. 

**Financial Support**

We are using cryptocurrency whenever possible, to guarantee financial trust through transparency. All the invoices can be found [here](https://docs.google.com/spreadsheets/d/1YpBcWnIJo6QBekfoUGzOmU0x7lZTHRxWNk-1TIoKSA8/edit?usp=sharing). We plan to give donors governance tokens proportional to their donation, so they can influence the direction the project takes by making proposals and vote on them. We will use [Aragon](https://aragon.org/) for this. Whenever a proposal is accepted, we will create a milestone made out of issues and attach bounties to each issue proportional to the work it takes to complete them.



## 7 License

Thanks to [kn9ts](https://gist.github.com/kn9ts) for summarising the license details below. [Original Source](https://gist.github.com/kn9ts/cbe95340d29fc1aaeaa5dd5c059d2e60)

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
