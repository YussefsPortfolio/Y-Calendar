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
        // stops activity indicator
        activityIndicator.stopAnimating()

        // creates mainvc
        let mainVC = ViewController()

        // Launch Scree + transition to Main Screen
        if let windowScene = view.window?.windowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = mainVC
            window.makeKeyAndVisible()

            // Optional: Setzen des Launch-Screens als nicht sichtbar
            self.view.window?.isHidden = true
        }
    }
}
