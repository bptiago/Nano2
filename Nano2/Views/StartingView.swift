//
//  StartingView.swift
//  Nano2
//
//  Created by Tiago Prestes on 24/09/25.
//

import Foundation
import UIKit

class StartingView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: UI
    let appName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Como planejar um rolê"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
//    let stackView: UIStackView = {
//    
//    }()
}


