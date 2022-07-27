/*
 * Copyright (C) 2022 Application Library Engineering Group
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { CalendarPickerComponent, CalendarType, DATE} from '@ohos/times_square'

@Entry
@Component
struct Index {
  scroller: Scroller = new Scroller()
  @State buttonType: string = "Single"
  unselectedButtonColor: ResourceColor = "#ccc6b6"
  selectedButtonColor: ResourceColor = "#403927"
  unselectedButtonTextColor: ResourceColor = "#0c1f1a"
  selectedButtonTextColor: ResourceColor = "#f5f3ed"
  selectedDates : DATE[] = []
  selectedDate(dates: DATE[]) {
    this.selectedDates = dates
  }

  build() {
    Column() {
      Scroll(this.scroller) {
        Row({ space: '10vp' }) {
          Button({ type: ButtonType.Normal }) {
            Text('Single').fontSize('20fp')
              .padding({ left: '20vp', right: '20vp' })
              .fontColor(this.buttonType === "Single" ? this.selectedButtonTextColor : this.unselectedButtonTextColor)
          }
          .onClick(() => {
            this.buttonType = "Single"
          })
          .shadow({ radius: 10 })
          .backgroundColor(this.buttonType === "Single" ? this.selectedButtonColor : this.unselectedButtonColor)

          Button({ type: ButtonType.Normal }) {
            Text('Multi').fontSize('20fp')
              .padding({ left: '20vp', right: '20vp' })
              .fontColor(this.buttonType === "Multi" ? this.selectedButtonTextColor : this.unselectedButtonTextColor)
          }
          .onClick(() => {
            this.buttonType = "Multi"
          })
          .shadow({ radius: 10 })
          .backgroundColor(this.buttonType === "Multi" ? this.selectedButtonColor : this.unselectedButtonColor)

          Button({ type: ButtonType.Normal }) {
            Text('Range').fontSize('20fp')
              .padding({ left: '20vp', right: '20vp' })
              .fontColor(this.buttonType === "Range" ? this.selectedButtonTextColor : this.unselectedButtonTextColor)
          }
          .onClick(() => {
            this.buttonType = "Range"
          })
          .shadow({ radius: 10 })
          .backgroundColor(this.buttonType === "Range" ? this.selectedButtonColor : this.unselectedButtonColor)

          Button({ type: ButtonType.Normal }) {
            Text('DisplayOnly').fontSize('20fp')
              .padding({ left: '20vp', right: '20vp' })
              .fontColor(this.buttonType === "DisplayOnly" ? this.selectedButtonTextColor : this.unselectedButtonTextColor)
          }
          .onClick(() => {
            this.buttonType = "DisplayOnly"
          })
          .shadow({ radius: 10 })
          .backgroundColor(this.buttonType === "DisplayOnly" ? this.selectedButtonColor : this.unselectedButtonColor)

          Button({ type: ButtonType.Normal }) {
            Text('Dialog').fontSize('20fp')
              .padding({ left: '20vp', right: '20vp' })
              .fontColor(this.buttonType === "Dialog" ? this.selectedButtonTextColor : this.unselectedButtonTextColor)
          }
          .onClick(() => {
            this.buttonType = "Dialog"
          })
          .shadow({ radius: 10 })
          .backgroundColor(this.buttonType === "Dialog" ? this.selectedButtonColor : this.unselectedButtonColor)

          Button({ type: ButtonType.Normal }) {
            Text('Customized').fontSize('20fp')
              .padding({ left: '20vp', right: '20vp' })
              .fontColor(this.buttonType === "Customized" ? this.selectedButtonTextColor : this.unselectedButtonTextColor)
          }
          .onClick(() => {
            this.buttonType = "Customized"
          })
          .shadow({ radius: 10 })
          .backgroundColor(this.buttonType === "Customized" ? this.selectedButtonColor : this.unselectedButtonColor)

          Button({ type: ButtonType.Normal }) {
            Text('Arabic').fontSize('20fp')
              .padding({ left: '20vp', right: '20vp' })
              .fontColor(this.buttonType === "Arabic" ? this.selectedButtonTextColor : this.unselectedButtonTextColor)
          }
          .onClick(() => {
            this.buttonType = "Arabic"
          })
          .shadow({ radius: 10 })
          .backgroundColor(this.buttonType === "Arabic" ? this.selectedButtonColor : this.unselectedButtonColor)

          Button({ type: ButtonType.Normal }) {
            Text('Arabic with digits').fontSize('20fp')
              .padding({ left: '20vp', right: '20vp' })
              .fontColor(this.buttonType === "Arabic with digits" ? this.selectedButtonTextColor : this.unselectedButtonTextColor)
          }
          .onClick(() => {
            this.buttonType = "Arabic with digits"
          })
          .shadow({ radius: 10 })
          .backgroundColor(this.buttonType === "Arabic with digits" ? this.selectedButtonColor : this.unselectedButtonColor)

          Button({ type: ButtonType.Normal }) {
            Text('Custom View').fontSize('20fp')
              .padding({ left: '20vp', right: '20vp' })
              .fontColor(this.buttonType === "Custom View" ? this.selectedButtonTextColor : this.unselectedButtonTextColor)
          }
          .onClick(() => {
            this.buttonType = "Custom View"
          })
          .shadow({ radius: 10 })
          .backgroundColor(this.buttonType === "Custom View" ? this.selectedButtonColor : this.unselectedButtonColor)

        }
      }.padding({ bottom: '10vp' })
      .scrollable(ScrollDirection.Horizontal)

      if (this.buttonType === 'Single') {
        CalendarPickerComponent({
          options: {
            tsSelectionMode: CalendarType.SINGLE,
            tsIsDialog: false,
            tsBgColor: "#FFFFFF",
            tsGridTextSize: '14fp',
            tsMonthTextSize: '14fp',
            tsMonthTextColor: "#000000",
            tsSelectedTextColor: "#fafafa",
            tsSelectedGridBackgroundColor: "#3a4352",
            tsNotInMonthTextColor: "#787a7d",
            tsInMonthColor: "#ebf5ef",
            tsNotInMonthColor: "#d0d9d4",
            tsInMonthTextColor: "#303133",
            tsSetSelection: true,
            tsWithNumbers: true,
            tsLanguage: "English",
            tsGridShape: "Square"
          },
          clickListener: (selectedDate) => this.selectedDate (selectedDate)
        })
      }
      if (this.buttonType === 'Multi') {
        CalendarPickerComponent({
          options: {
            tsSelectionMode: CalendarType.MULTI,
            tsBgColor: "#FFFFFF",
            tsGridTextSize: '14fp',
            tsMonthTextSize: '14fp',
            tsMonthTextColor: "#000000",
            tsSelectedTextColor: "#fafafa",
            tsSelectedGridBackgroundColor: "#3a4352",
            tsNotInMonthTextColor: "#787a7d",
            tsInMonthColor: "#ebf5ef",
            tsNotInMonthColor: "#d0d9d4",
            tsInMonthTextColor: "#303133",
            tsSetSelection: true,
            tsWithNumbers: true,
            tsLanguage: "English",
            tsGridShape: "Square"
          },
          clickListener: (selectedDate) => this.selectedDate (selectedDate)
        })
      }
      if (this.buttonType === 'Range') {
        CalendarPickerComponent({
          options: {
            tsSelectionMode: CalendarType.RANGE,
            tsBgColor: "#FFFFFF",
            tsGridTextSize: '14fp',
            tsMonthTextSize: '14fp',
            tsMonthTextColor: "#000000",
            tsSelectedTextColor: "#fafafa",
            tsSelectedGridBackgroundColor: "#3a4352",
            tsNotInMonthTextColor: "#787a7d",
            tsInMonthColor: "#ebf5ef",
            tsNotInMonthColor: "#d0d9d4",
            tsInMonthTextColor: "#303133",
            tsSetSelection: true,
            tsWithNumbers: true,
            tsLanguage: "English",
            tsGridShape: "Square"
          },
          clickListener: (selectedDate) => this.selectedDate (selectedDate)
        })
      }
      if (this.buttonType === "DisplayOnly") {
        CalendarPickerComponent({
          options: {
            tsSelectionMode: CalendarType.SINGLE,
            tsBgColor: "#FFFFFF",
            tsGridTextSize: '14fp',
            tsMonthTextSize: '14fp',
            tsMonthTextColor: "#000000",
            tsSelectedTextColor: "#fafafa",
            tsSelectedGridBackgroundColor: "#3a4352",
            tsNotInMonthTextColor: "#787a7d",
            tsInMonthColor: "#ebf5ef",
            tsNotInMonthColor: "#d0d9d4",
            tsInMonthTextColor: "#303133",
            tsSetSelection: false,
            tsWithNumbers: true,
            tsLanguage: "English",
            tsGridShape: "Square"
          },
          clickListener: (selectedDate) => this.selectedDate (selectedDate)
        })
      }
      if (this.buttonType === "Dialog") {
        CalendarPickerComponent({
          options: {
            tsSelectionMode: CalendarType.MULTI,
            tsIsDialog: true,
            tsBgColor: "#FFFFFF",
            tsGridTextSize: '14fp',
            tsMonthTextSize: '14fp',
            tsMonthTextColor: "#000000",
            tsSelectedTextColor: "#fafafa",
            tsSelectedGridBackgroundColor: "#3a4352",
            tsNotInMonthTextColor: "#787a7d",
            tsInMonthColor: "#ebf5ef",
            tsNotInMonthColor: "#d0d9d4",
            tsInMonthTextColor: "#303133",
            tsSetSelection: true,
            tsWithNumbers: true,
            tsLanguage: "English",
            tsGridShape: "Square"
          },
          clickListener: (selectedDate) => this.selectedDate (selectedDate)
        })
      }
      if (this.buttonType === "Customized") {
        CalendarPickerComponent({
          options: {
            tsSelectionMode: CalendarType.RANGE,
            tsIsDialog: true,
            tsBgColor: "#FFFFFF",
            tsGridTextSize: '14fp',
            tsMonthTextSize: '14fp',
            tsMonthTextColor: "#000000",
            tsSelectedTextColor: "#fafafa",
            tsSelectedGridBackgroundColor: "#1b0e1f",
            tsNotInMonthTextColor: "#787a7d",
            tsInMonthColor: "#f08565",
            tsNotInMonthColor: "#e8bdb0",
            tsInMonthTextColor: "#303133",
            tsSetSelection: true,
            tsWithNumbers: true,
            tsLanguage: "English",
            tsGridShape: "Circle"
          },
          clickListener: (selectedDate) => this.selectedDate (selectedDate)
        })
      }
      if (this.buttonType === "Arabic") {
        CalendarPickerComponent({
          options: {
            tsSelectionMode: CalendarType.SINGLE,
            tsBgColor: "#FFFFFF",
            tsGridTextSize: '14fp',
            tsMonthTextSize: '14fp',
            tsMonthTextColor: "#000000",
            tsSelectedTextColor: "#fafafa",
            tsSelectedGridBackgroundColor: "#3a4352",
            tsNotInMonthTextColor: "#787a7d",
            tsInMonthColor: "#ebf5ef",
            tsNotInMonthColor: "#d0d9d4",
            tsInMonthTextColor: "#303133",
            tsSetSelection: true,
            tsWithNumbers: false,
            tsLanguage: "Arabic",
            tsGridShape: "Square"
          },
          clickListener: (selectedDate) => this.selectedDate (selectedDate)
        })
      }
      if (this.buttonType === "Arabic with digits") {
        CalendarPickerComponent({
          options: {
            tsSelectionMode: CalendarType.SINGLE,
            tsBgColor: "#FFFFFF",
            tsGridTextSize: '14fp',
            tsMonthTextSize: '14fp',
            tsMonthTextColor: "#000000",
            tsSelectedTextColor: "#fafafa",
            tsSelectedGridBackgroundColor: "#3a4352",
            tsNotInMonthTextColor: "#787a7d",
            tsInMonthColor: "#ebf5ef",
            tsNotInMonthColor: "#d0d9d4",
            tsInMonthTextColor: "#303133",
            tsSetSelection: true,
            tsWithNumbers: true,
            tsLanguage: "Arabic",
            tsGridShape: "Square"
          },
          clickListener: (selectedDate) => this.selectedDate (selectedDate)
        })
      }

      if (this.buttonType === "Custom View") {
        CalendarPickerComponent({
          options: {
            tsSelectionMode: CalendarType.SINGLE,
            tsBgColor: "#FFFFFF",
            tsGridTextSize: '14fp',
            tsMonthTextSize: '14fp',
            tsMonthTextColor: "#000000",
            tsSelectedTextColor: "#fafafa",
            tsSelectedGridBackgroundColor: "#3a4352",
            tsNotInMonthTextColor: "#787a7d",
            tsInMonthColor: "#ebf5ef",
            tsNotInMonthColor: "#d0d9d4",
            tsInMonthTextColor: "#303133",
            tsSetSelection: true,
            tsWithNumbers: true,
            tsLanguage: "English",
            tsGridShape: "Square",
            tsDayIcon: $r('app.media.app_icon')
          },
          clickListener: (selectedDate) => this.selectedDate (selectedDate)
        })
      }
    }.padding('20vp')
  }
}