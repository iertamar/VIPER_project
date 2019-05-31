//
//  PayloadAPI.swift
//  VIPER_Project
//
//  Created by Amarprakash Mishra on 08/05/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import Foundation

class PayloadAPI {
    var id: String?
    var fieldId: String?
    func getPayloadUrlSession(completion: @escaping payLoadCompletion){
        guard let url = URL(string: "\(constURL)/config?pageId=ITEM_PAGE&partTypeId=6192") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else{
                debugPrint(error.debugDescription)
                completion(nil)
                return
            }
            guard let data = data else{
                return
            }
            let jsonDecoder =  JSONDecoder()
            do {
                let ploadRes = try jsonDecoder.decode(PayLoadResponse.self , from: data)
                DispatchQueue.main.async {
                    completion(ploadRes)
                }
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
            
        }
        task.resume()
    }
    func getMakePayloadUrlSession(year: String, completion: @escaping MakePayLoadCompletion){
        let urlString = "\(constURL)/forms/\(id!)/fields/\(fieldId!)/options?vehicleYear=\(year)"
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else{
                debugPrint(error.debugDescription)
                completion(nil)
                return
            }
            guard let data = data else{
                return
            }
            let jsonDecoder =  JSONDecoder()
            do {
                let makeRes = try jsonDecoder.decode(MakePayLoadRes.self , from: data)
                DispatchQueue.main.async {
                    completion(makeRes)
                }
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
        }
        task.resume()
    }
    
    func getModelPayloadUrlSession(year: String?, make: String, completion: @escaping ModelPayLoadCompletion){
        let urlString = "\(constURL)/forms/\(id!)/fields/\(fieldId!)/options?vehicleYear=\(year ?? "")&vehicleMake=\(make)"
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else{
                debugPrint(error.debugDescription)
                completion(nil)
                return
            }
            guard let data = data else{
                return
            }
            let jsonDecoder =  JSONDecoder()
            do {
                let modelRes = try jsonDecoder.decode(ModelPayLoadRes.self , from: data)
                DispatchQueue.main.async {
                    completion(modelRes)
                }
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
        }
        task.resume()
    }
}
