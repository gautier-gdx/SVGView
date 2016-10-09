//
//  SVGView.swift
//  SWAPCARD
//
//  Created by Gautier Gdx on 18/07/16.
//  Copyright © 2016 Gédoux Gautier. All rights reserved.
//

import SwiftSVGiOS

public class SVGView: UIView {
    
    // MARK: - data
    
    //general appearance
    public var lineWidth: CGFloat = 1
    
    //animation duration
    public var strokeSpeed: TimeInterval = 1
    public var borderWidthSpeed: TimeInterval = 1.5
    public var fillSpeed: TimeInterval = 0.5


    //properties
    public var svgPath: String?
    fileprivate var shapeLayer: CAShapeLayer!

    
    //layout helpers
    fileprivate var rendered = false
    fileprivate var needToAnimate = false
    
    // MARK: - init
    
    override public func layoutSubviews() {
        guard !rendered else { return }
        rendered = true
        
        guard needToAnimate else { return }
        needToAnimate = false
        
        animate()
    }
    
    
    
    public func animate() {
        guard svgPath != nil else { return }
        
        if !rendered {
            needToAnimate = true
            return
        }

        guard let svgURL = Bundle.main.url(forResource: svgPath, withExtension: "svg") else { return }
        
        shapeLayer?.removeFromSuperlayer()

        shapeLayer = CAShapeLayer(SVGURL: svgURL)
        shapeLayer.bounds = bounds
        shapeLayer.position = CGPoint(x: bounds.width/2, y: bounds.height/2)
        layer.addSublayer(shapeLayer)
        shapeLayer.lineWidth = lineWidth
        
        animatePaths(shapeLayer)
    }
    
    
    fileprivate func animatePaths(_ shapeLayer: CAShapeLayer) {
        guard let sublayers = shapeLayer.sublayers as? [CAShapeLayer] else { return }

        let layerTransform = getTransform(sublayers)
        
        for sublayer in sublayers {
            let fillColor = sublayer.fillColor
            sublayer.strokeColor = sublayer.fillColor
            sublayer.fillColor = nil
            sublayer.lineWidth = 0
            sublayer.transform = layerTransform
            
            // animate the `stroke`
            let strokeAnimation = CABasicAnimation(keyPath: "strokeEnd")
            strokeAnimation.fromValue = 0
            strokeAnimation.toValue = 1
            strokeAnimation.duration = strokeSpeed
            sublayer.add(strokeAnimation, forKey: strokeAnimation.keyPath)
            
            // animate the `fill`
            let fillAnimation = CABasicAnimation(keyPath: "fillColor")
            fillAnimation.fromValue = UIColor.clear
            fillAnimation.toValue = fillColor
            fillAnimation.beginTime = CACurrentMediaTime() + fillSpeed
            fillAnimation.fillMode = kCAFillModeBoth
            fillAnimation.duration = fillSpeed // duration is 1 sec
            fillAnimation.isRemovedOnCompletion = false
            sublayer.add(fillAnimation, forKey: fillAnimation.keyPath)
            
            // animate the `lineWidth`
            let borderWidthAnimation = CABasicAnimation(keyPath: "lineWidth")
            borderWidthAnimation.fromValue = 1
            borderWidthAnimation.toValue = 0
            borderWidthAnimation.duration = borderWidthSpeed
            borderWidthAnimation.isRemovedOnCompletion = false
            sublayer.add(borderWidthAnimation, forKey: borderWidthAnimation.keyPath)
        }
    }
    
    fileprivate func getTransform(_ sublayers: [CAShapeLayer]) -> CATransform3D {
        var layerTransform: CATransform3D
        
        //get the shape layer Rect
        let subLayersBoundingBox = sublayers.map { $0.path != nil ? $0.path!.boundingBox : CGRect.zero }
        let shapeLayerRect = subLayersBoundingBox.reduce(CGRect.zero) { $0.union($1) }
        
        let shapeLayerRectAspectRatio = shapeLayerRect.width/shapeLayerRect.height
        let viewAspectRatio = bounds.width/bounds.height
        
        let scaleFactor: CGFloat
        if (shapeLayerRectAspectRatio > viewAspectRatio) {
            // Width is limiting factor
            scaleFactor = bounds.width/(shapeLayerRect.width)
            let heightDifference: CGFloat = bounds.height-shapeLayerRect.height*scaleFactor

            layerTransform = CATransform3DMakeScale(scaleFactor, scaleFactor, 1)
            layerTransform = CATransform3DTranslate(layerTransform, 0, heightDifference/(2*scaleFactor), 1)

        } else {
            // Height is limiting factor
            scaleFactor = bounds.height/(shapeLayerRect.height)
            let widthDifference: CGFloat = bounds.width-shapeLayerRect.width*scaleFactor

            layerTransform = CATransform3DMakeScale(scaleFactor, scaleFactor, 1)
            layerTransform = CATransform3DTranslate(layerTransform, widthDifference/(2*scaleFactor), 0, 1)
        }
        
        return layerTransform
    }
}


