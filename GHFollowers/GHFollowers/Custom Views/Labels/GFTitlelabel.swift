//
//  GFTitlelabel.swift
//  GHFollowers
//
//  Created by taher elnehr on 11/11/2024.
//

import UIKit

class GFTitlelabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    convenience init(textAligment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAligment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold )
        
    }
    private func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
