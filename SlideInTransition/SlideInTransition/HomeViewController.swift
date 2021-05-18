

import UIKit

class HomeViewController: UIViewController {

    let transiton = SlideInTransition()
    var topView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.didTapMenuType = { menuType in
            self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }

    func transitionToNew(_ menuType: MenuType) {
        let title = String(describing: menuType).localizedCapitalized
        self.title = title

        topView?.removeFromSuperview()
        switch menuType {
        case .MyProfile:
            let view = UIView()
            
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
        case .MyOrders:
            let view = UIView()
           
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
            case .AboutUs:
                       let view = UIView()
                      
                       view.frame = self.view.bounds
                       self.view.addSubview(view)
                       self.topView = view
            case .privacyPolicy:
                       let view = UIView()
                      
                       view.frame = self.view.bounds
                       self.view.addSubview(view)
                       self.topView = view
            case .ContactUs:
                       let view = UIView()
                      
                       view.frame = self.view.bounds
                       self.view.addSubview(view)
                       self.topView = view
            case .SetPassword:
                       let view = UIView()
                      
                       view.frame = self.view.bounds
                       self.view.addSubview(view)
                       self.topView = view
            case .Login:
                       let view = UIView()
                      
                       view.frame = self.view.bounds
                       self.view.addSubview(view)
                       self.topView = view
            case .logout:
                       let view = UIView()
                       view.frame = self.view.bounds
                       self.view.addSubview(view)
                       self.topView = view
            
        default:
            break
        }
    }

}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}

