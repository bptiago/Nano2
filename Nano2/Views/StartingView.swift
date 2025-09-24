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
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /// Elementos
    let appTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Como planejar um rolê"
        label.font = .systemFont(ofSize: DesignToken.largeTitle, weight: .bold)
        
        return label
    }()
    
    let appSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "(de última hora)"
        label.font = .systemFont(ofSize: DesignToken.body, weight: .semibold)
        label.textColor = .gray
        label.textAlignment = .center
        
        return label
    }()
    
    /// Layout / Stacks
    lazy var labelStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.addArrangedSubview(appTitle)
        stack.addArrangedSubview(appSubtitle)
        stack.axis = .vertical
        stack.spacing = 4
        
        return stack
    }()
    
    lazy var mainStackView: UIStackView = {
        let stack = UIStackView(
            arrangedSubviews: [labelStackView]
        )
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 32
        
        return stack
    }()
    
    /// Setup
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            mainStackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16)
        ])
    }
    
    private func addSubviews() {
        addSubview(mainStackView)
        setupConstraints()
    }
}


