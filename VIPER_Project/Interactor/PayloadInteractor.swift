//
//  PayloadViewModel.swift
//  VIPER_Project
//
//  Created by Amarprakash Mishra on 09/05/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import Foundation

protocol AddBusinessLogic {
    func callingAPI(completion: @escaping callingAPICompletion)
    func findMakeModel(selectedRow: Int, value: String)
}

class PayloadInteractor: AddBusinessLogic {
    struct YearField {
        let label: String
    }
    var selectedYear: String?
    var selectedMake: String?
    let payloadAPI = PayloadAPI()
    var presenter: PayLoadPresenter?
    
    func callingAPI(completion: @escaping callingAPICompletion) {
        payloadAPI.getPayloadUrlSession { (payloadRes) in
            if let ploadRes = payloadRes {
                self.presenter?.fields = ploadRes.payload.forms.first?.fields ?? []
                self.payloadAPI.id = ploadRes.payload.forms.first?.id
                guard let yearData = self.presenter?.fields.first?.data else { return }
                self.payloadAPI.fieldId = self.presenter?.fields[1].id
                self.presenter?.yearData = yearData
                self.presenter?.setDataToSelectVC(selectedRow: 0)
                completion()
            }
        }
    }
    
    func findMakeModel(selectedRow: Int, value: String) {
        if selectedRow == 0 {
            self.payloadAPI.getMakePayloadUrlSession(year: value) { (payloadRes) in
                self.selectedYear = value
                if let ploadRes = payloadRes {
                    self.presenter?.makeRes = ploadRes.payload.data
                }
            }
        }
            
        else if selectedRow == 1 {
            self.payloadAPI.getModelPayloadUrlSession(year: self.selectedYear, make: value) { (payloadRes) in
                if let ploadRes = payloadRes {
                    self.presenter?.modelRes = ploadRes.payload.data
                }
            }
        }
    }
}

