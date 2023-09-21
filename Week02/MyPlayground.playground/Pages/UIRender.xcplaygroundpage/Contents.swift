import UIKit

let sz = CGSize(width: 1024, height: 1024)
let renderer = UIGraphicsImageRenderer(size: sz)

let image = renderer.image { context in
    // background color
    UIColor(red: 255/255, green: 194/255, blue: 71/255, alpha: 1).setFill()
    context.fill(CGRect(x: 0, y: 0, width: 1024, height: 1024))
    
    // sun
    let rectangle = CGRect(x: 70, y: 70, width: 200, height: 200)
    UIColor(red: 255/255, green: 255/255, blue: 152/255, alpha: 1).setFill()
    UIColor.yellow.setStroke()
    context.cgContext.setLineWidth(20)
    context.cgContext.addEllipse(in: rectangle)
    context.cgContext.drawPath(using: .fillStroke)
    
    // cloud
    func drawEllipse(xPos: Int, yPos: Int){
        let rectangle = CGRect(x: xPos, y: yPos, width: 100, height: 100)
        UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.9).setFill()
        UIColor.white.setStroke()
        context.cgContext.setLineWidth(5)
        context.cgContext.addEllipse(in: rectangle)
        context.cgContext.drawPath(using: .fillStroke)
    }
    
    func cloud(xNum: Int, yNum: Int){
        drawEllipse(xPos: xNum, yPos: yNum)
        drawEllipse(xPos: xNum + 50, yPos: yNum + 30)
        drawEllipse(xPos: xNum, yPos: yNum + 60)
        drawEllipse(xPos: xNum - 70, yPos: yNum + 30)
    }
    
    func cloud2(xNum: Int, yNum: Int){
        drawEllipse(xPos: xNum, yPos: yNum)
        drawEllipse(xPos: xNum + 60, yPos: yNum + 40)
        drawEllipse(xPos: xNum, yPos: yNum + 60)
        drawEllipse(xPos: xNum - 60, yPos: yNum + 60)
        drawEllipse(xPos: xNum - 140, yPos: yNum + 60)
        drawEllipse(xPos: xNum - 80, yPos: yNum - 30)
        drawEllipse(xPos: xNum - 100, yPos: yNum)
    }
    
    cloud(xNum: 250, yNum: 140)
    cloud(xNum: 900, yNum: 300)
    cloud2(xNum: 600, yNum: 50)
    cloud2(xNum: 300, yNum: 450)
    cloud(xNum: 0, yNum: 260)

    
    // water
    UIColor(red: 154/255, green: 229/255, blue: 255/255, alpha: 1).setFill()
    context.fill(CGRect(x: 0, y: 724, width: 1024, height: 300))
    
    UIColor(red: 139/255, green: 207/255, blue: 232/255, alpha: 1).setFill()
    context.fill(CGRect(x: 0, y: 774, width: 1024, height: 250))
    
    UIColor(red: 91/255, green: 171/255, blue: 201/255, alpha: 1).setFill()
    context.fill(CGRect(x: 0, y: 824, width: 1024, height: 200))
    
    UIColor(red: 68/255, green: 130/255, blue: 152/255, alpha: 1).setFill()
    context.fill(CGRect(x: 0, y: 874, width: 1024, height: 150))
    
    // island emoji
    let font2 = UIFont.systemFont(ofSize: 700)
    
    let string2 = NSAttributedString(string: "🏖️", attributes: [.font: font2 ])
    string2.draw(at: CGPoint(x: 250, y: 200))
    
    // seal emoji
    let font = UIFont.systemFont(ofSize: 200)
    
    let string = NSAttributedString(string: "🦭", attributes: [.font: font ])
    string.draw(at: CGPoint(x: 700, y: 560))
    
    // baby seal emoji
    let font3 = UIFont.systemFont(ofSize: 100)
    let string3 = NSAttributedString(string: "🦭", attributes: [.font: font3 ])
    string3.draw(at: CGPoint(x: 600, y: 560))
    
    // beach ball
    let font4 = UIFont.systemFont(ofSize: 80)
    let string4 = NSAttributedString(string: "🍌", attributes: [.font: font4 ])
    string4.draw(at: CGPoint(x: 680, y: 670))
    
    
}

image
