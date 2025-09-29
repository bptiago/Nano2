//
//  QuizView.swift
//  Nano2
//
//  Created by Tiago Prestes on 24/09/25.
//

import UIKit

class QuizView: UIView {
    var updateScore: () -> Void = {}
    var updateQuizNode: () -> Void = {}
    var quizNode: QuizNode
    
    init(quizNode: QuizNode, frame: CGRect = .zero) {
        self.quizNode = quizNode
        
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubviews()
    }

    @available(*, unavailable, message: "Use init(quizNode:) for ViewCode.")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Actions
    @objc
    func didPressButton(_ sender: UIButton) {
        if sender.titleLabel?.text == quizNode.options[quizNode.answer] {
            updateScore()
        }
        updateQuizNode()
    }
    
    /// Elementos
    lazy var imageView: UIImageView = {
        let image = UIImage(resource: .quiz)
        
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: DesignToken.title1, weight: .bold)
        
        return label
    }()
    
    private func makeOptionButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle(title, for: .normal)
        button.contentHorizontalAlignment = .leading
        button.tintColor = .black
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.appOrange.cgColor
        button.layer.cornerRadius = 8
        
        button.addTarget(
            self,
            action: #selector(didPressButton(_:)),
            for: .touchUpInside
        )
        
        button.heightAnchor.constraint(equalToConstant: 70).isActive = true
        button.widthAnchor.constraint(equalToConstant: 360).isActive = true
        
        return button
    }
    
    /// Layout / Stacks
    lazy var mainStackView: UIStackView = {
        let stack = UIStackView(
            arrangedSubviews: [imageView, questionLabel, optionsStackView]
        )
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.axis = .vertical
        stack.alignment = .top
        stack.spacing = 32
        
        return stack
    }()
    
    lazy var optionsStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 16
        
        return stack
    }()
    
    ///Setup
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            mainStackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16),
            
            imageView.widthAnchor.constraint(equalToConstant: 360),
            imageView.heightAnchor.constraint(equalToConstant: 255),
        ])
    }
    
    private func addSubviews() {
        addSubview(mainStackView)
        loadContent(with: quizNode)
        setupConstraints()
    }
    
    func loadContent(with quizNode: QuizNode) {
        self.quizNode = quizNode
        
        questionLabel.text = quizNode.question
        
        optionsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for opt in quizNode.options {
            let button = makeOptionButton(title: opt)
            optionsStackView.addArrangedSubview(button)
        }
    }
}
