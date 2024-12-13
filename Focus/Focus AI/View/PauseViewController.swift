//
//  PauseViewController.swift
//  Focus
//
//  Created by Ogabek Bakhodirov on 28/11/24.
//

import UIKit

class PauseViewController: UIViewController {
    private let openAIService = OpenAIService()
    private let huggingFaceService = HuggingFaceService()
    private var isKeyboardShown = false
    var font = UIFont.systemFont(ofSize: 16)
    var maxWidth = windowWidth - universalWidth(98)
    
        
    lazy var pauseViewTop: PauseView = {
        let view = PauseView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.gotoappButtonClousure = { 
//            if let selectedApp = URL(string: SELECTED_APP?.app_url ?? "")  {
////                USER_DEFAULTS.set(false, forKey: "isFirstTimeOpeningApp")
//                UIApplication.shared.open(selectedApp) //, options: [:], completionHandler: nil
//            }
            UIApplication.shared.open(URL(string: "instagram://") ?? URL(fileURLWithPath: ""))
            print("App opener tapped -> ????")
        }
        return view 
    }()
    
    //                    
    //                    
    //                    print("tappef+++")
    //                    UIApplication.shared.open(selectedApp, options: [:], completionHandler: nil) //, options: [:], completionHandler: nil
    //                    if let appURL = URL(string: SELECTED_APP?.app_url ?? ""), UIApplication.shared.canOpenURL(appURL) {
    //                        UIApplication.shared.open(appURL)
    //                        print("//////")
    //                    } else {
    //                        print("URL noto‘g‘ri yoki mavjud emas")
    //                    }
    
    
    lazy var mainBackgroundView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "MainBackgroundColor")
        return view
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.register(AIMessageCell.self, forCellReuseIdentifier: AIMessageCell.cellName)
        view.register(UserMessageCell.self, forCellReuseIdentifier: UserMessageCell.cellName)
        let hideKeyboardTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(hideKeyboard))
        hideKeyboardTap.cancelsTouchesInView = false
        view.addGestureRecognizer(hideKeyboardTap)
        view.separatorStyle = .none
        view.delegate = self
        view.dataSource = self
        return view
        
    }()
    
    lazy var customTextField: CustomTextField = {
       let view = CustomTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.onKeyboardTapped = { [weak self] tapped in
            self?.isKeyboardShown = tapped
            self?.textFieldUpWhenKeyboardOpened()
        }
        view.sentMessage = { [weak self] user in
            self?.huggingFaceQA(question: user.conversationHistory.last?.content ?? "")
            self?.tableView.reloadData()
            print(user)
//            print("Open youteb")
//            self?.openApp()
        }
        return view
    }()

    
    
    lazy var openAppButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Open App", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button 
    }()
    
//MARK: - Make Dark Safe Area
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    func openYoutube() {
        if let youtube = URL(string: "youtube://") {
            if UIApplication.shared.canOpenURL(youtube) {
                // Instagram is installed, open the app
                UIApplication.shared.open(youtube, options: [:], completionHandler: nil)
            } 
        }
    }
    
        
    func textFieldUpWhenKeyboardOpened(){
        if isKeyboardShown{
            customTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: universalHeight(-50)).isActive = false
            self.customTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: universalHeight(-300)).isActive = true
            self.tableView.bottomAnchor.constraint(equalTo: customTextField.topAnchor).isActive = true
            self.tableView.topAnchor.constraint(equalTo: pauseViewTop.bottomAnchor).isActive = true
           
        } else if isKeyboardShown == false {
            customTextField.removeFromSuperview()
            tableView.removeFromSuperview()
            view.addSubview(tableView)
            view.addSubview(customTextField)
            
            self.customTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: universalHeight(-300)).isActive = false
            
            NSLayoutConstraint.activate([
                customTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: universalHeight(-50)),
                customTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: universalWidth(20)),
                customTextField.widthAnchor.constraint(equalToConstant: windowWidth - universalWidth(40)),
                customTextField.heightAnchor.constraint(equalToConstant: universalHeight(46)),
                
                tableView.topAnchor.constraint(equalTo: pauseViewTop.bottomAnchor),
                tableView.bottomAnchor.constraint(equalTo: customTextField.topAnchor),
                tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
                tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
                
            ])
        }
                
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()  // Forces the layout to update
        }
    }
    


    func setupSubviews(){
        view.addSubview(mainBackgroundView)
        view.addSubview(pauseViewTop)
        view.addSubview(tableView)
        view.addSubview(customTextField)
        
        NSLayoutConstraint.activate([
            
            mainBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            mainBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainBackgroundView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mainBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            
            pauseViewTop.topAnchor.constraint(equalTo: view.topAnchor),
            pauseViewTop.leftAnchor.constraint(equalTo: view.leftAnchor),
            pauseViewTop.rightAnchor.constraint(equalTo: view.rightAnchor),
            pauseViewTop.heightAnchor.constraint(equalToConstant: universalHeight(102)),
            
            customTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: universalHeight(-50)),
            customTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: universalWidth(20)),
            customTextField.widthAnchor.constraint(equalToConstant: windowWidth - universalWidth(40)),
            customTextField.heightAnchor.constraint(equalToConstant: universalHeight(46)),
            
            tableView.topAnchor.constraint(equalTo: pauseViewTop.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: customTextField.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),

        ])
    }
}




extension PauseViewController {
    //    @objc func buttonTapped(){ openApp() }
    
    
    // Dismiss the keyboard
    @objc func hideKeyboard() {
        
        if isKeyboardShown {
            isKeyboardShown = false
            textFieldUpWhenKeyboardOpened()  // Reset the layout when the keyboard disappears
        }
    }

    
    @objc private func buttonTapped() {
        
        //MARK: - Open AI
        
        //        guard let prompt = mainBackgroundView.resposeFromAILabel.text, !prompt.isEmpty else {
        ////               mainBackgroundView.text = "Please enter a prompt."
        //               return
        //           }
        //
        //        print(prompt)
        //        openAppButton.setTitle("Loadeing>>>>", for: .normal)
        //           openAIService.fetchResponse(for: prompt) { [weak self] response in
        //               DispatchQueue.main.async {
        //                   self?.mainBackgroundView.resposeFromAILabel.text = response ?? "No response received."
        //                   print(response)
        //               
        //        }
        //    }
        
        
        //MARK: - Hugging Face Service
    }
    
    func huggingFaceQA(question: String){
        huggingFaceService.fetchResponse(for: question) { response in
            if let response = response {
                DispatchQueue.main.async {
                    USER.addMessage(id: "1", sender: .ai, content: response, messageType: .text)
                    self.tableView.reloadData()
                }
            } else {
                print("Failed to get a response from the model.")
            }
        }
    }
}


//MARK: - YouTube Logic
extension PauseViewController{
    //MARK: - We use it when user wants to open You Tube. That moment we analyze and identify user's interest and return it
        func getUserInterest() -> String?{
            let userInterest = "Math topics" // Example interest
            let encodedQuery = userInterest.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            return encodedQuery
        }
        
        
    //MARK: - Opens You Tube with given interest promt and opens You Tube with given research query
        func openApp(){
            if let query = getUserInterest(), let youtubeURL = URL(string: "youtube://results?search_query=\(query)") {
                if UIApplication.shared.canOpenURL(youtubeURL) {
                    UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
                } else if let browserURL = URL(string: "https://www.youtube.com/results?search_query=\(query)") {
                    // Fallback to browser if YouTube app is not installed
                    UIApplication.shared.open(browserURL, options: [:], completionHandler: nil)
                }
            }
        }
}

//MARK: - TableView extensions
extension PauseViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return USER.conversationHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = USER.conversationHistory[indexPath.row]
        let labelSize = calculateLabelSize(for: message.content, font: font, maxWidth: windowWidth - universalWidth(98))
        if message.sender == .ai {
            let cell = AIMessageCell(chatMessage: message.content, labelSize: labelSize, font: font)
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = UserMessageCell(chatMessage: message.content, labelSize: labelSize, font: font)
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let message = USER.conversationHistory[indexPath.row]
        let labelSize = calculateLabelSize(for: message.content, font: font, maxWidth: windowWidth - universalWidth(98))
        if message.sender == .ai {
            guard labelSize.height > 52 else { return 65 }
            return labelSize.height + 45
        } else {
            return labelSize.height + 45
        } 
    }
}
