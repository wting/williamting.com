Author: William Ting
Date: 2012-06-18
Title: Firefox Sync Server Client Overview
Tags: gnome, gsoc, epiphany, firefox, sync
Status: draft

Since my sync implementation uses Firefox's Sync Server, one of the first steps I took was to run a copy of the server locally. Fortunately, Mozilla has great [documentation][ff-doc] so it was a straightforward process.

However, after talking with the Mozilla Sync team it appears that they will be rolling out SyncStorage v2 this summer so it's best if I started developing against the new API. The Mozilla Sync team is working on documentation at the moment, but the server repository is [available][ff-v2]. Unfortunately I'm still into build issues with the new server..

The Sync Server acts as a dumb bucket for storage requiring the sync client to do most of the work. The server does track some *public* metadata, but the client is responsible for all of the encryption and decryption. This is a necessary requirement to ensure users' privacy.

The two main services I'll be using:

1. Registration: user authentication and management
2. Storage: send and store user profiles

User management is handled through a straightforward RESTful [interface][ff-reg-api].

[ff-doc]: http://docs.services.mozilla.com/index.html
[ff-v2]: https://github.com/mozilla-services/server-syncstorage
[ff-reg-api]: http://localhost:5000/user/1.0/ancientpc
