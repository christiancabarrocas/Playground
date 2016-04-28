//: [Previous](@previous)

//USE PROTOCOLS TO CONFIGURE THE VIEW
//USE PROTOCL EXTNESIONS TO SET UP DEFAULTS
//USE VIEWMODELS TO PROVIDE DATA TO THE PROTOCOLS

// http://artsy.github.io/blog/2015/09/24/mvvm-in-swift/

import UIKit

class Model {
    let amount = 6235
}

class View {
    let balanceLabel = UILabel(frame: CGRectMake(0,0,200,30))

    func configure(withDataSource datasource: CustomCellDataProtocol, adnDelegate delegate: CustomCellFormatProtocol) {
        balanceLabel.text = datasource.title
        balanceLabel.textColor = delegate.titleColor
        balanceLabel.font = delegate.titleFont
    }
}

class ViewController {

    //ViewController always needs to have the latest version of the viewModel
    var viewModel = ViewModel(model: Model())
    
    //Configure the view with a protocol conforming viewModel. ViewModel conforms both protocols via his extension.
    var viewClass = View()
    
    func viewDidLoad() {
        viewClass.configure(withDataSource: viewModel, adnDelegate: viewModel)
    }
}

struct ViewModel: CustomCellDataProtocol {
    var title: String = ""
    
    init(model:Model) {
        let formattedBalance = model.amount
        title = "Your balance is \(formattedBalance)"
    }
}

//Extension of viewmodel to implement formating stuff if wanted. But protocol extension implements defaults for us !
//We can make an extension of the viewModel for every control that's in the view and a protocol to conform that with defaults
extension ViewModel: CustomCellFormatProtocol {
    var titleColor: UIColor {
        return UIColor.redColor()
    }
    var titleFont: UIFont {
        return UIFont.systemFontOfSize(17)
    }
}

protocol CustomCellDataProtocol {
    var title: String {get}
}

//Protocol extension for default values
extension CustomCellDataProtocol {
    var title: String {
        return "Default text"
    }
}

protocol CustomCellFormatProtocol {
    var titleColor: UIColor {get}
    var titleFont: UIFont {get}
}

//Protocol extension for default values
extension CustomCellFormatProtocol {
    var titleColor: UIColor {
        return .blueColor()
    }
    var titleFont: UIFont {
        return UIFont.systemFontOfSize(15)
    }
}