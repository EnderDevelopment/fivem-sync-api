# FiveM Sync API

Sync your FiveM server data with external APIs effortlessly

## Features

- Automated data synchronization with external APIs
- Real-time updates for players
- Configurable sync intervals

## Requirements

- FiveM server
- ESX Framework
- MySQL database

## Installation

1. Download the script files.
2. Place them in your FiveM server's resources folder.
3. Add `start SquareSyncAPISystem` to your server.cfg file.

## Usage

1. Configure the API endpoint and sync interval in the `config.lua` file.
2. Ensure your database is set up with the provided SQL script.
3. Start your FiveM server.

## Configuration

Edit the `config.lua` file to customize the script settings:

```lua
Config = {}

-- Database configuration
Config.Database = {
    TableName = 'square_sync_data'
}

-- API configuration
Config.API = {
    BaseURL = 'https://api.example.com'
}

-- Sync settings
Config.Sync = {
    Interval = 60000 -- 1 minute in milliseconds
}
```

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=fivem-sync-api&utm_content=bottom) — describe it in one sentence and get the full source code.
