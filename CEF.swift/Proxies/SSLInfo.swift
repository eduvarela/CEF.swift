//
//  SSLInfo.swift
//  CEF.swift
//
//  Created by Tamas Lustyik on 2015. 08. 05..
//  Copyright © 2015. Tamas Lustyik. All rights reserved.
//

import Foundation

extension cef_sslinfo_t: CEFObject {
}

/// Class representing SSL information.
public class SSLInfo: Proxy<cef_sslinfo_t> {

    /// Returns the subject of the X.509 certificate. For HTTPS server
    /// certificates this represents the web server.  The common name of the
    /// subject should match the host name of the web server.
    public var subject: SSLCertPrincipal? {
        let cefCert = cefObject.get_subject(cefObjectPtr)
        return SSLCertPrincipal.fromCEF(cefCert)
    }
    
    /// Returns the issuer of the X.509 certificate.
    public var issuer: SSLCertPrincipal? {
        let cefCert = cefObject.get_issuer(cefObjectPtr)
        return SSLCertPrincipal.fromCEF(cefCert)
    }
    
    /// Returns the DER encoded serial number for the X.509 certificate. The value
    /// possibly includes a leading 00 byte.
    public var serialNumber: BinaryValue? {
        let cefBinary = cefObject.get_serial_number(cefObjectPtr)
        return BinaryValue.fromCEF(cefBinary)
    }
    
    /// Returns the date before which the X.509 certificate is invalid.
    /// CefTime.GetTimeT() will return 0 if no date was specified.
    public var validFrom: NSDate? {
        var cefTime = cefObject.get_valid_start(cefObjectPtr)
        var time: time_t = 0;
        cef_time_to_timet(&cefTime, &time)
        return time != 0 ? CEFTimeToNSDate(cefTime) : nil
    }
    
    /// Returns the date after which the X.509 certificate is invalid.
    /// CefTime.GetTimeT() will return 0 if no date was specified.
    public var validUntil: NSDate? {
        var cefTime = cefObject.get_valid_expiry(cefObjectPtr)
        var time: time_t = 0;
        cef_time_to_timet(&cefTime, &time)
        return time != 0 ? CEFTimeToNSDate(cefTime) : nil
    }
    
    /// Returns the DER encoded data for the X.509 certificate.
    public var derEncoded: BinaryValue? {
        let cefBinary = cefObject.get_derencoded(cefObjectPtr)
        return BinaryValue.fromCEF(cefBinary)
    }
    
    /// Returns the PEM encoded data for the X.509 certificate.
    public var pemEncoded: BinaryValue? {
        let cefBinary = cefObject.get_pemencoded(cefObjectPtr)
        return BinaryValue.fromCEF(cefBinary)
    }
    
    // private
    
    override init?(ptr: ObjectPtrType) {
        super.init(ptr: ptr)
    }
    
    static func fromCEF(ptr: ObjectPtrType) -> SSLInfo? {
        return SSLInfo(ptr: ptr)
    }

}