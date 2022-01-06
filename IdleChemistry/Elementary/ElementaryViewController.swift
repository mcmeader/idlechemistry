//
//  ElementaryViewController.swift
//  IdleChemistry
//
//  Created by Leng Trang on 10/17/21.
//

import UIKit

class ElementaryViewController: UIViewController {

    @IBOutlet weak var createUpQuarkBtn: UIButton!
    @IBOutlet weak var autoUpQuarkBtn: UIButton!
    @IBOutlet weak var upQuarkProgress: UIProgressView!
    @IBOutlet weak var upQuarkFld: UILabel!
    
    var model: ElementaryModel = ElementaryModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func upQuarkTouch(_ sender: Any) {
        model.addUpQuark()
        model.updateUpQuarkTimer()
    }
    

}

extension ElementaryViewController: ElementaryProtocolDelegate {
    func receiveUpQuark(total: Int) {
        print("UpQuark: \(total)")
        self.upQuarkFld.text = "\(total)"
    }
    
    func receiveDownQuark(total: Int) {
        print("DownQuark: \(total)")
    }
    
    func receiveElectron(total: Int) {
        print("Electron: \(total)")
    }
    
    func receiveProton(total: Int) {
        print("Proton: \(total)")
    }
    
    func receiveNeutron(total: Int) {
        print("Neutron: \(total)")
    }
    
    
}


// https://www.hackingwithswift.com/example-code/system/how-to-make-an-action-repeat-using-timer
