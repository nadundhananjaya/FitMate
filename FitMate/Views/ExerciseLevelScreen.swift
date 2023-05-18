//
//  ExerciseLevelScreen.swift
//  FitMate
//
//  Created by Nadun Dhananjaya on 2023-05-14.
//

import UIKit
import SwiftKeychainWrapper

class ExerciseLevelScreen: UIViewController {

   
    //Var
    
    var level : String = ""
    
    //UI Comps
    
    let progressView : UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.setProgress(5/6, animated: true)
        progressView.trackTintColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
        progressView.progressTintColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        return progressView
    }()
    
    let stepCountLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1.0)
        label.text = "Step 5/6"
        label.textAlignment = .center
        return label
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26, weight: .thin)
        label.text = "What's your exercise level ? "
        label.textAlignment = .center
        return label
    }()
    
  
    
    let image : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "exercise"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let IamLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "I am"
        label.textAlignment = .center
        return label
    }()
    
    
    let buttonBeginner : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Beginner", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 26, weight: .light)
        button.layer.borderWidth = 1.0
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let buttonInter : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Intermediate", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 26, weight: .light)
        button.layer.borderWidth = 1.0
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
   
    let buttonAdv : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Advanced", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 26, weight: .light)
        button.layer.borderWidth = 1.0
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let vStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    let buttonContinue : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .white
        view.addSubview(progressView)
        view.addSubview(stepCountLabel)
        view.addSubview(titleLabel)
        view.addSubview(image)
        view.addSubview(IamLabel)
        
        vStack.addArrangedSubview(buttonBeginner)
        vStack.addArrangedSubview(buttonInter)
        vStack.addArrangedSubview(buttonAdv)
        
        view.addSubview(vStack)
        view.addSubview(buttonContinue)
        
        progressView.frame = CGRect(x: (view.frame.size.width)/8, y: 100, width: view.frame.size.width-100, height: 20)
        
        //Button actions
        
        buttonBeginner.addTarget(self, action: #selector(btnB), for: .touchUpInside)
        buttonInter.addTarget(self, action: #selector(btnI), for: .touchUpInside)
        buttonAdv.addTarget(self, action: #selector(btnA), for: .touchUpInside)
        buttonContinue.addTarget(self, action: #selector(getNext), for: .touchUpInside)
        
        //Constraints

        NSLayoutConstraint.activate([
            stepCountLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stepCountLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stepCountLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: stepCountLabel.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            
            image.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -20),
            image.heightAnchor.constraint(equalToConstant: 240),
            image.widthAnchor.constraint(equalToConstant: 240),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            IamLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            IamLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            IamLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -180),
            IamLabel.heightAnchor.constraint(equalToConstant: 140),
            
          
            
            vStack.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            vStack.leadingAnchor.constraint(equalTo: IamLabel.trailingAnchor, constant: -20),
            vStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            buttonContinue.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            buttonContinue.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonContinue.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonContinue.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            buttonContinue.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
    
    @objc func btnB(){
        buttonBeginner.backgroundColor = UIColor(red: 255/255, green: 114/255, blue: 94/255, alpha: 1.0)
        buttonInter.backgroundColor = .white
        buttonAdv.backgroundColor = .white
        
        buttonBeginner.setTitleColor(.white, for: .normal)
        buttonInter.setTitleColor(.black, for: .normal)
        buttonAdv.setTitleColor(.black, for: .normal)
        
        buttonBeginner.layer.borderWidth = 0
        buttonInter.layer.borderWidth = 1
        buttonAdv.layer.borderWidth = 1
        
        level = "Beginner"
    }

    @objc func btnI(){
        buttonBeginner.backgroundColor = .white
        buttonInter.backgroundColor = UIColor(red: 255/255, green: 114/255, blue: 94/255, alpha: 1.0)
        buttonAdv.backgroundColor = .white

        buttonBeginner.setTitleColor(.black, for: .normal)
        buttonInter.setTitleColor(.white, for: .normal)
        buttonAdv.setTitleColor(.black, for: .normal)
        
        buttonBeginner.layer.borderWidth = 1
        buttonInter.layer.borderWidth = 0
        buttonAdv.layer.borderWidth = 1
        
        level = "Intermediate"
    }
    
    @objc func btnA(){
        buttonBeginner.backgroundColor = .white
        buttonInter.backgroundColor = .white
        buttonAdv.backgroundColor = UIColor(red: 255/255, green: 114/255, blue: 94/255, alpha: 1.0)

        buttonBeginner.setTitleColor(.black, for: .normal)
        buttonInter.setTitleColor(.black, for: .normal)
        buttonAdv.setTitleColor(.white, for: .normal)
        
        buttonBeginner.layer.borderWidth = 1
        buttonInter.layer.borderWidth = 1
        buttonAdv.layer.borderWidth = 0
        
        level = "Advanced"
    }
    
    
    func setDB(){
        let saveSuccessful: Bool = KeychainWrapper.standard.set(level, forKey: "level")
    }
    
    //button action
    
    @objc func getNext(){
        let vc = SetGoalScreen()
        navigationController?.pushViewController(vc, animated: true)
    }

}
