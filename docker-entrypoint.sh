#!/bin/sh

set -e

. ./.venv/bin/activate

exec flask --app run run --host=0.0.0.0
