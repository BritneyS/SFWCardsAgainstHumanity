//
//  HTMLDecode.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/17/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation

class HTMLDecode {
    
    static func decodeHTMLString(for htmlEncodedString: String) -> NSAttributedString {
        guard let data = htmlEncodedString.data(using: .utf8) else { return NSAttributedString() }
        
        do {
            return try NSAttributedString(data: data, options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
                ], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
}
