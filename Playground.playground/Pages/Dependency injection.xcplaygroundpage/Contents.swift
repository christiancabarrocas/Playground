import UIKit

class NetworkController {
    func fetchData () {
        
    }
}

class ViewController: UIViewController {
    var networkController:NetworkController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkController?.fetchData()
    }
}
