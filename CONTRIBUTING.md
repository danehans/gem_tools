# Contributing guidelines

## Filing issues

If you have a question about Gemini or have a problem using Gemini, before filing an issue, please read the [troubleshooting guide](docs/troubleshooting.md).

## How to become a contributor and submit your own code

### Contributor License Agreements

You must sign off on your work by adding your signature at the end of the commit message. Your signature certifies that you wrote the patch or
otherwise have the right to pass it on as an open-source patch. By signing off your work you ascertain following (from [developercertificate.org](http://developercertificate.org/)):

```
Developer Certificate of Origin
Version 1.1

Copyright (C) 2004, 2006 The Linux Foundation and its contributors.
660 York Street, Suite 102,
San Francisco, CA 94110 USA

Everyone is permitted to copy and distribute verbatim copies of this
license document, but changing it is not allowed.

Developer's Certificate of Origin 1.1

By making a contribution to this project, I certify that:

(a) The contribution was created in whole or in part by me and I
    have the right to submit it under the open source license
    indicated in the file; or

(b) The contribution is based upon previous work that, to the best
    of my knowledge, is covered under an appropriate open source
    license and I have the right under that license to submit that
    work with modifications, whether created in whole or in part
    by me, under the same open source license (unless I am
    permitted to submit under a different license), as indicated
    in the file; or

(c) The contribution was provided directly to me by some other
    person who certified (a), (b) or (c) and I have not modified
    it.

(d) I understand and agree that this project and the contribution
    are public and that a record of the contribution (including all
    personal information I submit with it, including my sign-off) is
    maintained indefinitely and may be redistributed consistent with
    this project or the open source license(s) involved.
```

Every git commit message must have the following at the end on a separate line:

    Signed-off-by: Joe Smith <joe.smith@email.com>

Your real legal name has to be used. Anonymous contributions or contributions
submitted using pseudonyms cannot be accepted.

Two examples of commit messages with the sign-off message can be found below:
```
gemini: fix bug

This fixes a random bug encountered in gemini.

Signed-off-by: Joe Smith <joe.smith@email.com>
```
```
gemini: fix bug

Signed-off-by: Joe Smith <joe.smith@email.com>
```

If you set your `user.name` and `user.email` git configuration options, you can
sign your commits automatically with `git commit -s`.

These git options can be set using the following commands:
```
git config user.name "Joe Smith"
git config user.email joe.smith@email.com
```

`git commit -s` should be used now to sign the commits automatically, instead of
`git commit`.

### Contributing A Patch

* Submit an issue describing your proposed change to the repo in question.
* The repo owner will respond to your issue promptly.
* Fork the desired repo, develop and test your code changes.
* Submit a pull request that includes your Signed-off-by name and email address.

### Protocols for Collaborative Development

Please read [this doc](docs/dev/collab.md) for information on how we're running development for the project.
Also take a look at the [development guide](docs/dev/development.md) for information on how to set up your environment, run tests, manage dependencies, etc.
