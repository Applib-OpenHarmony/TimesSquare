# Times Square
****
Times Square helps you to pick and customize calendar with multiple attributes and support for Arabic calendar 
## Download & Install
****
Install using: 
```
npm i @ohos/times_square
```
For using Times Square in your app, add the below dependency in the entry/package.json  
```
"dependencies": {
    "@ohos/times_square": "file:../times_square"
  }
```

## Usage instructions
****
To use time square calendar, Import the CalendarPickerComponent and set calendar options as below
```
import { CalendarPickerComponent, CalendarType } from '@ohos/times_square'

CalendarPickerComponent({
          options: {
            tsSelectionMode: CalendarType.SINGLE, // Type of Calendar CalendarType.[Single|Multi|Range]
            tsIsDialog: false, // Show calendar in dialog or not.
            tsBgColor: "#FFFFFF", // Background color of calendar.
            tsGridTextSize: '14fp', // Text size of grid.
            tsMonthTextSize: '14fp', // Text size of month.
            tsMonthTextColor: "#000000", // Text color of month.
            tsSelectedTextColor: "#fafafa", // Text color of selected date.
            tsSelectedGridBackgroundColor: "#3a4352", // Background color of selected date.
            tsNotInMonthTextColor: "#787a7d", // Text color of not in month date.
            tsInMonthColor: "#ebf5ef", // Background color of in month date.
            tsNotInMonthColor: "#d0d9d4", // Background color of not in month date.
            tsInMonthTextColor: "#303133", // Text color of in month date.
            tsSetSelection: true, // Set selection on calendar.
            tsWithNumbers: true, // Show numbers on calendar.
            tsLanguage: "English", // Language of calendar.
            tsGridShape: "Square" // Shape of grid.
          },
          clickListener: (selectedDate) => this.selectedDate (selectedDate)
        })
```
## Screenshots
****
![](./Images/Single.png)
![](./Images/Multi.png)
![](./Images/Range.png)
![](./Images/Dialog.png)
![](./Images/Customized.png)
![](./Images/Arabic.png)
![](./Images/ArabicWithDigits.png)
![](./Images/CustomView.png)
## Attributes
****
You can style the Calendar  using theses attributes :

| Attribute | Description |
| -------- | ----------- |
|tsSelectionMode|Type of the calendar|
|tsBgColor|Background color of the calendar|
|tsGridTextSize|Calendar grid text size|
|tsMonthTextSize|Calendar month text size|
|tsMonthTextColor|calendar month text color|
|tsSelectedTextColor|Calendar selected date text color|
|tsSelectedGridBackgroundColor|Calendar selected date background color|
|tsNotInMonthTextColor|Calendar not in month text color|
|tsInMonthColor|Calendar in month text color|
|tsNotInMonthColor|Calendar not in month background color|
|tsInMonthTextColor|Calendar in month background color|
|tsSetSelection|Calendar setting for selection|
|tsWithNumbers|Calendar to show numbers (For arabic)|
|tsLanguage|Calendar set language|
|tsGridShape|Calendar grid shape|
|tsDayIcon|Calendar grid icon|

## Compatibility
****
Supports OpenHarmony API version 9
## Code Contribution
****
If you find any problems during usage, you can submit an [issue](https://github.com/Applib-OpenHarmony/TimesSquare/issues) to us. Of course, we also welcome you to send us PR.
## Open source License
****
This project is based on [Apache License 2.0](./LICENSE), please enjoy and participate in open source freely.
