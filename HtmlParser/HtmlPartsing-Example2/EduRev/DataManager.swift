//
//  DataManager.swift
//  EduRev
//
//  Created by SOWJI on 13/11/20.
//

import Foundation

class DataManager {
    class func fetchQuestionnaire(completion:@escaping ([Questionnaire])->Void) {
        if let dataURL = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: dataURL, options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Questionnaire].self, from:  data)
                completion(jsonData)
            } catch {
                print(error)
                completion([])
            }
        }
    }
}
