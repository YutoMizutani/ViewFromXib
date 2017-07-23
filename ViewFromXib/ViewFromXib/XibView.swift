//
//  XibView.swift
//  LogGame
//
//  Created by YutoMizutani on 2017/07/21.
//  Copyright © 2017 水谷優斗. All rights reserved.
//

import UIKit


class XibView: UIView {
    /*--------------------------------------------------------------------
     e.g. Used from ViewController
     
        class ViewController: UIViewController {
            override func viewDidLoad() {
                super.viewDidLoad()
            self.view.addSubview(XibView(frame: CGRect(self.view.frame)))
            }
        }
     
     --------------------------------------------------------------------*/
    
    // Declaration nib view (referenced from other class)
    var nibView:UIView?
    var nibLabel:UILabel?
    
    // Outlet
    @IBOutlet private weak var xibLabel: UILabel!
    
    // Required method (in this case, nouse storyboard)
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // Initialize from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
        layoutView()
        setReferenceVariables()
    }
    
    private func configureView() {
        create_nibView: do {
            nibView = loadXib()
            if nibView != nil {
                self.addSubview(nibView!)
            }
        }
    }
    
    // Connect Class and Xib
    private func loadXib() -> UIView {
        let nib = UINib(nibName: "XibView", bundle: Bundle.init(for: XibView.self))//Bundle.init(for: MenuViewXibXIII.self))
        let view = nib.instantiate(withOwner: nil, options: nil).first as! UIView
        return view
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutView()
    }
    
    internal func layoutView() {
        nibView?.frame = self.frame
    }
    
    private func setReferenceVariables() {
        // find label from nibView
        if nibView != nil && !nibView!.subviews.isEmpty {
            let subviews = (nibView?.subviews)!
            for i in 0..<subviews.count {
                if subviews[i] is UILabel {
                    nibLabel = (subviews[i] as! UILabel)
                }
            }
        }
    }
    
    // Initialize subviews in nib
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization nib
        configureNibView()
    }
    
    // Write your own settings xib subviews when loaded
    internal func configureNibView() {
        // nibView's background color (!= XibView's view)
        self.backgroundColor = UIColor.red
        
        configure_xibLabel: do {
            // @IBOutlet subview change only in this scope
            xibLabel.text = "Hello, world!!"
            // set font size
            xibLabel.font = UIFont.systemFont(ofSize: 50)
        }
    }
}
