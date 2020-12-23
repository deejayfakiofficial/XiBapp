//
//  CustomView.swift
//  XiBapp
//
//  Created by Admin on 23.12.2020.
//

import UIKit

@IBDesignable
final class CustomView: UIView {
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "CustomView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
   
    @IBAction func leftButtonTapped(_ sender: UIButton) {
        sender.shake()
    }
    
    @IBAction func rightButtonTapped(_ sender: UIButton) {
        sender.shake()
    }
    
    
    func configureView(titleLB: String, titleRB: String, backgroundColor: UIColor, cornerRadius: CGFloat, tintColor: UIColor) {
        leftButton.setTitle(titleLB, for: .normal)
        leftButton.backgroundColor = backgroundColor
        leftButton.layer.cornerRadius = cornerRadius
        leftButton.tintColor = tintColor
        rightButton.setTitle(titleRB, for: .normal)
        rightButton.backgroundColor = backgroundColor
        rightButton.layer.cornerRadius = cornerRadius
        rightButton.tintColor = tintColor
    }
}
