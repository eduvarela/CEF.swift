//
//  CEFContextMenuTypeFlags.g.swift
//  CEF.swift
//
//  This file was generated automatically from cef_types.h.
//

import Foundation

/// Supported context menu type flags.
public struct CEFContextMenuTypeFlags: OptionSet {
    public let rawValue: UInt32
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }


    /// No node is selected.
    public static let none = CEFContextMenuTypeFlags(rawValue: 0)

    /// The top page is selected.
    public static let page = CEFContextMenuTypeFlags(rawValue: 1 << 0)

    /// A subframe page is selected.
    public static let frame = CEFContextMenuTypeFlags(rawValue: 1 << 1)

    /// A link is selected.
    public static let link = CEFContextMenuTypeFlags(rawValue: 1 << 2)

    /// A media node is selected.
    public static let media = CEFContextMenuTypeFlags(rawValue: 1 << 3)

    /// There is a textual or mixed selection that is selected.
    public static let selection = CEFContextMenuTypeFlags(rawValue: 1 << 4)

    /// An editable element is selected.
    public static let editable = CEFContextMenuTypeFlags(rawValue: 1 << 5)
}

extension CEFContextMenuTypeFlags {
    static func fromCEF(value: cef_context_menu_type_flags_t) -> CEFContextMenuTypeFlags {
        return CEFContextMenuTypeFlags(rawValue: UInt32(value.rawValue))
    }

    func toCEF() -> cef_context_menu_type_flags_t {
        return cef_context_menu_type_flags_t(rawValue: UInt32(rawValue))
    }
}

