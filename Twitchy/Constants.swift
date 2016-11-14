//
//  Constants.swift
//  Twitchy
//
//  Created by Max Peiros on 11/11/16.
//  Copyright © 2016 Max Peiros. All rights reserved.
//

import Foundation

// Twitch API URL's
let TWITCH_URL_TOP_GAMES = "https://api.twitch.tv/kraken/games/top?client_id=112v0xo8u72o3c8tgf4kil28tee66ss"
let TWITCH_URL_STREAMS_BASE = "https://api.twitch.tv/kraken/streams?game="
let TWITCH_URL_STREAMS_CLIENT_ID = "&client_id=112v0xo8u72o3c8tgf4kil28tee66ss"

// Download helper
typealias DownloadComplete = () -> ()
