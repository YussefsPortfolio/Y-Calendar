import UIKit

class LaunchViewController: UIViewController {

    var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // UI-elements
        setupUI()

        // setting backgroundcolor to white
        view.backgroundColor = .white

        // -
        startLoadingProcess()
    }

    func setupUI() {
        // initialising all of the necesarry data
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.tintColor = .gray
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
    }

    func startLoadingProcess() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.completeLoadingProcess()
        }
    }

    
    func completeLoadingProcess() {
        activityIndicator.stopAnimating()
        let mainVC = ViewController()
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = mainVC
            window.makeKeyAndVisible()
        }
    }
}
