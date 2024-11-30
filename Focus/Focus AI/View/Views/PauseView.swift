//
//  PauseView.swift
//  Focus
//
//  Created by Ogabek Bakhodirov on 28/11/24.
//

import UIKit

class PauseView: UIView{
    
    lazy var backArrowButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var threeDotButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var focusAILabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Focus AI"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    lazy var supportTimeLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Helping you 24/7"
        label.textAlignment = .center
        label.textColor = UIColor(named: "LightTextColor")
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    
    
    func setupSubviews(){
        
        self.addSubview(backArrowButton)
        self.addSubview(threeDotButton)   
        self.addSubview(focusAILabel)
        self.addSubview(supportTimeLabel)
        
        NSLayoutConstraint.activate([
            backArrowButton.topAnchor.constraint(equalTo: self.topAnchor, constant: universalHeight(69)),
            backArrowButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: universalWidth(20)),
            backArrowButton.widthAnchor.constraint(equalToConstant: universalWidth(18)),
            backArrowButton.heightAnchor.constraint(equalToConstant: universalHeight(18)),
            
            threeDotButton.topAnchor.constraint(equalTo: self.topAnchor, constant: universalHeight(69)),
            threeDotButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: universalWidth(-20)),
            threeDotButton.widthAnchor.constraint(equalToConstant: universalWidth(18)),
            threeDotButton.heightAnchor.constraint(equalToConstant: universalHeight(18)),
            
            focusAILabel.topAnchor.constraint(equalTo: self.topAnchor, constant: universalHeight(50)),
            focusAILabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: (windowWidth - universalWidth(75)) / 2),
            focusAILabel.widthAnchor.constraint(equalToConstant: universalWidth(75)),
            focusAILabel.heightAnchor.constraint(equalToConstant: universalHeight(22)),
            
            supportTimeLabel.topAnchor.constraint(equalTo: focusAILabel.bottomAnchor, constant: universalHeight(6)),
            supportTimeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: (windowWidth - universalWidth(135)) / 2),
            supportTimeLabel.widthAnchor.constraint(equalToConstant: universalWidth(135)),
            supportTimeLabel.heightAnchor.constraint(equalToConstant: universalHeight(19)),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
