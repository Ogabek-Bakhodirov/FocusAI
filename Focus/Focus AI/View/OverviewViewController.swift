//
//  OverviewViewController.swift
//  Focus
//
//  Created by Ogabek Bakhodirov on 27/11/24.
//

import UIKit

class OverviewViewController: UIViewController {
    
    lazy var helpLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Help"
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    lazy var plusButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var mainTabledView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        view.register(OverveiwTopCell.self, forCellReuseIdentifier: OverveiwTopCell.cellName)
        view.register(AppAndWebSitesCell.self, forCellReuseIdentifier: AppAndWebSitesCell.cellName)
        view.separatorStyle = .none
        view.backgroundColor = .clear
        
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }

    func setupSubviews(){
        view.addSubview(helpLabel)
        view.addSubview(plusButton)
        view.addSubview(mainTabledView)
        
        NSLayoutConstraint.activate([
            
            helpLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: universalHeight(60)),
            helpLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: universalWidth(20)),
            helpLabel.widthAnchor.constraint(equalToConstant: universalWidth(50)),
            helpLabel.heightAnchor.constraint(equalToConstant: universalHeight(20)),
            
            plusButton.topAnchor.constraint(equalTo: view.topAnchor, constant: universalHeight(60)),
            plusButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: universalWidth(-20)),
            plusButton.widthAnchor.constraint(equalToConstant: universalWidth(20)),
            plusButton.heightAnchor.constraint(equalToConstant: universalHeight(20)),
            
            mainTabledView.topAnchor.constraint(equalTo: helpLabel.bottomAnchor, constant: universalHeight(10)),
            mainTabledView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainTabledView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mainTabledView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
}

extension OverviewViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OverveiwTopCell.cellName) as? OverveiwTopCell else { return UITableViewCell() }
            cell.backgroundColor = .clear
            
            return cell 
        } else if indexPath.row  == 1{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AppAndWebSitesCell.cellName) as? AppAndWebSitesCell else { return UITableViewCell() }
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell 
        } else {
            let cell = UITableViewCell()
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {return universalHeight(201) }
        else if indexPath.row == 1 { return universalHeight(220) }
        else { return 0 }
    }
}



//MARK: - Makes safe area dark
extension OverviewViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
}
