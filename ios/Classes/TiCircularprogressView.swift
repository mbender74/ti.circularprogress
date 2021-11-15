//
//  TiCircularprogessViewProxy.swift
//  TiCircularprogess
//
//

import Foundation
import TitaniumKit

class TiCircularprogessView : TiUIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)

        }
        
        override public func frameSizeChanged(_ frame: CGRect, bounds: CGRect) {
            super.frameSizeChanged(frame, bounds: bounds)
        }
        
        private func setup() {
            // some defaults....?
            // test
            // self.backgroundColor = .purple
        }
        
        override public func initializeState(){
            NSLog("[INFO] in initializeState... ")
            super.initializeState()
            self.initializeTiCircularprogessView();
        }
        
        private func initializeTiCircularprogessView() {
            NSLog("[INFO] initializeTiCircularprogessView.. ")

            
        }
}
