//
//  OverveiwTopCell.swift
//  Focus AI
//
//  Created by Ogabek Bakhodirov on 29/11/24.
//

import UIKit

class OverveiwTopCell: UITableViewCell {
    
    static let cellName = String(describing: OverveiwTopCell.self)
    
    lazy var overViewLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Overview"
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        return label
    }()
    
    lazy var summaryView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.backgroundColor = .black
        return view
    }()
    
    lazy var summaryLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Summary"
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    lazy var attempNumberLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "19 x"
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    lazy var attempNumberTextLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Prevented"
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var savedTimesAmountLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "57 mins"
        label.textAlignment = .right
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    lazy var savedTimesAmountTextLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Time saved"
        label.textAlignment = .right
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        setupSubviews()
    }
    
    
    func setupSubviews(){
        
            self.addSubview(overViewLabel)
            self.addSubview(summaryView)
            self.addSubview(summaryLabel)
            self.addSubview(attempNumberLabel)
            self.addSubview(savedTimesAmountLabel)
            self.addSubview(attempNumberTextLabel)
            self.addSubview(savedTimesAmountTextLabel)
            
            NSLayoutConstraint.activate([

                overViewLabel.topAnchor.constraint(equalTo: self.topAnchor),
                overViewLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: universalWidth(20)),
                overViewLabel.widthAnchor.constraint(equalToConstant: universalWidth(150)),
                overViewLabel.heightAnchor.constraint(equalToConstant: universalHeight(36)),
                
                summaryView.topAnchor.constraint(equalTo: overViewLabel.bottomAnchor, constant: universalHeight(10)),
                summaryView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: universalWidth(20)),
                summaryView.widthAnchor.constraint(equalToConstant: windowWidth-universalWidth(40)),
                summaryView.heightAnchor.constraint(equalToConstant: universalHeight(125)),
                
                summaryLabel.topAnchor.constraint(equalTo: summaryView.topAnchor, constant: universalHeight(15)),
                summaryLabel.leftAnchor.constraint(equalTo: summaryView.leftAnchor, constant: universalWidth(20)),
                summaryLabel.widthAnchor.constraint(equalToConstant: universalWidth(93)),
                summaryLabel.heightAnchor.constraint(equalToConstant: universalHeight(23)),
                
                attempNumberLabel.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor, constant: universalHeight(15)),
                attempNumberLabel.leftAnchor.constraint(equalTo: summaryView.leftAnchor, constant: universalWidth(20)),
                attempNumberLabel.widthAnchor.constraint(equalToConstant: universalWidth(120)),
                attempNumberLabel.heightAnchor.constraint(equalToConstant: universalHeight(23)),
                
                savedTimesAmountLabel.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor, constant: universalHeight(15)),
                savedTimesAmountLabel.rightAnchor.constraint(equalTo: summaryView.rightAnchor, constant: universalWidth(-20)),
                savedTimesAmountLabel.widthAnchor.constraint(equalToConstant: universalWidth(120)),
                savedTimesAmountLabel.heightAnchor.constraint(equalToConstant: universalHeight(23)),
                
                attempNumberTextLabel.topAnchor.constraint(equalTo: attempNumberLabel.bottomAnchor, constant: universalHeight(5)),
                attempNumberTextLabel.leftAnchor.constraint(equalTo: summaryView.leftAnchor, constant: universalWidth(20)),
                attempNumberTextLabel.widthAnchor.constraint(equalToConstant: universalWidth(80)),
                attempNumberTextLabel.heightAnchor.constraint(equalToConstant: universalHeight(19)),
                
                savedTimesAmountTextLabel.topAnchor.constraint(equalTo: savedTimesAmountLabel.bottomAnchor, constant: universalHeight(5)),
                savedTimesAmountTextLabel.rightAnchor.constraint(equalTo: summaryView.rightAnchor, constant: universalWidth(-20)),
                savedTimesAmountTextLabel.widthAnchor.constraint(equalToConstant: universalWidth(100)),
                savedTimesAmountTextLabel.heightAnchor.constraint(equalToConstant: universalHeight(23)),
                        
            ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
