//
//  File.swift
//  IMAD_Project
//
//  Created by 유영웅 on 2023/04/11.
//

import Foundation
import SwiftUI

struct Wave:Shape{
    let reverse:Bool
    let progress:CGFloat
    let addX:CGFloat
    var applitude:CGFloat = 10  //진폭
    var waveLength:CGFloat = 30 //진동수
    var phase:CGFloat
    
    
    var animatableData: CGFloat{
        get{ phase }
        set{ phase = newValue}
    }
    func path(in rect:CGRect) -> Path{
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        let progressHeight = height * (1 - progress)
        
        
        if reverse{
            path.move(to: CGPoint(x: 0, y: progressHeight))
            
            for x in stride(from:0 , to: width + 10, by: 10){
                let y = progressHeight + sin(phase +  x*addX/waveLength) * applitude
                path.addLine(to: CGPoint(x: x, y: y))
            }
            
            path.addLine(to: CGPoint(x:width ,y: height))
            path.addLine(to: CGPoint(x: 0, y: height))
            return path
        }else{
            path.move(to: CGPoint(x: width, y: progressHeight))
            
            for x in stride(from: width, to: -10, by: -10){
                let y = progressHeight + sin(phase +  (width - x)*addX/waveLength) * applitude
                path.addLine(to: CGPoint(x: x, y: y))
            }
            
            path.addLine(to: CGPoint(x:0,y: height))
            path.addLine(to: CGPoint(x: width, y: height))
            return path
        }
    }
}
