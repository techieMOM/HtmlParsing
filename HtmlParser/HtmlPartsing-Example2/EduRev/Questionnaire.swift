//
//  Questionnaire.swift
//  EduRev
//
//  Created by SOWJI on 13/11/20.
//

import Foundation

class Questionnaire : Decodable {
    var auName  : String?
    var pAnsUserName  : String?
    var fPost  : String?
    var pAnswer  : String?
    
    private enum CodingKeys: String, CodingKey {
        case auName
        case pAnsUserName
        case fPost
        case pAnswer
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        auName = try values.decodeIfPresent(String.self, forKey: .auName) ?? ""
        pAnsUserName = try values.decodeIfPresent(String.self, forKey: .pAnsUserName) ?? ""
        fPost = try values.decodeIfPresent(String.self, forKey: .fPost) ?? ""
        pAnswer = try values.decodeIfPresent(String.self, forKey: .pAnswer) ?? ""
        
    }
    
}
