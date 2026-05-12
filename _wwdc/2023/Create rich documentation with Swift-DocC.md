---
title: Create rich documentation with Swift-DocC
year: 2023
---

* New preview editor in xcode
  * Realtime view of the rendered documentation
* Use two backticks to link to a project symbol
* Select build documentation to build your project, as well as all dependencies.
* Overview and topics, see Improve the discoverability of your docc content
* Newly you can document the extensions you make to external types, such as an extension to the swiftui view.
* Documentaiton catalog: add supporting files, such as images and long form markdown articles.
  * "Getting started", "main concepts", etc
  * Automatically chooses between light and dark modes of images.
  * The top level page has the same name as the project.
    * Topics and groups just use markdown headings and lists here.
  * Links to these page: `<doc:Title>`
* Markdown extensions: Directives
  * Grids: `@Row { @Column {} }`
    * `@Column(size:3)`
  * Tabs: `@TabNavigator { @Tab("Title) {} }`
  * `@Video(poster:source:alt:)`
  * `@Metadata {}`
    * Call to action
    * page kind
  * `@Links`
    * card uses `@PageImage(purpose:source:alt:)`
  * `@PageColor`
* Themes
  * Made in a `theme-settings.json` file in the documentation catalog
  * Applies to web only, not when viewed in xcode
* New quick navigator, jump to page, with shift cmd O.
