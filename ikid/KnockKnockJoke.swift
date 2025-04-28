//
//  KnockKnockJoke.swift
//  ikid
//
//  Created by George Lee on 4/27/25.
//

import UIKit

class KnockKnockJoke: UINavigationController {
    let knockFirstVC = UIViewController()
    let knockSecondVC = UIViewController()
    let knockThirdVC = UIViewController()
    var knockCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        loadKnockKnockViews()
        setViewControllers([knockFirstVC], animated: true)
    }
    
    @objc func handleKnockResponse() {
   
        knockCount += 1
        let nextVC: UIViewController?
        switch knockCount {
        case 1:
            nextVC = knockSecondVC
        case 2:
            nextVC = knockThirdVC
        default:
            knockCount = 0
            nextVC = nil
            popToRootViewController(animated: true)
        }
        if let vc = nextVC {
                pushViewController(vc, animated: true)
            }
    }
    
    func loadKnockKnockViews() {
        title = "Knock Knock Joke"

        
        func configure(vc: UIViewController, title: String, buttonTitle: String?, labelText: String) {
            vc.view.backgroundColor = .white
            vc.title = title
            if let btnTitle = buttonTitle {
                vc.navigationItem.rightBarButtonItem = UIBarButtonItem(
                    title: btnTitle, style: .plain,
                    target: self,
                    action: #selector(handleKnockResponse)
                )
            }
            
            let container = UIView()
            container.backgroundColor = .brown
            container.translatesAutoresizingMaskIntoConstraints = false
            vc.view.addSubview(container)
            NSLayoutConstraint.activate([
                container.topAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.topAnchor),
                container.leadingAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.leadingAnchor),
                container.trailingAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.trailingAnchor),
                container.bottomAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.bottomAnchor)
            ])
            
            let label = UILabel()
            label.text = labelText
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.numberOfLines = 0
            container.addSubview(label)
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
                label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
                label.centerYAnchor.constraint(equalTo: container.centerYAnchor)
            ])
        }

        // First VC
        configure(
            vc: knockFirstVC,
            title: "Knock Knock",
            buttonTitle: "Whose There?",
            labelText: "Knock Knock"
        )
        
        // Second VC
        configure(
            vc: knockSecondVC,
            title: "",
            buttonTitle: "Who?",
            labelText: "You Who?"
        )
        
        // Third VC
        configure(
            vc: knockThirdVC,
            title: "",
            buttonTitle: "Reset Joke",
            labelText: "Yoo-hoo! stop staring blankly and let me in!"
        )
        
        
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if animated {
            UIView.transition(
                with: view,
                duration: 0.4,
                options: .transitionFlipFromRight,
                animations: {
                    super.pushViewController(viewController, animated: false)
                },
                completion: nil
            )
        } else {
            super.pushViewController(viewController, animated: false)
        }
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        if animated {
            var popped: UIViewController?
            UIView.transition(
                with: view,
                duration: 0.4,
                options: .transitionFlipFromLeft,
                animations: {
                    popped = super.popViewController(animated: false)
                },
                completion: nil
            )
            return popped
        } else {
            return super.popViewController(animated: false)
        }
    }
}
