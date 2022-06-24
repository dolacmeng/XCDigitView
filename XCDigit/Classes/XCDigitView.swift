//
//  XCDigitView.swift
//  XCDigitalClock
//
//  Created by Jack on 2022/5/23.
//

import UIKit

class XCDigitView: UIView {
    
    var colorT:UIColor = .init(red: 22/255.0, green: 23/255.0, blue: 49/255.0, alpha: 1).withAlphaComponent(0.9)
    var colorF:UIColor = .init(red: 22/255.0, green: 23/255.0, blue: 49/255.0, alpha: 1).withAlphaComponent(0.06)
    var isNight:Bool = false {
        didSet {
            if isNight {
                colorT = .white.withAlphaComponent(0.6)
                colorF = .white.withAlphaComponent(0.06)
            }else {
                let bl5:UIColor = .init(red: 22/255.0, green: 23/255.0, blue: 49/255.0, alpha: 1)
                colorT = bl5.withAlphaComponent(0.9)
                colorF = bl5.withAlphaComponent(0.06)
            }
            setNeedsDisplay()
        }
    }

    var value:Int = -1
    {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        if (value < 0) {
            return
        }
        
        render1(context: context)
        render2(context: context)
        render3(context: context)
        render4(context: context)
        render5(context: context)
        render6(context: context)
        render7(context: context)

    }
    
    // 第一横
    func render1(context:CGContext) {
        if (value == 0 || value == 2 || value == 3 || value == 5 || value == 6 || value == 7 || value == 8 || value == 9) {
            context.setFillColor(colorT.cgColor)
        }else {
            context.setFillColor(colorF.cgColor)
        }
        
        context.move(to: XCPoint(x: 3.25, y: 3))
        context.addLine(to: XCPoint(x: 10.25, y: 3))
        context.addLine(to: XCPoint(x: 11.75, y: 1.5))
        context.addLine(to: XCPoint(x: 10.25, y: 0))
        context.addLine(to: XCPoint(x: 3.25, y: 0))
        context.addLine(to: XCPoint(x: 1.75, y: 1.5))
        context.closePath()
        context.fillPath()
    }
    
    // 右上角的竖
    func render2(context:CGContext) {
        if (value == 0 || value == 1 || value == 2 || value == 3 || value == 4 || value == 7 || value == 8 || value == 9) {
            context.setFillColor(colorT.cgColor)
        }else {
            context.setFillColor(colorF.cgColor)
        }
        
        context.move(to: XCPoint(x: 12, y: 1.75))
        context.addLine(to: XCPoint(x: 13.5, y: 3.25))
        context.addLine(to: XCPoint(x: 13.5, y: 10.25))
        context.addLine(to: XCPoint(x: 12, y: 11.75))
        context.addLine(to: XCPoint(x: 10.5, y: 10.25))
        context.addLine(to: XCPoint(x: 10.5, y: 3.25))
        context.closePath()
        context.fillPath()
    }
    
    // 中间那一横，跟1平行
    func render3(context:CGContext) {
        if (value == 2 || value == 3 || value == 4 || value == 5 || value == 6 || value == 8 || value == 9) {
            context.setFillColor(colorT.cgColor)
        }else {
            context.setFillColor(colorF.cgColor)
        }
        
        context.move(to: XCPoint(x: 3.25, y: 10.5))
        context.addLine(to: XCPoint(x: 10.25, y: 10.5))
        context.addLine(to: XCPoint(x: 11.75, y: 12))
        context.addLine(to: XCPoint(x: 10.25, y: 13.5))
        context.addLine(to: XCPoint(x: 3.25, y: 13.5))
        context.addLine(to: XCPoint(x: 1.75, y: 12))
        context.closePath()
        context.fillPath()
    }
    
    // 左上角的竖
    func render4(context:CGContext) {
        if (value == 0 || value == 4 || value == 5 || value == 6 || value == 8 || value == 9) {
            context.setFillColor(colorT.cgColor)
        }else {
            context.setFillColor(colorF.cgColor)
        }
        
        context.move(to: XCPoint(x: 1.5, y: 1.75))
        context.addLine(to: XCPoint(x: 3, y: 3.25))
        context.addLine(to: XCPoint(x: 3, y: 10.25))
        context.addLine(to: XCPoint(x: 1.5, y: 11.75))
        context.addLine(to: XCPoint(x: 0, y: 10.25))
        context.addLine(to: XCPoint(x: 0, y: 3.25))
        context.closePath()
        context.fillPath()
    }
    
    // 右下角的竖，跟2上下对称
    func render5(context:CGContext) {
        if (value == 0 || value == 1 || value == 3 || value == 4 || value == 5 || value == 6 || value == 7 || value == 8 || value == 9) {
            context.setFillColor(colorT.cgColor)
        }else {
            context.setFillColor(colorF.cgColor)
        }
        
        let offset = 10.5
        
        context.move(to: XCPoint(x: 12, y: 1.75+offset))
        context.addLine(to: XCPoint(x: 13.5, y: 3.25+offset))
        context.addLine(to: XCPoint(x: 13.5, y: 10.25+offset))
        context.addLine(to: XCPoint(x: 12, y: 11.75+offset))
        context.addLine(to: XCPoint(x: 10.5, y: 10.25+offset))
        context.addLine(to: XCPoint(x: 10.5, y: 3.25+offset))
        context.closePath()
        context.fillPath()
    }
    
    // 最底下的横，跟1上下对称
    func render6(context:CGContext) {
        if (value == 0 || value == 2 || value == 3 || value == 5 || value == 6 || value == 8 || value == 9) {
            context.setFillColor(colorT.cgColor)
        }else {
            context.setFillColor(colorF.cgColor)
        }
        
        let offset = 21.0

        context.move(to: XCPoint(x: 3.25, y: 3 + offset))
        context.addLine(to: XCPoint(x: 10.25, y: 3 + offset))
        context.addLine(to: XCPoint(x: 11.75, y: 1.5 + offset))
        context.addLine(to: XCPoint(x: 10.25, y: 0 + offset))
        context.addLine(to: XCPoint(x: 3.25, y: 0 + offset))
        context.addLine(to: XCPoint(x: 1.75, y: 1.5 + offset))
        context.closePath()
        context.fillPath()
    }
    
    // 左下角的竖， 跟4上下对称
    func render7(context:CGContext) {
        if (value == 0 || value == 2 || value == 6 || value == 8) {
            context.setFillColor(colorT.cgColor)
        }else {
            context.setFillColor(colorF.cgColor)
        }
        
        let offset = 10.5
        
        context.move(to: XCPoint(x: 1.5, y: 1.75+offset))
        context.addLine(to: XCPoint(x: 3, y: 3.25+offset))
        context.addLine(to: XCPoint(x: 3, y: 10.25+offset))
        context.addLine(to: XCPoint(x: 1.5, y: 11.75+offset))
        context.addLine(to: XCPoint(x: 0, y: 10.25+offset))
        context.addLine(to: XCPoint(x: 0, y: 3.25+offset))
        context.closePath()
        context.fillPath()
    }
    
    // 坐标大小转换
    func XCPoint(x:CGFloat,y:CGFloat) -> CGPoint {
        let scale:CGFloat = frame.size.width / 13.5
        return CGPoint(x: x*scale, y: y*scale)
    }

}
