//
//  V8AccessControl.g.swift
//  CEF.swift
//
//  This file was generated automatically from cef_types.h.
//

import Foundation

/// V8 access control values.
public struct V8AccessControl: OptionSetType {
    public let rawValue: UInt32
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let Default = V8AccessControl(rawValue: 0)
    public static let AllCanRead = V8AccessControl(rawValue: 1)
    public static let AllCanWrite = V8AccessControl(rawValue: 1 << 1)
    public static let ProhibitsOverwriting = V8AccessControl(rawValue: 1 << 2)
}

extension V8AccessControl {
    static func fromCEF(value: cef_v8_accesscontrol_t) -> V8AccessControl {
        return V8AccessControl(rawValue: UInt32(value.rawValue))
    }

    func toCEF() -> cef_v8_accesscontrol_t {
        return cef_v8_accesscontrol_t(rawValue: UInt32(rawValue))
    }
}

