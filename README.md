# Pre-work - *TipTap*

TipTap is a tip calculator application for iOS.

Submitted by: Siva Satish (bvssiva@yahoo.com, github: basicsbeauty)

Time spent: 6 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Added Launch Icon
- [x] Added custom color theme
- [x] Added custom font for text/labels
- [x] Added currency symbol as another preference along with tip percentage


## Video Walkthrough 

Here's a walkthrough of implemented user stories:

![Video Walkthrough](tiptap_demo.gif)



GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** Felt iOS app development is much better experience than Android. It's faster to start/modify/test and easier to implement MVC pattern. The entier IDE feels faster compared to Android Studio.
 - Outlets are logical reference of UI(or View) elements in the code base.
 - Actions are essentially event handlers
 
 For Outlets, internal implementation might be that each View will have list/map of different places where it was used.
 For Actions, might be implemented using listener/call back model. Each View/UI element will have map for each action and each action will have list of listeners/handler/signal handler that it invokes when a particular action was invoked.
 

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** If there are two classes say Class A and Class B and if an attribute in A referes to an attribute in B and vice versa, it froms a strong reference cycle essentially a directed cyclic graph.


## License

    Copyright 2017 

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
