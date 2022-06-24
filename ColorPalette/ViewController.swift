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
        setupRedSlider()
        setupGreenSlider()
        setupBlueSlider()
    }
    
    override func viewWillLayoutSubviews() {
        palette.layer.cornerRadius = palette.frame.width / 20
    }
    
    // MARK: - IB Actions
    @IBAction func modifyRedColor(_ sender: UISlider) {
        redLabel.text = String(format: "%.2f", redSlider.value)
        mixColors()
        setupRedSlider()
    }

    @IBAction func midifyGreenColor(_ sender: UISlider) {
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        mixColors()
        setupGreenSlider()
        
    }
    @IBAction func modifyBlueColor(_ sender: UISlider) {
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        mixColors()
        setupBlueSlider()
    }
    
    private func mixColors() {
        palette.backgroundColor = UIColor.init(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    // MARK: Setup UI Elements
    private func setupRedSlider() {
        redSlider.thumbTintColor = .red.withAlphaComponent(CGFloat(redSlider.value))
        redSlider.minimumTrackTintColor = .red.withAlphaComponent(CGFloat(redSlider.value))
        if redSlider.value <= 0.2 {
            redSlider.thumbTintColor = .red.withAlphaComponent(0.15)
        }
    }
    
    private func setupGreenSlider() {
        greenSlider.thumbTintColor = .green.withAlphaComponent(CGFloat(greenSlider.value))
        greenSlider.minimumTrackTintColor = .green.withAlphaComponent(CGFloat(greenSlider.value))
        if greenSlider.value <= 0.2 {
            greenSlider.thumbTintColor = .green.withAlphaComponent(0.15)
        }
    }
    
    private func setupBlueSlider() {
        blueSlider.thumbTintColor = .blue.withAlphaComponent(CGFloat(blueSlider.value))
        blueSlider.minimumTrackTintColor = .blue.withAlphaComponent(CGFloat(blueSlider.value))
        if blueSlider.value <= 0.2 {
            blueSlider.thumbTintColor = .blue.withAlphaComponent(0.15)
        }
    }
}

