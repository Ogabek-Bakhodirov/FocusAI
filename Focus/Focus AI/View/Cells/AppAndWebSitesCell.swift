//
//  AppAndWebSitesCell.swift
//  Focus AI
//
//  Created by Ogabek Bakhodirov on 29/11/24.
//

import UIKit

class AppAndWebSitesCell: UITableViewCell{
    static let cellName = String(describing: AppAndWebSitesCell.self)
    
    lazy var mainView: UIView = {
       let view = UIView() 
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var summaryLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Apps and Websites"
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews(){
        
        self.addSubview(mainView)
        mainView.addSubview(summaryLabel)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: self.topAnchor),
            mainView.leftAnchor.constraint(equalTo: self.leftAnchor),
            mainView.rightAnchor.constraint(equalTo: self.rightAnchor),
            mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            summaryLabel.topAnchor.constraint(equalTo: mainView.topAnchor),
            summaryLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: universalWidth(20)),
            summaryLabel.widthAnchor.constraint(equalToConstant: windowWidth),
            summaryLabel.heightAnchor.constraint(equalToConstant: universalHeight(23)),
        
        ])
    }
}














