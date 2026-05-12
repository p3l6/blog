---
title: OpenAPI generator
year: 2023
---
* Package plugin that runs at build time
* SPM: swift-openapi-generator, swift-openapi-runtime, swift-openapi-urlsession.
  * Other integrations exist, not just urlsession
* Needs to add a simple yaml config, like `generate: - types - client`
* Provides a type called `Client`
  * Initialize it with the server url and transport
* Sitll have a chance to handle undocumented response types, if spec is lacking.
* Easy to write mocks that need no network
  * Just adopts APIProtocol (the generated protocol of Client)
* Can also use this to write servers.
  * Implement the same protocol from mocks
  * Register the routes with `registerHandlers`
  * Can use the vapor integration package when setting up
* Good type safety on the server and client
