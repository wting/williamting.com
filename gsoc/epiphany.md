## Abstract

Users today are accessing the internet through a growing number of devices and computers on a daily basis. As the number of regularly used devices continues to increase, maintaining a consistent state amongst all those devices is an expanding issue.

The goal of this proposal is to implement an extensible synchronization API for Epiphany that is data storage agnostic. The first implementation will be synchronizing Epiphany's bookmarks and history using [Firefox Sync Service][1].

## Contact

- Name: William Ting
- E-mail: william.h.ting@gmail.com
- Blog: [http://williamting.com/][2]
- GitHub: [https://github.com/wting][3]
- IRC: wting (Gnome, Freenode)
- Online Proposal Copies:
    - [http://williamting.com/gsoc/epiphany.md][4]
    - [http://williamting.com/gsoc/epiphany.html][5]

## Project Proposal

### Components

**User Interface**

The primary interface for end users will be a new tab located in Edit > Personal Data > Sync. The user will register for a new account or log in to an existing one.

After logging in, users will have the ability to:

- choose which items to synchronize
- view synchronization status and errors
- trigger a manual update
- show sync (aka recovery) key

**Synchronization API**

The goal for the API is to make it extensible and adaptable for various storage systems.

![Architecture Overview](./overview.png)

The browser will spawn a sync client thread upon startup. The sync client will then poll the sync server every X minutes and update when necessary.

**Data Storage**

This project will focus on implementing synchronization using Firefox Sync Service for various reasons:

The APIs, data storage, architecture and design is open source. Their sync server binaries is publicly available and usable by anyone, allowing Gnome to set up its own sync.gnome.org if necessary.

**Future Features (time permitting)**

- Synchronize more user data: favicons, cookies, session state, passwords, form data
- Web interface for accessing bookmarks
- Push synchronization (high difficulty):
    - This allows a more seamless integration when using multiple clients at the same time.
    - Chromium implements this by maintaining a persistent XMPP connection with Google's chat servers.
    - Firefox Sync Servers has plans for push synchronization on roadmap.

### Status / Tracking

During the summer progress can be tracked in two places:

1. [GitHub][gh]: Development will be regularly pushed to a non-master branch to this repository.

2. [Trello][tr]: Project management tasks, as well as another providing another vector for feedback.

This is in addition to an active presence in the IRC channel and mailing list.

### Schedule

There are approximately 21 weeks for development in the GSoC schedule, from April 24 to August 13 with midterm evaluations during week 14 (July 13). I do not have any major time commitments to school, work, or any other projects. This project would be my primary focus for the full 21 weeks of the program.

Week 1:

- publish sync UI design documents, architecture overview
- install Firefox Sync Server locally for development
- study Firefox Sync API
- study glib, libsoup, GTK+ APIs

Week 2:

- publish sync tab UI mockups
- study Firefox Sync API
- study glib, libsoup, GTK+ APIs

Week 3:

- craft and test payload with server
- study Firefox Sync API
- study glib, libsoup, GTK+ APIs

Week 4:

- craft and test payload with server

Week 5:

- develop "Sync" tab interface under Personal Data

Week 6:

- create sync client
- spawn client thread
- client: display logs

Week 7:

- client: create new user, synchronization key

Week 8:

- client: display sync key
- client: authenticate existing user

Week 9:

- client: initiate manual synchronization process (not implemented at this point)
- client: read configuration settings

Week 10-12:

- client: push bookmarks

Week 13-15:

- client: pull bookmarks

Week 16-17:

- client: push/pull cookies

Week 18-19:

- test with Firefox Sync Server
- create unit tests
- write documentation

Week 20-21:

- buffer time
- write documentation
- implement more features, synchronize more personal data

## Open Source Experience

### Epiphany

My patch as part of the application process can be found [here][6].

In the meantime I have been updating various [bug reports][7] and Epiphany development documentation (e.g. Getting Involved, ArchLinux pages), and intend on continuing to contribute past Google Summer of Code.

### autojump

[autojump][8] is a Python command line utility designed to make filesystem navigation more efficient. It is a widely used program packaged in most major distribution package repositories (e.g. RedHat, Debian, ArchLinux, Gentoo).

I have been regularly contributing to the project over the past year, and recently took over the project. While core functionality is completed, a lot of my work has been spent polishing the project. This includes fixing bugs, reproducing and following up on bug reports, updating documentation, refactoring installation scripts to make it easier for package maintainers.

### ExifRenamer

[ExifRenamer][9] is another Python command line utility that organizes photos into a (customizable) folder structure based on camera timestamp metadata.

I migrated the project from SourceForge to GitHub a few years ago, but the download count currently registers about 1,000 downloads.

### User

As a user I have been using various Linux distributions for the past decade, and as my primary OS for the last 6. I have been involved in the open source community primarily as support and QA, but more recently as a developer over the past year.

## Work Experience

### IBM

I had two separate summer internships at IBM with different departments.

**Tivoli Software**

I developed a server log viewer Java utility that parsed 100+ GB worth of XML data (dependent on number of servers and configuration). In addition I developed a web interface front end as the primary UI method, allowing users to query server logs from any machine on the internal network.

**Lotus Server**

My main role was supporting clients, reproducing bugs, filing bug reports, writing technical documentation, and other QA responsibilities.

I was also responsible for creating an internal collaborative website for fostering the new hire community and collaboration.

### Ashley Laurent

I was responsible for porting and testing company firewall and VPN solutions onto Motorola enterprise routers, which involved a lot of Linux kernel configuration.

## Academic Background

I am pursuing a BS in Computer Science at the University of Texas at Austin with a single year remaining.

Two classes that I have taken--network security and distributed computing--may prove to be useful in this project. Specifically, I implemented the [Paxos protocol][10] in C++, which involved creating rudimentary server and client nodes in order to simulate message passing.

In my security coursework I have implemented AES 256 encryption/decryption. Data transmitted to Firefox's Sync Service is encrypted locally in AES. While it is unlikely that I would reimplement AES as opposed to using a standard library, I have a solid understanding of various cryptographic protocols, advantages and disadvantages to with certain hashing functions, and awareness of common attack vectors.

## Miscellaneous

I am generally interested in programming languages and photography. While I enjoy learning new languages (Ruby and Haskell being the latest obsessions), I have a solid background in C++, Python, Java, and PHP with a preference for the first two.

Photography provides a channel for me to use my coding abilities. I recently started a project to aggregate camera metadata from photos and display it in a useful fashion.

[1]: https://wiki.mozilla.org/Services/Sync
[2]: http://williamting.com/
[3]: https://github.com/wting
[4]: http://williamting.com/gsoc/epiphany.md
[5]: http://williamting.com/gsoc/epiphany.html
[6]: https://bugzilla.gnome.org/show_bug.cgi?id=534565
[7]: https://bugzilla.gnome.org/buglist.cgi?emaillongdesc1=1&emailtype1=exact&email1=bugzilla.wting%40xoxy.net
[8]: https://github.com/joelthelion/autojump
[9]: https://github.com/wting/exifrenamer
[10]: https://en.wikipedia.org/wiki/Paxos_(computer_science)
[gh]: https://github.com/wting/epiphany
[tr]: https://trello.com/board/gsoc-epiphany/4f79507b0c40f5134c45d373
