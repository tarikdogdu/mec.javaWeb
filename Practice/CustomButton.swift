//
//  CustomButton.swift
//  Practice
//
//  Created by Burhan Tarık Doğdu on 12.03.2021.
//

import Foundation
import UIKit
import SwiftUI

class CustomButton: UIButton {
    
    private let cornerRadius: CGFloat = 20
    private var imageLayer: CALayer!
    private var shadowLayer: CALayer!
    
    override func draw(_ rect: CGRect) {
        addShadowsLayers(rect)
    }
    
    private func addShadowsLayers(_ rect: CGRect) {
        // Add Image
        if self.imageLayer == nil {
            let imageLayer = CALayer()
            imageLayer.frame = rect
            imageLayer.contents = UIImage(named: "Rectangle")?.cgImage
            imageLayer.cornerRadius = cornerRadius
            imageLayer.masksToBounds = true
            layer.insertSublayer(imageLayer, at: 0)
            self.imageLayer = imageLayer
        }
        
        // Set the shadow
        if self.shadowLayer == nil {
            let shadowLayer = CALayer()
            shadowLayer.masksToBounds = false
            shadowLayer.shadowColor = UIColor.systemGreen.cgColor
            shadowLayer.shadowOffset = .zero
            shadowLayer.shadowOpacity = 1
            shadowLayer.shadowRadius = 10
            shadowLayer.shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath
            layer.insertSublayer(shadowLayer, at: 0)
            self.shadowLayer = shadowLayer
        }
    }
}
