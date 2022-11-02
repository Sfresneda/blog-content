//
//  ViewController.swift
//  lldb_test

import UIKit

class ViewController: UIViewController {
    // MARK: UI Elements

    /// Colored view which will be displayed centered in ViewController view.
    private var centeredView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: Vars
    /// Colors collection available for `centeredView`.
    private let colors: [UIColor] = [.systemBlue, .systemOrange, .systemRed]

    /// Index which indicate current position at `colors` collection.
    private var currentColorIndex: Int = .zero {
        didSet {
            print("Current Index: \(currentColorIndex)")
        }
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
}

// MARK: - Setup view
private extension ViewController {
    /// Configure actions and constraints for `ViewController` view content.
    func setupView() {
        // Setup View
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewHasBeenTapped))
        centeredView.addGestureRecognizer(tapGesture)
        centeredView.backgroundColor = colors[currentColorIndex]
        view.addSubview(centeredView)


        // Constraints
        let guide = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            centeredView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20),
            centeredView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            centeredView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: 20),
            centeredView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 20)
        ])
    }

    // MARK: Helpers
    @objc
    /// Action triggered when user taps on `centeredView`.
    func viewHasBeenTapped() {
        currentColorIndex += 1
        updateCenteredViewBackgroundColor()
    }

    /// Auxiliar method which set a new background color for `centeredView`.
    func updateCenteredViewBackgroundColor() {
        centeredView.backgroundColor = colors[currentColorIndex]
    }
}
