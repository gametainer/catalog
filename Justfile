set shell := ["bash", "-eu", "-o", "pipefail", "-c"]

gametainer := "gametainer"

default:
    just --list

validate:
    {{gametainer}} catalog validate --templates .

games:
    {{gametainer}} games list --templates .

show game:
    {{gametainer}} catalog show {{game}} --templates .

check: validate games
