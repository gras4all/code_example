//
//  NSAttributedSring+Size.swift
//  PostsFeed
//
//  Created by Andrey Grunenkov on 06.12.2022.
//  Copyright © 2022 Andrey Grunenkov. All rights reserved.
//

import UIKit

extension NSAttributedString {
    
    func height(widthLimit: CGFloat) -> CGFloat {
        let rect = self.boundingRect(with: CGSize(width: widthLimit, height: .greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        return ceil(rect.size.height)
    }
    
    func width(heightLimit: CGFloat) -> CGFloat {
        let rect = self.boundingRect(with: CGSize(width: .greatestFiniteMagnitude, height: heightLimit), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        return ceil(rect.size.width)
    }
    
}
