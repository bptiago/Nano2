//
//  StartingView.swift
//  Nano2
//
//  Created by Tiago Prestes on 24/09/25.
//

import Foundation
import UIKit

class StartingView: UIView {
    var onButtonPress: () -> Void = {}
    
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
    
    lazy var imageView: UIImageView = {
        let image = UIImage(resource: .start)
        
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let textTitle: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.numberOfLines = 0
        label.text = "O negócio é o seguinte..."
        label.font = .systemFont(ofSize: DesignToken.body, weight: .semibold)
        
        return label
    }()
    
    let textBody1: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.numberOfLines = 0
        label.text = "Os seus amigos combinaram de ir na sua casa para um rolezinho (sem você saber)"
        label.font = .systemFont(ofSize: DesignToken.body, weight: .regular)
        
        return label
    }()
    
    let textBody2: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.numberOfLines = 0
        label.text = "Tem absolutamente nada na sua casinha e o tempo está correndo. Como vocês vão se organizar?"
        label.font = .systemFont(ofSize: DesignToken.body, weight: .regular)
        
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold)
        let image = UIImage(systemName: "arrow.forward", withConfiguration: config)
        
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.backgroundColor = .appOrange
        button.layer.cornerRadius = 30
        
        button.addTarget(
            self,
            action: #selector(didPressButton),
            for: .touchUpInside
        )
        
        return button
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
            arrangedSubviews: [labelStackView, imageView, textStackView, button]
        )
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 32
        
        return stack
    }()
    
    lazy var textStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.addArrangedSubview(textTitle)
        stack.addArrangedSubview(textBody1)
        stack.addArrangedSubview(textBody2)
        stack.axis = .vertical
        stack.spacing = 16
        
        return stack
    }()
    
    /// Setup
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            mainStackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16),
            
            imageView.widthAnchor.constraint(equalToConstant: 360),
            imageView.heightAnchor.constraint(equalToConstant: 255),
            
            button.heightAnchor.constraint(equalToConstant: 60),
            button.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func addSubviews() {
        addSubview(mainStackView)
        setupConstraints()
    }
    
    // Actions
    @objc
    func didPressButton() {
        onButtonPress()
    }
}


