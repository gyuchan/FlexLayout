//
//  YogaExampleDView.swift
//  FlexLayoutSample
//
//  Created by Luc Dion on 2017-07-19.
//  Copyright (c) 2017 Mirego. All rights reserved.
//
import UIKit
import FlexLayout
import PinLayout

class YogaExampleDView: BaseView {
    fileprivate let rootFlexbox = UIView()

    override init() {
        super.init()

        let imageView = UIView()
        imageView.backgroundColor = .flexLayoutColor
        
        let label = UIView()
        label.backgroundColor = .black
        
        // Yoga's C# example
        rootFlexbox.flexbox.justifyContent(.start).alignItems(.start).define { (flexbox) in
            flexbox.addItem(imageView).alignSelf(.stretch).grow(1)
            flexbox.addItem(label).width(300).height(25).margin(20)
        }
        addSubview(rootFlexbox)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // Layout the flexbox container using PinLayout
        // NOTE: Could be also layouted by setting directly rootFlexbox.frame
        rootFlexbox.pin.topLeft().width(100%).height(300).marginTop(topLayoutGuide)

        // Then let the flexbox container layout itself
        rootFlexbox.flexbox.layout()
    }
}
