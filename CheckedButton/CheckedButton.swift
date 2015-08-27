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
            whiteView.layer.borderColor = borderColor?.CGColor
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
        greenView = UIView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
        greenView.backgroundColor = UIColor.greenColor()
        greenView.layer.cornerRadius = greenView.bounds.size.width/2
        greenView.layer.masksToBounds = true
        addSubview(greenView)
        
        // add first image
        image1 = UIImageView(frame: CGRectMake(0, 0, frame.size.width/2, frame.size.height/2))
        image1.image = UIImage(named: "checked2")
        image1.center = CGPointMake(CGRectGetMidX(greenView.bounds), CGRectGetMidY(greenView.bounds))
        image1.layer.cornerRadius = image1.bounds.size.width/2
        image1.layer.masksToBounds = true
        greenView.addSubview(image1)
        
        // add white image
        whiteView = UIView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
        whiteView.backgroundColor = UIColor.whiteColor()
        whiteView.layer.cornerRadius = whiteView.bounds.size.width/2
        whiteView.layer.masksToBounds = true
        whiteView.layer.borderColor = UIColor.lightGrayColor().CGColor
        whiteView.layer.borderWidth = 5
        greenView.addSubview(whiteView)
        
        // add second image
        image2 = UIImageView(frame: CGRectMake(0, 0, frame.size.width/2, frame.size.height/2))
        image2.image = UIImage(named: "checked")
        image2.center = CGPointMake(CGRectGetMidX(whiteView.bounds), CGRectGetMidY(whiteView.bounds))
        image2.layer.cornerRadius = image2.bounds.size.width/2
        image2.layer.masksToBounds = true
        whiteView.addSubview(image2)
        
        // add button
        let button = UIButton(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
        //button.backgroundColor = UIColor.redColor()
        button.addTarget(self, action: Selector("animation:"), forControlEvents: UIControlEvents.TouchUpInside)
        addSubview(button)
        
        
        
    }
    
    func animation(button: UIButton) {
        
        if animationMode == false {
            
            UIView.animateWithDuration(0.2, animations: {
                
                self.whiteView.transform = CGAffineTransformMakeScale(0.01, 0.01)
                
            })
            
            self.image1.transform = CGAffineTransformMakeScale(0, 0)
            UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveLinear, animations: {
                
                self.image1.transform = CGAffineTransformMakeScale(1, 1)
                
                }, completion: { (finished: Bool) in
                    
            })
            
            animationMode = true
            
        } else {
            
            UIView.animateWithDuration(0.2, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 7, options: UIViewAnimationOptions.CurveLinear, animations: {
                
                self.whiteView.transform = CGAffineTransformMakeScale(1, 1)
                
                }, completion: { (finished: Bool) in
                    
            })
            
            self.image2.transform = CGAffineTransformMakeScale(0, 0)
            UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveLinear, animations: {
                
                self.image2.transform = CGAffineTransformMakeScale(1, 1)
                
                }, completion: { (finished: Bool) in
                    
            })
            
            animationMode = false
            
        }
        
    }

}
