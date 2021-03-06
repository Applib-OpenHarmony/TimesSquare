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

import { CalendarCellComponent } from './CalendarCellComponent'
import { DATE } from './DATE'
import { Calendar }from './Calendar'
import { CalendarPickerModel } from './CalendarPickerModel'
import { monthInEnglish, weekDaysInEnglish, weekDaysInArabic, monthsInArabic, arabicDigits } from './Values'
import { CalendarOptions } from './Types'
import prompt from '@system.prompt';


@Component
export struct CalendarPickerComponent {
  options: CalendarOptions = undefined
  clickListener : (selectedDate : DATE[] ) => void = undefined
  @State CalendarPickerModel: CalendarPickerModel = undefined
  @State selectedDates: number[][] = []
  currentMonth = new Date().getMonth()
  currentYear = new Date().getFullYear()
  monthArray: number[]
  yearArray: number []
  indexArray: number [] = Array.apply(null, Array(25)).map(function (item, i) {
    return i
  })
  dialogBoxController: CustomDialogController = new CustomDialogController({
    builder: DialogBoxComponent({
      options: this.options
    }),
    autoCancel: true,
  })

  aboutToAppear() {
    var temp = Calendar.getCalendarForYear(this.currentMonth, this.currentYear)
    this.monthArray = temp.listOfMonths
    this.yearArray = temp.listOfYear
    if (this.CalendarPickerModel == undefined) {
      this.CalendarPickerModel = new CalendarPickerModel(this.options);
    }
    if (this.CalendarPickerModel.tsIsDialog) {
      this.dialogBoxController.open()
    }
  }

  build() {
    Column() {
      if (!this.CalendarPickerModel.tsIsDialog) {
        List({ initialIndex: 13 }) {
          ForEach(this.indexArray, (item) => {
            ListItem() {
              Month({
                month: this.monthArray[item],
                year: this.yearArray[item],
                CalendarPickerModel: $CalendarPickerModel,
                selectedDates: $selectedDates,
                clickListener : this.clickListener
              })
            }
          })
        }
      }
    }.backgroundColor(this.CalendarPickerModel.tsBgColor)
  }
}

@Component
struct Month {
  @Link CalendarPickerModel: CalendarPickerModel
  @Link selectedDates: number [][]
  clickListener : (selectedDate : DATE[]) => void = undefined
  year: number = 2021
  month: number = 6
  monthDays: string [] = []
  inMonthArray: boolean []= []
  months: string [] = monthInEnglish
  weekDays: string [] = weekDaysInEnglish

  replaceNumberWithArabic = (num: number): string => {
    let arabic = arabicDigits
    let k = ""
    let strNum = num.toString()
    for (let i = 0;i <strNum.length;i++){
      let digit = strNum[i]
      k += arabic[+digit]
    }
    return k
  }
  rotateAfterEvery7th = (arr: any[]): any[] => {
    for (let i = 0; i < arr.length; i = i + 7) {
      [arr[i + 0], arr[i + 6]] = [arr[i + 6], arr[i + 0]];
      [arr[i + 1], arr[i + 5]] = [arr[i + 5], arr[i + 1]];
      [arr[i + 2], arr[i + 4]] = [arr[i + 4], arr[i + 2]];
    }
    return arr;
  }

  aboutToAppear() {
    var temp = Calendar.getDaysArray(this.year, this.month)
    this.monthDays = temp.days
    this.inMonthArray = temp.inMonthArray
    if (this.CalendarPickerModel.tsLanguage === "Arabic") {
      if (!this.CalendarPickerModel.tsWithNumbers) {
        for (let i = 0; i < this.monthDays.length; i++) {
          this.monthDays[i] = this.replaceNumberWithArabic(+this.monthDays[i])
        }
      }
      this.weekDays = weekDaysInArabic
      this.monthDays = this.rotateAfterEvery7th(this.monthDays)
      this.inMonthArray = this.rotateAfterEvery7th(this.inMonthArray)
      this.months = monthsInArabic
    }

  }

  isCorrect = (startDate: DATE, endDate: DATE): boolean => {
    let sDate = new Date(startDate.getYear(), startDate.getMonth(), startDate.getDay())
    let eDate = new Date(endDate.getYear(), endDate.getMonth(), endDate.getDay())
    if (sDate > eDate) {
      return false;
    }
    else {
      return true
    }
  }
  push = (date: DATE): void => {
    if (this.CalendarPickerModel.tsSetSelection) {
      if (this.CalendarPickerModel.tsSelectionMode === "Single") {
        if (this.selectedDates.length == 0) {
          this.selectedDates.push(date.getDate())
        }
        else {
          this.selectedDates.pop()
          this.selectedDates.push(date.getDate())
        }
      }
      if (this.CalendarPickerModel.tsSelectionMode === "Multi") {
        let d = date.getDate()
        let ind = this.selectedDates.findIndex(x => x[0] == d[0] && x[1] == d[1] && x[2] == d[2])
        if (ind != -1) {
          this.selectedDates.splice(ind, 1)
        }
        else {
          this.selectedDates.push(d)
        }
      }
      if (this.CalendarPickerModel.tsSelectionMode === "Range") {
        let d = date.getDate()
        if (this.selectedDates.length == 0) {
          this.selectedDates.push(d)
        }
        else {
          if (this.selectedDates.length == 1) {
            let startDate: DATE = new DATE(this.selectedDates[0][0], this.selectedDates[0][1], this.selectedDates[0][2])
            if (this.isCorrect(startDate, date)) {
              let tempStart: Date = new Date(this.selectedDates[0][2], this.selectedDates[0][1], this.selectedDates[0][0])
              let tempEnd: Date = new Date(date.getYear(), date.getMonth(), date.getDay())
              tempStart.setDate(tempStart.getDate() + 1)
              const d = new Date(tempStart.getTime())
              while (d <= tempEnd) {
                this.selectedDates.push([d.getDate(), d.getMonth(), d.getFullYear()]);
                d.setDate(d.getDate() + 1);
              }
            }
            else {
              this.selectedDates.pop()
              this.selectedDates.push([date.getDay(), date.getMonth(), date.getYear()])
            }
          }
          else {
            this.selectedDates = []
            this.selectedDates.push(date.getDate())
          }
        }
      }
    }
    if (this.clickListener){
      let dateArray : DATE [] = []
      for (let i = 0;i < this.selectedDates.length;i++){
        dateArray.push(new DATE(this.selectedDates[i][0],
          this.selectedDates[i][1],this.selectedDates[i][2]))
      }
      this.clickListener(dateArray)
    }

  }
  getMessage = (): string => {
    if (this.selectedDates.length == 0) {
      return ""
    }
    if (this.selectedDates.length == 1) {
      return this.selectedDates[0][0] + "/" + (this.selectedDates[0][1] + 1) + "/" + this.selectedDates[0][2]
    }
    else {
      let n = this.selectedDates.length
      if (this.CalendarPickerModel.tsSelectionMode === "Range") {
        return this.selectedDates[0][0] + "/" + (this.selectedDates[0][1] + 1) + "/" + this.selectedDates[0][2] + " - " +
        this.selectedDates[n-1][0] + "/" + (this.selectedDates[n-1][1] + 1) + "/" + this.selectedDates[n-1][2]
      }
      else {
        return "added " + this.selectedDates[n-1][0] + "/" + (this.selectedDates[n-1][1] + 1) + "/" + this.selectedDates[n-1][2]
      }
    }
  }

  build() {
    Column() {
      Text(this.months[this.month-1] + " " +
      ((this.CalendarPickerModel.tsLanguage == "Arabic" &&
      !this.CalendarPickerModel.tsWithNumbers)? this.replaceNumberWithArabic(this.year):this.year))
        .fontSize(this.CalendarPickerModel.tsMonthTextSize)
        .alignSelf(ItemAlign.Start)
        .fontColor(this.CalendarPickerModel.tsMonthTextColor)
      Grid() {
        ForEach(this.weekDays, (item) => {
          GridItem() {
            Text(item).fontSize(this.CalendarPickerModel.tsGridTextSize)
          }
        })
        ForEach(this.monthDays, (item, index) => {
          GridItem() {
            CalendarCellComponent({
              date: item,
              month: this.month - 1,
              year: this.year,
              inMonth: this.inMonthArray[index],
              CalendarPickerModel: $CalendarPickerModel,
              selectedDates: $selectedDates
            })
          }.padding('2vp')
          .onClick(() => {
            let d: DATE = new DATE(item, this.month - 1, this.year)
            this.push(d)
            if (this.CalendarPickerModel.tsSetSelection) {
              prompt.showToast({
                message: this.getMessage()
              })
            }
          })
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr ')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr')
      .width('100%').height('300vp')
    }.padding({ bottom: '10vp' })
  }
}


@CustomDialog
struct DialogBoxComponent {
  options: CalendarOptions
  controller: CustomDialogController
  cancel: () => void
  okay: () => void

  build() {
    Column() {
      Stack({ alignContent: Alignment.Bottom }) {
        CalendarPickerComponent({
          options: {
            tsSelectionMode: this.options.tsSelectionMode,
            tsBgColor: this.options.tsBgColor,
            tsGridTextSize: this.options.tsGridTextSize,
            tsMonthTextSize: this.options.tsMonthTextSize,
            tsMonthTextColor: this.options.tsMonthTextColor,
            tsSelectedTextColor: this.options.tsSelectedTextColor,
            tsSelectedGridBackgroundColor: this.options.tsSelectedGridBackgroundColor,
            tsNotInMonthTextColor: this.options.tsNotInMonthTextColor,
            tsInMonthColor: this.options.tsInMonthColor,
            tsNotInMonthColor: this.options.tsNotInMonthColor,
            tsInMonthTextColor: this.options.tsInMonthTextColor,
            tsSetSelection: this.options.tsSetSelection,
            tsWithNumbers: this.options.tsWithNumbers,
            tsLanguage: this.options.tsLanguage,
            tsGridShape: this.options.tsGridShape,
            tsGridRadius: this.options.tsGridRadius,
            tsDayIcon: this.options.tsDayIcon
          }
        })
        Row() {
          Button({ type: ButtonType.Normal }) {
            Text("Dismiss").fontColor('#FFFFFF').fontSize('20fp')
          }.onClick(() => {
            this.controller.close()
          })
          .width('100vp')
          .backgroundColor(this.options.tsSelectedGridBackgroundColor)
          .shadow({ radius: 3 })
        }.backgroundColor("#FFFFFF").width('100%').height('60vp')
      }
    }.padding('20vp')
  }
}