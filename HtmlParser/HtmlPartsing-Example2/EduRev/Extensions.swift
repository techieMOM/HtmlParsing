//
//  Extensions.swift
//  EduRev
//
//  Created by SOWJI on 13/11/20.
//

import Foundation
import UIKit

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

func checkForUrls(text: String) -> [URL] {
    let types: NSTextCheckingResult.CheckingType = .link

    do {
        let detector = try NSDataDetector(types: types.rawValue)

        let matches = detector.matches(in: text, options: .reportCompletion, range: NSMakeRange(0, text.count))
    
        return matches.compactMap({$0.url})
    } catch let error {
        debugPrint(error.localizedDescription)
    }

    return []
}
