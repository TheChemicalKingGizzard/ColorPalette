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
            getStringFor(redLabel,from: redSlider)
            setup(redSlider, withColor: .red)
        case 2:
            getStringFor(greenLabel, from: greenSlider)
            setup(greenSlider, withColor: .green)
        default:
            getStringFor(blueLabel, from: blueSlider)
            setup(blueSlider, withColor: .blue)
        }
    }
    
    private func getStringFor(_ label:UILabel,from slider: UISlider) {
        label.text = String(format: "%.2f", slider.value)
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
