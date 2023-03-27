# **CleanCut**

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
CleanCut is a social media app where interested people can post their haircuts to be seen and rated by their friend.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Social Media
- **Mobile:** The app is mainly created for mobile, but given time can easily be imported to PC, similar to other social media apps like Instagram and   Snapchat. 
- **Story:** CleanCut was created to allow users to share their new haircuts with their friends and get their opinions on it. It also lets user tag their barbers alogside the picture, which has the benefit of allowing free advertisement for the barber, although whether the advertisement is good or bad depends on their own skills.
- **Market:** The main market for CleanCut is thought to be young people who are more willing to try various hairstyles. The app itself has separate tabs for male and female pictures as well.
- **Habit:** This app could be used as often or unoften as the user wanted depending on how often they or their friends get haircuts.
- **Scope:** We would start by helping people pair with their friends using possibly other social media apps.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Users can create their IDs and can then later login using said IDs.
* Backend database to store User details as well as their posts and friends.
* Users can add their friends through the app.
* Photos that can be taken from both the device library as well as from the camera.
* A rating system on a scale to allow your friends to rate your new haircut.
* A profile page to see all theirs photos and friends.
* A way to restrict non-friends from seeing your pictures.
* A separate barber profile system on which they can showcase the haircuts they did.
* A tag system to tag your barber so they can get publicity / notoriety based on how the hair cut is received.
* Allowing users to post comments on other's pictures.
* Separate tabs for men and women haircuts.


**Optional Nice-to-have Stories**

* Adding geolocation to the barbers so the users can see the locaton of their shops.
* The rating system allowing top-rated haircuts to rise to the top of the tab.

### 2. Screen Archetypes

* Login Screen
  *  User can login here
* Registration Screen
  *  User can create a new account here if they don't already have one
* Stream 
  *  User can view a feed of photos and give their reviews based on the tab they are currently on (men or women)
* Creation
  *  User can post a new photo to their feed as well as tag their barber
* Profile
  *  Users can view all their details and friends here
  *  Barbers can also see all the photos they were tagged in here
        
### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Login / Sign up
* Home Feed separated into different tabs
* Profile
* Post a photo

**Flow Navigation** (Screen to Screen)

* [Login]
   * [Profile Page]
   * [Womens/Mens page]
   * [Sign Up]
* [Sign Up]
   * [Womens/Mens page]
   * [Profile Page]
   * [Womens/Mens page]
* [Profile Page]
   * [Womens/Mens page]
   * [Login]
* [Womens/Mens page]
   * [Profile Page]

## Wireframes
<img src="https://github.com/UD331/CleanCut/blob/main/wireframes/Screenshot%202023-03-06%20at%206.26.11%20PM.png" height=200>
<img src="https://github.com/UD331/CleanCut/blob/main/wireframes/Screenshot%202023-03-06%20at%206.26.24%20PM.png" height=200>
<img src="https://github.com/UD331/CleanCut/blob/main/wireframes/Screenshot%202023-03-06%20at%206.26.36%20PM.png" height=200>

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://github.com/pgupta751/MyStory-iOSApp/blob/main/Kapture%202023-01-31%20at%2009.33.25.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with Kap


## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
