//
//  PayLoadPresenter.swift
//  VIPER_Project
//
//  Created by Amarprakash Mishra on 10/05/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import Foundation

protocol AddPresenterLogic {
    func initialContactInteractor()
    func setDataToSelectVC(selectedRow: Int)
    func contactInteractor(selectYear: SelectYearVC, selectedRow: Int)
    var interactor: PayloadInteractor? { get set }
    var viewController: ViewController? { get set }
    var fields: [PayLoadResponse.Field] { get set }
}

class PayLoadPresenter: AddPresenterLogic {
    var interactor: PayloadInteractor?
    
    var viewController: ViewController?
    var fields = [PayLoadResponse.Field]()
    var selectYear: SelectYearVC?
    var yearData = [PayLoadResponse.YearField]()
    var makeRes = [MakePayLoadRes.MakeField]()
    var modelRes = [ModelPayLoadRes.ModelField]()
    var selectedValueFromPicker: String?
    
    func contactInteractor(selectYear: SelectYearVC, selectedRow: Int) {
        self.selectYear = selectYear
        setDataToSelectVC(selectedRow: selectedRow)
    }
    
    func initialContactInteractor() {
        interactor?.callingAPI() {
            self.viewController?.reloadTableViewData()
        }
    }
    
    func setDataToSelectVC(selectedRow: Int) {
        
        if selectedRow == 0 {
            for year in yearData {
                selectYear?.curArr.append(year.label)
            }
        }
            
        else if selectedRow == 1 {
            interactor?.payloadAPI.fieldId = self.fields[2].id
            for make in makeRes {
                selectYear?.curArr.append(make.label)
            }
        }
            
        else if selectedRow == 2 {
            for model in modelRes {
                selectYear?.curArr.append(model.label)
            }
        }
        
        selectYear?.selectedValueFromPicker = { value in
            self.fields[selectedRow].displayName = value
            self.interactor?.findMakeModel(selectedRow: selectedRow, value: value)
            self.viewController?.reloadTableViewData()
        }
    }
}
