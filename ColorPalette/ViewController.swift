//
//  ViewController.swift
//  ColorPalette
//
//  Created by Даниил Петров on 24.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var palette: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        palette.layer.cornerRadius = palette.frame.width / 20
        mixColors()
        setup(redSlider, withColor: .red)
        setup(greenSlider, withColor: .green)
        setup(blueSlider, withColor: .blue)
    }
    
    // MARK: - IB Actions
    @IBAction func modifyColor(_ sender: Any) {
        
        guard let slider = sender as? UISlider else {
            return
        }
        mixColors()
        switch slider.tag {
        case 1:
            redLabel.text = String(format: "%.2f", redSlider.value)
            setup(redSlider, withColor: .red)
        case 2:
            greenLabel.text = String(format: "%.2f", greenSlider.value)
            setup(greenSlider, withColor: .green)
        default:
            blueLabel.text = String(format: "%.2f", blueSlider.value)
            setup(blueSlider, withColor: .blue)
        }
    }
    
    private func mixColors() {
        palette.backgroundColor = UIColor.init(red: CGFloat(redSlider.value),
                                               green: CGFloat(greenSlider.value),
                                               blue: CGFloat(blueSlider.value),
                                               alpha: 1)
    }
    // MARK: - Setup UI Elements
    func setup(_ slider: UISlider, withColor color: UIColor){
        slider.thumbTintColor = .black
        slider.thumbTintColor = color.withAlphaComponent(CGFloat(slider.value))
        slider.minimumTrackTintColor = color.withAlphaComponent(CGFloat(slider.value))
        if slider.value <= 0.2 {
            slider.thumbTintColor = color.withAlphaComponent(0.15)
        }
    }
}
