//
//  PaymentViewController.swift
//  PaymentFeature
//
//  Created by Andy ⠀ on 07/12/23.
//  
//

import UIKit
import Common

class PaymentViewController: BaseViewController {
    
    private struct UX {
        static let containerRadius: CGFloat = 20.0
    }
    
    @IBOutlet weak var mainContainer: UIView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var bankLabel: UILabel!
    @IBOutlet weak var merchantLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    var presenter: PaymentPresentation?
    
    public init() {
        super.init(nibName: nil, bundle: Bundle(for: PaymentViewController.self))
    }

    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainContainer.layer.cornerRadius = UX.containerRadius
        idLabel.text = presenter?.id
        bankLabel.text = presenter?.bankName
        merchantLabel.text = presenter?.merchant
        amountLabel.text = presenter?.amount
    }
    
    @IBAction func paymentDidTouchUpInside(_ sender: Any) {
        presenter?.makePayment()
    }
    
    @IBAction func closeButtonDidTouchUpInside(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension PaymentViewController: PaymentView{
    func paymentDidSuccess() {
        showAlert(title: "Payment Success") { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    
    func paymentDidFail(message: String) {
        showAlert(title: "Payment Error", message: message)
    }
}
