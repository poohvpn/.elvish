#!/usr/bin/env elvish

fn ls [@a]{ e:ls --color=tty $@a }
fn l [@a]{ ls --color=tty -lah $@a }
fn ll [@a]{ ls --color=tty -la $@a }

use go
