//
//  StartViewController.swift
//  SeSAC5MVVMBasic
//
//  Created by jack on 7/16/24.
//

import UIKit
import SnapKit

class StartViewController: UIViewController {
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("시작하기", for: .normal)
        button.backgroundColor = .systemPurple
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        startButton.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
    }
    
    @objc private func startButtonClicked() {
        present(BoxOfficeViewController(), animated: true)
    }
    
    private func configureView() {
        view.backgroundColor = .white
        view.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(44)
        }
    }
}
