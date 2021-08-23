# TA Signals
---------------

TA Signals is an iOS app developed in SwiftUI as a learning exercise. The app fetches from a JSON endpoint and display the data neatly organized on-screen.

### Screenshots
----------------

| Main Screen |
|---------------------|
|![](https://tilcode.blog/wp-content/uploads/2021/08/Screenshot-2021-08-23-at-17.08.19.png)|

| Settings Screen |
|---------------------|
|![](https://tilcode.blog/wp-content/uploads/2021/08/Screenshot-2021-08-23-at-17.08.45.png)|

### Table of Contents
---------------------
* [How to use](#how-to-use)
* [The tech talk](#the-tech-talk)
* [What have I learned](#what-have-i-learned)
* [Author Info](#author-info)

### How to use
--------------------

* Clone the project and run it on Xcode


** How does it work?**

![Overview](https://tilcode.blog/wp-content/uploads/2021/07/overview.jpg)

* A Python microservice pulls data from the Yahoo Finance API, then performs the necessary calculations to create the data indicators: RSI, EMA100, and EMA200.
* The miscroservice then dumps this data into a JSON object, publicly accessible via a web endpoint.
* The SwiftUI app fetches that JSON object from the microservice endpoint and display the data in the app's interface.

**Where does the data come from?**

* RSI (Relative Strengh Index), as well as EMA (Exponential Moving Averages) for 100 and 200 sessions are calculated using [Python and data analysis modules here](https://github.com/iamgabrielma/Python-for-stock-market-analysis/blob/main/ios_calc_rsi.py)

* More details about the [RSI technical implementation](https://tilcode.blog/2021/06/18/rsi-analysis-in-python-technical-implementation/)

**Disclaimer:** 

Nothing in the app and/or site constitutes professional and/or financial advice. All the data and indicators are provided for educational purposes only.


### The tech talk
--------------------
* SwiftUI
* Network calls, URLSession, and JSON objects data fetch 


### What have I learned
--------------------
* How to parse from a JSON endpoint into a SwiftUI object
* How to use Custom SwiftUI Views

### Author Info
-------------------------
* Twitter - [@iamgabrielma](https://twitter.com/iamgabrielma)
* LinkedIn - [Gabriel Maldonado Almendra](https://www.linkedin.com/in/gabrielmaldonad/)
* Website - [Tilcode.blog](https://tilcode.blog/)
