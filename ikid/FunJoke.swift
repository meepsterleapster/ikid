//
//  FunJoke.swift
//  ikid
//
//  Created by George Lee on 4/27/25.
//

import UIKit


class FunJoke: UINavigationController {
    let firstVC = UIViewController()
    let secondVC = UIViewController()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadFunViews()
        self.setViewControllers([firstVC], animated: true)
        
        
       
    }
    
    @objc func handleViewChange() {
        self.pushViewController(secondVC, animated: true)
    }
    
    func loadFunViews() {
        self.title = "A Crass Joke"

        firstVC.view.backgroundColor = .white
        firstVC.title = "Funny Joke Question"
        firstVC.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "He Replies:",style: .plain, target: self, action: #selector(handleViewChange))
        
        
        let funJokeQuestion = UILabel()
        funJokeQuestion.text = "You see a man stealing a bike wheel in a Seattle street,and you hollar at him to stop! "
        funJokeQuestion.translatesAutoresizingMaskIntoConstraints = false
        funJokeQuestion.textAlignment = .center
        funJokeQuestion.numberOfLines = 0
        funJokeQuestion.lineBreakMode = .byWordWrapping
        
        
        secondVC.title = "Funny Joke Answer"
        
        let funJokeAnswer = UILabel()
        funJokeAnswer.text = "He looks at you confused, 'what you mean? this is my bike, I'm not going to let some ruffians steal it!'"
        funJokeAnswer.translatesAutoresizingMaskIntoConstraints = false
        funJokeAnswer.textAlignment = .center
        funJokeAnswer.numberOfLines = 0
        funJokeAnswer.lineBreakMode = .byWordWrapping
        
        firstVC.view.addSubview(funJokeQuestion)
        secondVC.view.addSubview(funJokeAnswer)

        NSLayoutConstraint.activate([
            funJokeQuestion.centerXAnchor.constraint(equalTo: firstVC.view.safeAreaLayoutGuide.centerXAnchor),
            funJokeQuestion.centerYAnchor.constraint(equalTo: firstVC.view.safeAreaLayoutGuide.centerYAnchor),
            funJokeQuestion.leadingAnchor.constraint(equalTo: firstVC.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            funJokeQuestion.trailingAnchor.constraint(equalTo: firstVC.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),


            funJokeAnswer.centerXAnchor.constraint(equalTo: secondVC.view.safeAreaLayoutGuide.centerXAnchor),
            funJokeAnswer.centerYAnchor.constraint(equalTo: secondVC.view.safeAreaLayoutGuide.centerYAnchor),
            funJokeAnswer.leadingAnchor.constraint(equalTo: secondVC.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            funJokeAnswer.trailingAnchor.constraint(equalTo: secondVC.view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if animated {
          UIView.transition(
            with: self.view,
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
            with: self.view,
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
