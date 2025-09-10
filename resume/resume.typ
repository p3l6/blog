#set page(margin: .625in, paper: "us-letter")
#set text(font: "New Computer Modern", size: 11pt)

#let basicRole(title, place, dates, desc) = [
  == #title
  *\@ #place* #h(1fr) #dates \
  _#desc _
]

#let role(title, place, dates, desc, tech) = [
  #basicRole(title, place, dates, desc)

  *Tech:* #tech
]

#show heading.where(level: 1): it => [
  #set align(center)
  #box[#line(start: (0pt,-4pt))] #h(1em)
  #smallcaps(it.body)
  #h(1em) #box[#line(start: (0pt,-4pt))]
]

///////////////////////////////
/////  END OF FILE SETUP  /////
///////////////////////////////

#place(top+center, [#text(size: 28pt)[*Paul Landers*]])
\(303) 898 - 3972 #h(1fr) `https://p3l6.dev/resume` \
paul\@p3l6.dev #h(1fr) `https://github.com/p3l6` \

#block(stroke: gray, inset: 1em, radius: 4pt)[#emph[
Experienced Software Engineer developing for MacOS & iOS applications.
Expertise with debugging, problem solving, and solution design architecture.
Punctual communicator, patient, and thrives on a fully remote team.
Mentors and assists teammates in their professional growth.
Always open to new technologies: mindful of which tool is best suited for a task.
]]

= Software Skills

- *Languages:* `Swift, Objective-C, Python, Typescript, C++, C, Ruby, SQL`
- *Frameworks:* `SwiftUI, AppKit, CoreData, Cocoa, iOS, Vapor, OpenGL, GNUstep, React`
- *Tools:* `XCode, Jira, Github, Bitbucket, VSCode, Docker, Postgres, SQLite`
- *Markup:* `Typst, Markdown, LaTeX`
- *Shell:* `Bash, Zsh, Fish, Git, Make`

= Experience

#role(
  "Software Engineer III",
  "Crowdstrike",
  "Sept 2024 - Present",
  "Developed features and tests for the macOS endpoint sensor",
  "Swift, EndpointSecurity, Python, Objective-C, C++, BitBucket, Jira, Zsh"
)

- Lead implementation of projects
  - Improved installation experience for customers
  - Intelligent cloud endpoint routing for server outages
- As a project lead, gathered requirements to determine best solution that meets customers needs
- Improved reliability by fixing security issues and potential vulnerabilities
- Triaged test failures, investigating and fixing failing tests in CI nightly test jobs

#role(
  "Senior macOS Software Engineer",
  "Boombox",
  "Jan 2023 - Aug 2024",
  "Developed and maintained a cloud file synching application for macOS",
  "Swift, SwiftUI, FinderSync, AppKit, CoreData, Auth0, Github, Jira, Sentry, Mixpanel"
)

- Took over proof-of-concept project, re-writing majority of product
- Brought first version to market on initial timeline
- Expanded features while improving code quality
- Took lead for project management and release cycle, planning for upcoming initiatives, and managing project backlog
- Designed and implemented a complex file synchronization algorithm
- Worked with backend team to discuss needs of client and improve API efficiency for desktop use cases
- Wrote proposals, technical specs, and results of research
- Developed and expanded backend APIs as needed

#role(
  "Senior Software Engineer",
  "Doma (aka States Title)",
  "Sept 2019 - Dec 2022",
  "Full stack web application development for a Title & Escrow platform",
  "Typescript, React, Postgres, Python, Django, Thrift, Github, Heroku, Azure, Jira, Docker, Kubernetes, CircleCI, GraphQL"
)

- Doma Close for Realtor \(Sept 2021 - Dec 2022)
  - Guide technical direction for initial backend of an order status portal
  - Shipped a successful beta release of the order status portal on time, in 1 quarter
  - Architected solutions to work cleanly with legacy systems
  - Worked to improve developer systems and tools, unblocking common issues for teammates
- Athena TPS \(Sept 2019 - Sept 2021)
  - Lead development on a document templating service
  - Guide teammates as the team lead for a small team that grew in scope and responsibilities
  - Steer direction and evaluate technology options for greenfield projects
  - Contribute on the cross-team application architecture group, to increase tech cohesion across the organization
  - Help newer employees become familiar with codebase and tech stack
  - Created a tool to help team track work completed for an asynchronous standup

#role(
  "Software Developer & Senior Software Developer",
  "Eggplant (aka Testplant)",
  "Aug 2014 - Sept 2019",
  "Developed desktop software for a suite of functional testing products",
  "Swift, Objective-c, Cocoa, GNUstep, iOS, Python, C++, OpenCV, Docker, Gitlab, Jenkins, Jira, Git, MacOS, Linux, Windows, MinGW"
)

- Lead feature development, working independently when needed on major features
- Developed cross-platform applications using Objective-c \(Cocoa) and GNUstep
- Maintained Jenkins build server and build environments for Mac, Windows, Linux
- Identified and fixed complex bugs and issues, including inside GNUstep
// - Integrated 3rd party open source libraries into application
- Migrated linux build machines to Docker images, to increase build stability
- Migrated all svn repositories to git. Frequently the team's go-to person for help with git
- Helped identify ideas and ways to improve the applications, both user facing improvements and internal technical improvements
- Part of an agile development team using scrum practices
- Keep up to date with Apple technologies and trends

#role(
  "Software Engineer",
  "QiG Group, Greatbatch Medical",
  "Jan 2012 - Aug 2014",
  "Medical device software development, including user interface, rendering engine, algorithms, data acquisition",
  "C++, Objective-c, Java, Svn, Git, CMake, Gradle, SQLite, Redmine, OpenGL, Matlab, iOS, WinCE"
)

- Architect, design and implement software for a Clinician Programmer Application
- Maintained a Clinician Programmer device emulation environment on iOS
- Design, implement, and optimize a custom 3D rendering pipeline using OpenGL ES 2.0, Textures, shaders, vertex buffers, etc.
- Co-authored 2 Patents \(US9943691B2, US9767255B2), and 2 Patent Disclosures
// - Investigate proofs of concept for new features (software application for Clinician Programmer)
// - Interpret functional requirements to implement software application for a Clinician Programmer
- Mathematically solve and implement algorithms designed for a Clinician Programmer
- Implement laboratory data acquisition virtual instruments with LabView
- Setup and run equipment during pre-clinical animal research labs
// - Prepared releases for numbered software versions
// - Incorporating 3rd party libraries to be used in an embedded software development
- Maintained xServe, Git, Redmine, Hudson and other internal servers for development team
- Assist in drafting and disclosing intellectual property
- Scrum master for software development team in agile

#basicRole(
  "Software Development Intern",
  "QiG Group, Greatbatch Medical",
  "Summer: 2011",
  "Worked with other developers to create an OpenGL-based rendering engine"
// "C++, OpenGL, SVN, Matlab"
)

// - Worked alone and in pair programming to write software
// - Worked on the creation of an openGL-based rendering engine
// - Participated in design meetings and code reviews

#basicRole(
  "Boy Scout Canoe Trip Guide",
  "Northern Tier National High Adventure Base",
  "Summer: 2009, 2010",
  "Lead week-long canoe trips for groups of scouts.",
)

// - Was a knowledgeable resource and role model to the crew
// - Assisted with other departments and performs other duties when not on the trail

// #basicRole(
//   "Sales Associate",
//   "Sherwin Williams",
//   "Summer: 2008",
//   "Sold paint"
// )
//
// - Assisted customers in purchasing paint and products
// - Prepared customer and contractor orders
// - Kept the floor stocked

= Education

University of Colorado at Boulder  #h(1fr)   Boulder, CO \
*Applied Mathematics* #h(1fr)  Graduated Dec 2011 \
Minor: Computer Science #h(1fr) GPA: 3.459

= Other Projects

== Bag Notation

- Designed a language to represent musical notation for bagpipes
- Created a language parser and compiler in swift, to generate printable music as PDFs

== Quiz Tracker

- Developed an iOS app for the App Store, to track your score for a game of Jeopardy
- Built entire interface with SwiftUI

// == nccpipeband.org

// - Rewrote website backend using php; including user log in system, user profiles/band roster, user permissions, restricted file access, events calendar
// - As webmaster, maintain user lists and site pages
// - Re-implemented the website again, using Joomla

// == Tic Tac Cubed

// - Developed an iOS game for the App Store, based on a tic tac toe variant

= Leadership

== Eagle Scout
Boy Scouts of America

- Excellent communication and interpersonal skills
- Ability to perform independently in many situations

== Pipe Major
_Northern Colorado Caledonia Pipe Band_ and \
_Wake and District Public Safety Pipes and Drums_

- Lead regular rehearsals for groups of 10-30 musicians
- Set the music to be played in the band, and teach it to members to ensure a cohesive style
- Help others keep their bagpipes in proper working order
- Lead band in parades and competitions

== Thanksgiving meal director
First Presbyterian Church

- Organized volunteers and planned meal for 2 years
- Meal served around 350 homeless each year, with over 100 volunteers

= Misc

- Bagpipe Player
- WWDC Attendee
// - Previously Wilderness First Aid and CPR certified
- Mechanical Keyboard Enthusiast
