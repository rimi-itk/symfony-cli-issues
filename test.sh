#!/usr/bin/env bash
bold=$(tput bold)
normal=$(tput sgr0)

symfony=${SYMFONY_CLI:-symfony}

test_environment() {
    docker-compose up -d

    mkdir -p include/
    cp dump-env.php include/
    # symfony php dump-env.php
    # symfony php include/dump-env.php
    diff <($symfony php dump-env.php) <($symfony php include/dump-env.php)
    docker-compose ps
    docker-compose down
}

echo COMPOSE_PROJECT_NAME=is_this_a_bug_or_a_feature > .env
cat <<EOF
================================================================================
${bold}Comparing environments with .env file${normal}

$(cat .env)
--------------------------------------------------------------------------------
EOF
test_environment

cat <<EOF
================================================================================

EOF

echo COMPOSE_PROJECT_NAME="$(basename "$PWD")" > .env
cat <<EOF
================================================================================
${bold}Comparing environments with .env file${normal}

$(cat .env)
--------------------------------------------------------------------------------
EOF
test_environment

cat <<EOF
================================================================================

EOF

rm .env
cat <<EOF
================================================================================
${bold}Comparing environments without .env file${normal}
--------------------------------------------------------------------------------
EOF
test_environment

cat <<EOF
================================================================================

EOF
