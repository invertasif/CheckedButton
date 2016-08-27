//
//  CheckedButton.swift
//  CheckedButton
//
//  Created by Adrian Stanciu on 8/26/15.
//  Copyright © 2015 Adrian Stanciu. All rights reserved.
//

import UIKit

@IBDesignable
class CheckedButton: UIView {
    
    var animationMode = false
    var greenView: UIView!
    var whiteView: UIView!
    var image1: UIImageView!
    var image2: UIImageView!
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            whiteView.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            whiteView.layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var pressedButtonColor: UIColor? {
        didSet {
            greenView.backgroundColor = pressedButtonColor
        }
    }
    
    @IBInspectable var releasedButtonColor: UIColor? {
        didSet {
            whiteView.backgroundColor = releasedButtonColor
        }
    }
    
    @IBInspectable var checked: Bool = false {
        didSet {
            animationMode = checked
            
            if animationMode {
                self.whiteView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                self.image1.transform = CGAffineTransform(scaleX: 1, y: 1)
            } else {
                self.image2.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }
    }

    
    override init(frame: CGRect) {
        
        super.init(frame: frame)

        setup()
    }

    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup() {
     
        // add green view
        greenView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        greenView.backgroundColor = UIColor.green
        greenView.layer.cornerRadius = greenView.bounds.size.width/2
        greenView.layer.masksToBounds = true
        addSubview(greenView)
        
        // add first image
        image1 = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width/2, height: frame.size.height/2))
        image1.image = UIImage(named: "checked2")
        image1.center = CGPoint(x: greenView.bounds.midX, y: greenView.bounds.midY)
        image1.layer.cornerRadius = image1.bounds.size.width/2
        image1.layer.masksToBounds = true
        greenView.addSubview(image1)
        
        // add white image
        whiteView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        whiteView.backgroundColor = UIColor.white
        whiteView.layer.cornerRadius = whiteView.bounds.size.width/2
        whiteView.layer.masksToBounds = true
        whiteView.layer.borderColor = UIColor.lightGray.cgColor
        whiteView.layer.borderWidth = 5
        greenView.addSubview(whiteView)
        
        // add second image
        image2 = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width/2, height: frame.size.height/2))
        image2.image = UIImage(named: "checked")
        image2.center = CGPoint(x: whiteView.bounds.midX, y: whiteView.bounds.midY)
        image2.layer.cornerRadius = image2.bounds.size.width/2
        image2.layer.masksToBounds = true
        whiteView.addSubview(image2)
        
        // add button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        //button.backgroundColor = UIColor.redColor()
        button.addTarget(self, action: Selector(("animation:")), for: UIControlEvents.touchUpInside)
        addSubview(button)
        
    }
    
    func animation(button: UIButton) {
        
        if animationMode == false {
            
            UIView.animate(withDuration: 0.2, animations: {
                
                self.whiteView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                
            })
            
            self.image1.transform = CGAffineTransform(scaleX: 0, y: 0)
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: UIViewAnimationOptions.curveLinear, animations: {
                
                self.image1.transform = CGAffineTransform(scaleX: 1, y: 1)
                
                }, completion: { (finished: Bool) in
                    
            })
            
            animationMode = true
            
        } else {
            
            UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 7, options: UIViewAnimationOptions.curveLinear, animations: {
                
                self.whiteView.transform = CGAffineTransform(scaleX: 1, y: 1)
                
                }, completion: { (finished: Bool) in
                    
            })
            
            self.image2.transform = CGAffineTransform(scaleX: 0, y: 0)
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: UIViewAnimationOptions.curveLinear, animations: {
                
                self.image2.transform = CGAffineTransform(scaleX: 1, y: 1)
                
                }, completion: { (finished: Bool) in
                    
            })
            
            animationMode = false
            
        }
        
    }

}
