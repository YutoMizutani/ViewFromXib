//
//  ViewController.swift
//  ViewFromXib
//
//  Created by YutoMizutani on 2017/07/21.
//  Copyright © 2017 Yuto Mizutani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // explanation Label
    var explanationLabel:UILabel?
    
    // add from .xib file (Nib)
    var xibView:XibView?
    
    // add by ViewController (Code)
    var vcView:UIView?
    var vcButton:UIButton?
    var numOfCount:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configure_View: do {
            explanationLabel = UILabel()
            explanationLabel?.textAlignment = .center
            explanationLabel?.font = UIFont.systemFont(ofSize: 20)
            explanationLabel?.text = "↑ XibView    /    VC code View ↓"
            self.view.addSubview(explanationLabel!)
        }
        
        configure_xibView: do {
            xibView = XibView()
            xibView?.backgroundColor = UIColor.red
            self.view.addSubview(xibView!)
        }
        
        configure_vcView: do {
            vcView = UIView()
            vcView?.backgroundColor = UIColor.blue
            self.view.addSubview(vcView!)
            
            configure_vcButton: do {
                vcButton = UIButton()
                vcButton?.backgroundColor = UIColor.white
                vcButton?.layer.borderWidth = 5
                vcButton?.layer.borderColor = UIColor.black.cgColor
                vcButton?.layer.cornerRadius = 10
                vcButton?.setTitle("CountUpButton", for: .normal)
                vcButton?.setTitleColor(UIColor.black, for: .normal)
                vcButton?.addTarget(self, action: #selector(pushButton), for: .touchUpInside)
                vcView?.addSubview(vcButton!)
            }
        }
        layoutViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        layoutViews()
    }
    
    func layoutViews() {
        layout_View: do {
            explanationLabel?.frame = CGRect(x:0, y:0, width:self.view.bounds.width, height:self.view.bounds.height/10)
            explanationLabel?.center = self.view.center
        }
        
        layout_XibView: do {
            xibView?.frame = CGRect(x:0, y:0, width:self.view.bounds.width, height:self.view.bounds.height/10*4)
            xibView?.layoutSubviews()
        }
        
        layout_VCView: do {
            vcView?.frame = CGRect(x:0, y:self.view.bounds.height/10*6, width:self.view.bounds.width, height:self.view.bounds.height/10*4)
            vcButton?.frame = CGRect(x:0, y:0, width:self.view.bounds.width/4, height:self.view.bounds.height/10)
            vcButton?.center = vcView?.ownCenter ?? CGPoint.zero
        }
    }
    
    @IBAction func pushButton(_ sender:UIButton) {
        numOfCount += 1
        xibView?.nibLabel?.text = "\(numOfCount)"
    }
}

extension UIView {
    // "ownCenter" returns the position of the center point of this view.
    var ownCenter:CGPoint {
        return CGPoint(x:self.bounds.width/2, y:self.bounds.height/2)
    }
}

extension UIButton {
    // change color when tapped
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.backgroundColor = UIColor.init(white: 0.3, alpha: 1.0)
    }
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.backgroundColor = UIColor.init(white: 1.0, alpha: 1.0)
    }
}
