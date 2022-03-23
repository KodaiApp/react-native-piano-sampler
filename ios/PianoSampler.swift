//
//  PianoSampler.swift
//  Banju
//
//  Created by 김성환 on 2020/08/18.
//

import Foundation
import UIKit
import AudioKit

@objc(PianoSampler)
class PianoSampler: NSObject {

    let conductor = Conductor.sharedInstance

    @objc(playNote:velocity:)
    func playNote(_ midiNum: NSInteger, velocity: NSInteger) {
        DispatchQueue.main.async {
            let midiNum_ = MIDINoteNumber(midiNum)
            let velocity_ = MIDIVelocity(velocity)
            self.conductor.playNote(note: midiNum_, velocity: velocity_)
        }
    }
  
    @objc(stopNote:)
    func stopNote(_ midiNum: NSInteger) {
        let midiNum_ = MIDINoteNumber(midiNum)
        conductor.stopNote(note: midiNum_)
    }

    @objc(setVolume:)
    func setVolume(_ volume: Double) {
        conductor.setVolume(volume: volume)
    }
    
    @objc(prepare:)
    func prepare(_ soundfont: String) {
        conductor.allNotesOff()
        conductor.useSound(soundfont)
        print("prepared")
    }

    static func requiresMainQueueSetup() -> Bool {
        return true
    }
}
