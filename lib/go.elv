#!/usr/bin/env elvish

use re
use path
use str

fn newmod [name]{
    name = (path:clean $name)
    modname = [name]{
        mod = $name
        pwd = (pwd)
        if (str:contains $pwd "/src/") {
            mod = (re:replace '.+/src/(.+)' '$1' $pwd)/$name
        }
        path:clean $mod
    }
    mod = ($modname $name)
    mkdir -p $name

    cd $name
    {
        echo module $mod
        echo "\ngo" (re:replace '^go(\d+\.\d+)\.\d+' '$1' (go env GOVERSION))
    } > go.mod
    git init
    echo '# Binaries for programs and plugins
*.exe
*.exe~
*.dll
*.so
*.dylib

# Test binary, built with `go test -c`
*.test

# Output of the go coverage tool, specifically when used with LiteIDE
*.out

# Dependency directories (remove the comment below to include it)
# vendor/

# Jetbrains IDE
.idea/' > .gitignore
}