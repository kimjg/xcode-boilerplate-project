//
//  MainViewController.swift
//  Boilerplate
//
//  Created by Jerry Kim on 2020/02/16.
//  Copyright © 2020 Jerry Kim. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {

    // TODO: Use DI Framework
    var viewModel: MainViewModel!
    
    override func loadView() {
        setupView()
    }
    
    func setupView() {
        let view = UIView()
        self.view = view
        view.backgroundColor = .mainBackgroundColor
        
        let label = UILabel()
        label.text = .title
        label.font = .boldSystemFont(ofSize: 22.0)
        label.textColor = .mainTitleColor
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}

#if canImport(SwiftUI) && DEBUG

import SwiftUI
@available(iOS 13.0, *)
struct MainViewController_Preview: UIViewControllerRepresentable, PreviewProvider {
    typealias UIViewControllerType = MainViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MainViewController_Preview>) -> MainViewController {
        return MainViewController()
    }
    
    func updateUIViewController(_ uiViewController: MainViewController, context: UIViewControllerRepresentableContext<MainViewController_Preview>) {
    }
    
    static var previews: some View {
        MainViewController_Preview().environment(\.colorScheme, .dark)
    }
    
}

#endif
