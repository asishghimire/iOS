//
//  TabInstrumentation.swift
//  Core
//
//  Copyright © 2019 DuckDuckGo. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation
import os.signpost

public class TabInstrumentation {
    
    static let tabsLog = OSLog(subsystem: "com.duckduckgo.tabs", category: "Tab")
    
    private var siteLoadingSPID: Any?
    
    public init() {
    }
    
    public func willLoad(url: URL) {
        if #available(iOSApplicationExtension 12.0, *) {
            let id = OSSignpostID(log: type(of: self).tabsLog)
            siteLoadingSPID = id
            os_signpost(.begin,
                        log: type(of: self).tabsLog,
                        name: "Load Page",
                        signpostID: id,
                        "%s", url.absoluteString)
        }
    }
    
    public func didLoadURL() {
        if #available(iOSApplicationExtension 12.0, *),
            let id = siteLoadingSPID as? OSSignpostID {
            os_signpost(.end,
                        log: type(of: self).tabsLog,
                        name: "Load Page",
                        signpostID: id)
        }
    }
    
    public func willStartProvisionalNavigation() -> Any? {
        var spid: Any?
        if #available(iOSApplicationExtension 12.0, *) {
            let id = OSSignpostID(log: type(of: self).tabsLog)
            spid = id
            os_signpost(.begin,
                        log: type(of: self).tabsLog,
                        name: "Start Provisional Navigation",
                        signpostID: id)
        }
        return spid
    }
    
    public func didStartProvisionalNavigation(spid: Any?) {
        if #available(iOSApplicationExtension 12.0, *),
            let id = spid as? OSSignpostID {
            os_signpost(.end,
                        log: type(of: self).tabsLog,
                        name: "Start Provisional Navigation",
                        signpostID: id)
        }
    }
    
    public func willDecidePolicyForNavigationResponse() -> Any? {
        var spid: Any?
        if #available(iOSApplicationExtension 12.0, *) {
            let id = OSSignpostID(log: type(of: self).tabsLog)
            spid = id
            os_signpost(.begin,
                        log: type(of: self).tabsLog,
                        name: "Did Decide Policy For Navigation Response",
                        signpostID: id)
        }
        return spid
    }
    
    public func didDecidePolicyForNavigationResponse(spid: Any?) {
        if #available(iOSApplicationExtension 12.0, *),
            let id = spid as? OSSignpostID {
            os_signpost(.end,
                        log: type(of: self).tabsLog,
                        name: "Did Decide Policy For Navigation Response",
                        signpostID: id)
        }
    }
    
    public func willDecidePolicyForNavigationAction() -> Any? {
        var spid: Any?
        if #available(iOSApplicationExtension 12.0, *) {
            let id = OSSignpostID(log: type(of: self).tabsLog)
            spid = id
            os_signpost(.begin,
                        log: type(of: self).tabsLog,
                        name: "Did Decide Policy For Navigation Action",
                        signpostID: id)
        }
        return spid
    }
    
    public func didDecidePolicyForNavigationAction(spid: Any?) {
        if #available(iOSApplicationExtension 12.0, *),
            let id = spid as? OSSignpostID {
            os_signpost(.end,
                        log: type(of: self).tabsLog,
                        name: "Did Decide Policy For Navigation Action",
                        signpostID: id)
        }
    }
    
}