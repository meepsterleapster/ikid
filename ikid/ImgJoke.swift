import UIKit

class ImgJoke: UINavigationController {
    let firstVC = UIViewController()
    let secondVC = UIViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        let questionText = "A man attempts to use a Discover card at the Capitol One Cafe. The cashier says \"Sorry, we only accept Capitol One.\" You respond:"
        configure(vc: firstVC, title: "Image Joke", buttonTitle: "Haven't you heard?", labelText: questionText)
        configure(vc: secondVC, title: "Image Answer", buttonTitle: nil, labelText: "")
        setViewControllers([firstVC], animated: true)
        
        let imageContainer = UIView()
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        secondVC.view.addSubview(imageContainer)
        NSLayoutConstraint.activate([
          // Keep the width at 80% of the view
          imageContainer.widthAnchor.constraint(equalTo: secondVC.view.widthAnchor, multiplier: 0.8),
          // But cap its height to the safe-area’s height
          imageContainer.heightAnchor.constraint(lessThanOrEqualTo: secondVC.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.75),
          // Center it
          imageContainer.centerXAnchor.constraint(equalTo: secondVC.view.safeAreaLayoutGuide.centerXAnchor),
          imageContainer.centerYAnchor.constraint(equalTo: secondVC.view.safeAreaLayoutGuide.centerYAnchor),
        ])
        
        
        let imageName = "twoTrenchcoat.png"
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor),
           imageView.widthAnchor.constraint(equalTo: imageContainer.widthAnchor),
            imageView.heightAnchor.constraint(lessThanOrEqualTo: imageContainer.heightAnchor)
        ])
        imageView.contentMode = .scaleAspectFit
    }


    func configure(vc: UIViewController, title: String, buttonTitle: String?, labelText: String) {
        vc.view.backgroundColor = .white
        vc.title = title
        if let btnTitle = buttonTitle {
            vc.navigationItem.rightBarButtonItem = UIBarButtonItem(
                title: btnTitle,
                style: .plain,
                target: self,
                action: #selector(handleNextPage)
            )
        }
        let container = UIView()
        container.backgroundColor = .lightGray
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

    @objc func handleNextPage() {
        pushViewController(secondVC, animated: true)
    }
}
