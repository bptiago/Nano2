//
//  ResultView.swift
//  Nano2
//
//  Created by Tiago Prestes on 28/09/25.
//

import UIKit

class ResultView: UIView {
    var onButtonPress: () -> Void = {}
    var score: Int
    
    init(score: Int, frame: CGRect = .zero) {
        self.score = score
        
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubviews()
    }
    
    @available(*, unavailable, message: "Use init(quizNode:) for ViewCode.")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Actions
    @objc
    private func didPressButton() {
        onButtonPress()
    }
    
    /// Elementos
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: DesignToken.title1, weight: .bold)
        label.text = String(format: "Score: %d/80", score)
        
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImage(resource: .timeout)
        
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let textTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "O seu tempo acabou..."
        label.font = .systemFont(ofSize: DesignToken.body, weight: .semibold)
        label.textAlignment = .left
        
        return label
    }()
    
    let textBody1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Vocês se enrolaram ali no segundo tempo e não conseguiram se organizar. Agora o rolê tá meio improvisado, nada do jeito que vocês queriam."
        label.textAlignment = .left
        
        return label
    }()
    
    let textBody2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Mas já que tá marcado, bora fazer o melhor possível né."
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold)
        let image = UIImage(systemName: "arrow.clockwise", withConfiguration: config)
        
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
    lazy var mainStackView: UIStackView = {
        let stack = UIStackView(
            arrangedSubviews: [scoreLabel, imageView, textStackView, button]
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
        stack.alignment = .leading
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
            button.widthAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    private func addSubviews() {
        self.addSubview(mainStackView)
        setupConstraints()
    }
}
