//
//  ElementaryModel.swift
//  IdleChemistry
//
//  Created by Leng Trang on 12/30/21.
//

import Foundation

protocol ElementaryProtocol {
    var total: (upQuark: Int, downQuark: Int, electron: Int, proton: Int, neutron: Int) { set get }
    var counter: (upQuark: Int, downQuark: Int, electron: Int, proton: Int, neutron: Int) { set get }
}

protocol ElementaryProtocolDelegate: AnyObject {
    func receiveUpQuark(total: Int)
    func receiveDownQuark(total: Int)
    func receiveElectron(total: Int)
    func receiveProton(total: Int)
    func receiveNeutron(total: Int)
}

class ElementaryModel {
    
    var timers: (upQuark: Timer?, downQuark: Timer?, electron: Timer?, proton: Timer?, neutron: Timer?)
    var interval: (upQuark: Double, downQuark: Double, electron: Double, proton: Double, neutron: Double)
    var total: (upQuark: Int, downQuark: Int, electron: Int, proton: Int, neutron: Int)
    var counter: (upQuark: Int, downQuark: Int, electron: Int, proton: Int, neutron: Int)
    
    enum elementaryDefault: Double {
        case upQuark = 1
    }

    
    weak var delegate: ElementaryProtocolDelegate?
    
    init() {
        self.timers = (upQuark: nil, downQuark: nil, electron: nil, proton: nil, neutron: nil)
        self.interval = (upQuark: 5, downQuark: 7, electron: 10, proton: 30, neutron: 40)
        self.total = (upQuark: 0, downQuark: 0, electron: 0, proton: 0, neutron: 0)
        self.counter = (upQuark: 0, downQuark: 0, electron: 0, proton: 0, neutron: 0)
    }
    
    func updateUpQuarkTimer() {
        timers.upQuark?.invalidate()
        timers.upQuark = Timer.scheduledTimer(timeInterval: interval.upQuark, target: self, selector: #selector(runUpQuark), userInfo: nil, repeats: true)
        
    }
    func updateDownQuarkTimer() {
        timers.downQuark?.invalidate()
        timers.downQuark = Timer.scheduledTimer(timeInterval: interval.downQuark, target: self, selector: #selector(runDownQuark), userInfo: nil, repeats: true)
    }
    func updateElectronTimer() {
        timers.electron?.invalidate()
        timers.electron = Timer.scheduledTimer(timeInterval: interval.electron, target: self, selector: #selector(runElectron), userInfo: nil, repeats: true)
    }
    func updateProtonTimer() {
        timers.proton?.invalidate()
        timers.proton = Timer.scheduledTimer(timeInterval: interval.proton, target: self, selector: #selector(runProton), userInfo: nil, repeats: true)
    }
    func updateNeutronTimer() {
        timers.neutron?.invalidate()
        timers.neutron = Timer.scheduledTimer(timeInterval: interval.neutron, target: self, selector: #selector(runNeutron), userInfo: nil, repeats: true)
    }
    
    func addUpQuark() {
        counter.upQuark += 1
        delegate?.receiveUpQuark(total: total.upQuark)
    }
    func addDownQuark() {
        total.downQuark += 1
        delegate?.receiveDownQuark(total: total.downQuark)
    }
    func addElectron() {
        total.electron += 1
        delegate?.receiveElectron(total: total.electron)
    }
    func addProton() {
        total.proton += 1
        delegate?.receiveProton(total: total.downQuark)
    }
    func addNeutron() {
        total.neutron += 1
        delegate?.receiveNeutron(total: total.neutron)
    }
    
    @objc func runUpQuark() {
        total.upQuark += counter.upQuark
        delegate?.receiveUpQuark(total: total.upQuark)
    }
    
    @objc func runDownQuark() {
        total.downQuark += counter.downQuark
        delegate?.receiveUpQuark(total: total.downQuark)
    }

    @objc func runElectron() {
        total.electron += counter.electron
        delegate?.receiveUpQuark(total: total.electron)
    }

    @objc func runProton() {
        total.proton += counter.proton
        delegate?.receiveUpQuark(total: total.proton)
    }

    @objc func runNeutron() {
        total.neutron += counter.neutron
        delegate?.receiveUpQuark(total: total.neutron)
    }

}
// Protons: 2 Up 1 Down
// Neutrons: 1 Up 2 Down
extension ElementaryModel: ElementaryProtocol {
}
