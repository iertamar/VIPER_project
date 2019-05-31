//
//  SelectedYearExt.swift
//  VIPER_Project
//
//  Created by Amarprakash Mishra on 08/05/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import UIKit

extension SelectYearVC: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return curArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return curArr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //selectedValueFromPicker!(curArr[row])
        selectedRow = row
    }
}
