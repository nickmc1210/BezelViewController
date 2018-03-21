//
//  BezelViewController.swift
//  BezelViewController
//
//  Created by Nick McCardel on 3/21/18.
//  Copyright 2018 Nick McCardel

//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

//

import UIKit

let topBezelHeight: CGFloat    = 90.0
let bottomBezelHeight: CGFloat = 90.0
let homeButtonRadius: CGFloat  = 35.0

let defaultBezelColor: UIColor = .black

class BezelViewController: UIViewController {

    let topBezel                  = UIView()
    let contentContainerStackView = UIStackView()
    let bottomBezel               = UIView()
    let homeButton                = UIButton()
    
    let generator                 = UIImpactFeedbackGenerator()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var constraints = [NSLayoutConstraint]()
        
        //
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.axis = .vertical
        
        self.view.addSubview(stack)
        
        constraints.append(contentsOf: [stack.centerXAnchor.constraint(equalTo: view.centerXAnchor), stack.centerYAnchor.constraint(equalTo: view.centerYAnchor), stack.widthAnchor.constraint(equalTo: view.widthAnchor), stack.heightAnchor.constraint(equalTo: view.heightAnchor)])
        
        //
        topBezel.translatesAutoresizingMaskIntoConstraints = false
        
        constraints.append(topBezel.heightAnchor.constraint(equalToConstant: topBezelHeight))
        
        topBezel.backgroundColor = defaultBezelColor
        
        stack.addArrangedSubview(topBezel)
        
        //
        stack.addArrangedSubview(contentContainerStackView)
        
        //
        bottomBezel.translatesAutoresizingMaskIntoConstraints = false
        constraints.append(bottomBezel.heightAnchor.constraint(equalToConstant: bottomBezelHeight))
        
        bottomBezel.backgroundColor = defaultBezelColor
        
        stack.addArrangedSubview(bottomBezel)
        
        //
        self.homeButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.homeButton.backgroundColor = defaultBezelColor
        
        self.homeButton.layer.cornerRadius = homeButtonRadius
        self.homeButton.layer.masksToBounds = true
        self.homeButton.layer.borderColor = UIColor.white.cgColor
        self.homeButton.layer.borderWidth = 1.0
        
        self.homeButton.addTarget(self, action: #selector(BezelViewController.homeButtonTouchDown(sender:)), for: .touchDown)
        self.homeButton.addTarget(self, action: #selector(BezelViewController.homeButtonTapped(sender:)), for: .touchUpInside)

        bottomBezel.addSubview(self.homeButton)
        
        constraints.append(contentsOf: [self.homeButton.widthAnchor.constraint(equalToConstant: homeButtonRadius * 2.0), self.homeButton.heightAnchor.constraint(equalToConstant: homeButtonRadius * 2.0), self.homeButton.centerXAnchor.constraint(equalTo: bottomBezel.centerXAnchor), self.homeButton.centerYAnchor.constraint(equalTo: bottomBezel.centerYAnchor)])
        
        NSLayoutConstraint.activate(constraints)
    }
    
    //
    @objc func homeButtonTouchDown(sender: UIButton) {
        self.generator.impactOccurred()
    }
    
    //
    @objc func homeButtonTapped(sender: UIButton) {
        self.generator.impactOccurred()
    }
    
    //
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return true
    }
}
