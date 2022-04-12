//
//  DatePickerView.swift
//  CustomView
//
//  Created by tri.nguyen on 12/04/2022.
//

import Foundation
import UIKit

class DatePickerView: UIPickerView {
    
    // MARK: - Properties
    var dateCollection = [Date]()
    
    // MARK: - Function
    func selectDate() -> Int {
        dateCollection = buildDateCollection()
        var row = 0
        for index in dateCollection.indices {
            let today = Date()
            if Calendar.current.compare(today, to: dateCollection[index], toGranularity: .day) == .orderedSame {
                row = index
            }
        }
        return row
    }
    
    func buildDateCollection() -> [Date] {
        dateCollection.append(contentsOf: Date.previousYear())
        dateCollection.append(contentsOf: Date.nextYear())
        return dateCollection
    }
}

// MARK: - Date Extention
extension Date {
    
    static func nextYear() -> [Date] {
        return Date.next(numberOfDays: 365, from: Date())
    }
    
    static func previousYear() -> [Date] {
        return Date.next(numberOfDays: 365, from: Calendar.current.date(byAdding: .year, value: -1, to: Date())!)
    }
    
    static func next(numberOfDays: Int, from startDate: Date) -> [Date] {
        var dates = [Date]()
        for i in 0..<numberOfDays {
            if let date = Calendar.current.date(byAdding: .day, value: i, to: startDate) {
                dates.append(date)
            }
        }
        return dates
    }
}

// MARK: - Extention DatePickerDelegate & DataSource
extension DatePickerView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let date = formatDate(date: self.dateCollection[row])
        NotificationCenter.default.post(name: .dateChanged, object: nil, userInfo: ["date": date])
    }
    
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: date)
    }
}

extension DatePickerView: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dateCollection.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let label = formatDatePicker(date: dateCollection[row])
        return label
    }
    
    func formatDatePicker(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.string(from: date)
    }
    
}
