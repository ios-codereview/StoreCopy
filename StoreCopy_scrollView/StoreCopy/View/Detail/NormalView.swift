//
//  NormalTableViewCell.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/22.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

protocol ExpandDelegate: class {
    func expandViewTapped()
}

class NormalView: UIView {
    
    private var isActive: Bool!
    private var isExpand: Bool = false
    weak var delegate: ExpandDelegate?
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var data: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = #colorLiteral(red: 0.2588235438, green: 0.6535076654, blue: 0.7991336601, alpha: 1)
        
        return label
    }()
    
    lazy var expandViewIcon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = #imageLiteral(resourceName: "arrow")
        
        return view
    }()
    
    lazy var line: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return view
    }()

    init(frame: CGRect, titleData: String, detailData: String, isActive: Bool) {
        super.init(frame: frame)
        self.isActive = isActive
        
        backgroundColor = .white
        
        addSubview(title)
        addSubview(data)
        addSubview(line)
        
        title.text = titleData
        data.text = detailData
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(expandFeature(_:)))
        addGestureRecognizer(tap)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if isActive {
            addExpandView()
        }
    }
    
    private func configure() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            data.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            data.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            line.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            line.bottomAnchor.constraint(equalTo: bottomAnchor),
            line.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    func addExpandView() {
        addSubview(expandViewIcon)
        NSLayoutConstraint.activate([
            expandViewIcon.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            expandViewIcon.leadingAnchor.constraint(equalTo: data.trailingAnchor),
        ])
    }
    
    @objc func expandFeature(_ recognizer: UIButton) {
        isExpand = !isExpand
        UIView.animate(withDuration: 0.5) {
            print(1111)
            let angle: CGFloat = self.isExpand ? .pi : 0.0
            self.expandViewIcon.transform = CGAffineTransform(rotationAngle: angle)
            self.expandViewIcon.layoutIfNeeded()
            self.delegate?.expandViewTapped()
        }
    }

}
