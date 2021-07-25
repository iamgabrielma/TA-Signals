TA Signals is an iOS app developed in SwiftUI as a learning exercise. The app fetches from a JSON endpoint and display the data neatly organized on-screen.

### How does it work?

![Overview](https://tilcode.blog/wp-content/uploads/2021/07/overview.jpg)

* A Python script pulls data from the Yahoo Finance API and perform calculations over market data to retrieve RSI (Relative Strengh Index), as well as EMA (Exponential Moving Averages) for 100 and 200 sessions for the selected stocks.
* Dumps this data into a JSON object publicly accessible
* The SwiftUI app fetches that JSON endpoint and display the data in the app UI

### Where does data come from?

* RSI (Relative Strengh Index), as well as EMA (Exponential Moving Averages) for 100 and 200 sessions are calculated using [Python and data analysis modules here](https://github.com/iamgabrielma/Python-for-stock-market-analysis/blob/main/ios_calc_rsi.py)

* More details about the [RSI technical implementation](https://tilcode.blog/2021/06/18/rsi-analysis-in-python-technical-implementation/)

**Disclaimer:** Nothing in the app and/or site constitutes professional and/or financial advice. All the data and indicators are provided for educational purposes only.

