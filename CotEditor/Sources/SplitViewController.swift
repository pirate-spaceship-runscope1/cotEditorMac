/*
 
 SplitViewController.swift
 
 CotEditor
 https://coteditor.com
 
 Created by nakamuxu on 2006-03-26.
 
 ------------------------------------------------------------------------------
 
 © 2004-2007 nakamuxu
 © 2014-2017 1024jp
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 https://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 
 */

import Cocoa

final class SplitViewController: NSSplitViewController {
    
    // MARK: Public Properties
    
    private(set) weak var focusedSubviewController: EditorViewController?
    
    
    
    // MARK: -
    // MARK: Lifecycle
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
    // MARK: Split View Controller Methods
    
    /// setup view
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // workaround for OS X Yosemite (on macOS 10.12 SDK)
        if NSAppKitVersion.current < .macOS10_11 {
            self.splitView.delegate = self
        }
        
        self.splitView.isVertical = UserDefaults.standard[.splitViewVertical]
        self.invalidateOpenSplitEditorButtons()
        
        // observe focus change
        NotificationCenter.default.addObserver(self, selector: #selector(textViewDidBecomeFirstResponder), name: .TextViewDidBecomeFirstResponder, object: nil)
    }
    
    
    /// update close split view button state after remove
    override func removeSplitViewItem(_ splitViewItem: NSSplitViewItem) {
        
        super.removeSplitViewItem(splitViewItem)
        
        self.invalidateCloseSplitEditorButtons()
    }
    
    
    /// workaround for a crash on macOS Sierra (2016-09)
    override func splitView(_ splitView: NSSplitView, shouldHideDividerAt dividerIndex: Int) -> Bool {
        
        return false
    }
    
    
    /// apply current state to related menu items
    override func validateMenuItem(_ menuItem: NSMenuItem) -> Bool {
        
        guard let action = menuItem.action else { return false }
        
        switch action {
        case #selector(toggleSplitOrientation):
            let title = self.splitView.isVertical ? "Stack Editors Horizontally" : "Stack Editors Vertically"
            menuItem.title = NSLocalizedString(title, comment: "")
            return self.splitViewItems.count > 1
            
        case #selector(focusNextSplitTextView), #selector(focusPrevSplitTextView):
            return self.splitViewItems.count > 1
            
        default: break
        }
        
        return true
    }
    
    
    
    // MARK: Notifications
    
    /// editor's focus did change
    @objc private func textViewDidBecomeFirstResponder(_ notification: Notification) {
        
        guard let textView = notification.object as? EditorTextView else { return }
        
        for viewController in self.childViewControllers as! [EditorViewController] {
            if viewController.textView == textView {
                self.focusedSubviewController = viewController
                break
            }
        }
    }
    
    
    
    // MARK: Public Methods
    
    /// add subview for given viewController at desired position
    func addSubview(for editorViewController: EditorViewController, relativeTo otherEditorViewController: EditorViewController?) {
        
        let splitViewItem = NSSplitViewItem(viewController: editorViewController)
        
        splitViewItem.holdingPriority = 251
        
        if let otherEditorViewController = otherEditorViewController {
            guard let baseIndex = self.childViewControllers.index(of: otherEditorViewController) else {
                assertionFailure("The base editor view is not belong to the same window.")
                return
            }
            
            self.insertSplitViewItem(splitViewItem, at: baseIndex + 1)
            
        } else {
            self.addSplitViewItem(splitViewItem)
        }
        
        self.invalidateOpenSplitEditorButtons()
        self.invalidateCloseSplitEditorButtons()
    }
    
    
    /// find viewController for given subview
    func viewController(for subview: NSView) -> EditorViewController? {
        
        return self.childViewControllers.lazy
            .flatMap { (controller: NSViewController) in controller as? EditorViewController }
            .first { $0.splitView == subview }
    }
    
    
    
    // MARK: Action Messages
    
    /// toggle divider orientation
    @IBAction func toggleSplitOrientation(_ sender: Any?) {
        
        self.splitView.isVertical = !self.splitView.isVertical
        
        self.invalidateOpenSplitEditorButtons()
    }
    
    
    /// move focus to next text view
    @IBAction func focusNextSplitTextView(_ sender: Any?) {
        
        self.focusSplitTextView(onNext: true)
    }
    
    
    /// move focus to previous text view
    @IBAction func focusPrevSplitTextView(_ sender: Any?) {
        
        self.focusSplitTextView(onNext: false)
    }
    
    
    // MARK: Private Methods
    
    /// move focus to next/previous text view
    private func focusSplitTextView(onNext: Bool) {
        
        let count = self.splitViewItems.count
        
        guard count > 1 else { return }
        
        let focusIndex = self.childViewControllers.index(of: self.focusedSubviewController!) ?? 0
        let index: Int = {
            switch focusIndex {
            case 0 where !onNext:
                return count - 1
            case count - 1 where onNext:
                return 0
            default:
                return focusIndex + (onNext ? 1 : -1)
            }
        }()
        
        guard let nextEditorViewController = self.childViewControllers[index] as? EditorViewController else { return }
        
        self.view.window?.makeFirstResponder(nextEditorViewController.textView)
    }
    
    
    /// update "Split Editor" button state
    private func invalidateOpenSplitEditorButtons() {
        
        let isVertical = self.splitView.isVertical
        
        for viewController in self.childViewControllers as! [EditorViewController] {
            viewController.navigationBarController?.isSplitOrientationVertical = isVertical
        }
    }
    
    
    /// update "Close Split Editor" button state
    private func invalidateCloseSplitEditorButtons() {
        
        let isEnabled = self.splitViewItems.count > 1
        
        for viewController in self.childViewControllers as! [EditorViewController] {
            viewController.navigationBarController?.isCloseSplitButtonEnabled = isEnabled
        }
    }
    
}
