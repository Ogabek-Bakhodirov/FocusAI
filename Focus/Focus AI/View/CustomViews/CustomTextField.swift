//
//  CustomTextField.swift
//  Focus AI
//
//  Created by Ogabek Bakhodirov on 29/11/24.
//

import UIKit

class CustomTextField: UIView{
    
    var isKeyboardShown = false
        
    var onKeyboardTapped: ((Bool) -> Void)?
        
    private lazy var mainBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.backgroundColor = #colorLiteral(red: 0.8784313725, green: 0.8941176471, blue: 0.9215686275, alpha: 1)
        return view
    }()
    
    lazy var textFieldView: UITextField = {
        let view = UITextField()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        let textFieldTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(isKeyboardTapped))
        textFieldTap.cancelsTouchesInView = false
        view.textColor = .black
        view.attributedPlaceholder = NSAttributedString(
            string: "Type message...",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "LightTextColor")])
        view.addGestureRecognizer(textFieldTap)
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    func setupSubviews(){
        
        self.addSubview(mainBackground)
        mainBackground.addSubview(textFieldView)
        
        NSLayoutConstraint.activate([
            mainBackground.topAnchor.constraint(equalTo: topAnchor),
            mainBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainBackground.leftAnchor.constraint(equalTo: leftAnchor),
            mainBackground.rightAnchor.constraint(equalTo: rightAnchor),
            
            textFieldView.topAnchor.constraint(equalTo: topAnchor),
            textFieldView.bottomAnchor.constraint(equalTo: bottomAnchor),
            textFieldView.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            textFieldView.rightAnchor.constraint(equalTo: rightAnchor, constant: -25),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    @objc func isKeyboardTapped(){
        textFieldView.becomeFirstResponder()
        isKeyboardShown = true
        onKeyboardTapped?(isKeyboardShown)
    }
}
