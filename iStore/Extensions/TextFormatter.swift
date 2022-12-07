//
//  TextFormatter.swift
//  PostsFeed
//
//  Created by Andrey Grunenkov on 06.12.2022.
//  Copyright © 2022 Andrey Grunenkov. All rights reserved.
//

import UIKit

struct TextFormatter {
    
    static func descriptionText(with text: String) -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)
        ]
        return NSAttributedString(
            string: text,
            attributes: attributes
        )
    }
    
    static func titleText(with text: String) -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19, weight: .bold),
        ]
        
        return NSAttributedString(
            string: text,
            attributes: attributes
        )
    }
    
    static func priceText(with text: String) -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.blue,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .medium),
        ]
        
        return NSAttributedString(
            string: text,
            attributes: attributes
        )
    }
    
}
