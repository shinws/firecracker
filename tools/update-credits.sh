#!/usr/bin/env bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")/.."

# see also ".mailmap" for how email addresses and names are deduplicated

{
    cat <<-'EOH'

# Firecracker Credits and Thanks

(This file is autogenerated using [update-credits.sh](tools/update-credits.sh).)

Firecracker started with the code from the Chrome OS Virtual Machine Monitor
([crosvm](https://chromium.googlesource.com/chromiumos/platform/crosvm/)), a VMM
written in Rust with a focus on safety and security. Thanks go to:

* [Zach Reizner](https://github.com/zachreizner) <zachr@chromium.org>
* [Dylan Reid](https://github.com/dgreid) <dgreid@chromium.org>
* [Daniel Verkamp](https://github.com/danielverkamp) <dverkamp@chromium.org>
* [Stephen Barber](https://github.com/smibarber) <smbarber@chromium.org>
* [Chirantan Ekbote](https://github.com/jynnantonix) <chirantan@chromium.org>
* [Jason D. Clinton](https://github.com/jclinton) <jclinton@chromium.org>
* Sonny Rao <sonnyrao@chromium.org>


Contributors to the Firecracker repository:
EOH
    echo
    git log --format='* %aN <%aE>' | LC_ALL=C.UTF-8 sort -uf
} > CREDITS.md
