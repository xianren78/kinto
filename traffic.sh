#!/bin/bash

_APISERVER=127.0.0.1:10010
_V2CTL=/v2raybin/v2ctl

v2_query_all () {
    local ARGS=
    if [[ $1 == "reset" ]];  then
      ARGS="reset: true"
    fi
    local DATA=$($_V2CTL api --server=$_APISERVER StatsService.QueryStats "${ARGS}" | api2column)
    echo -e "\n------------Inbound----------"
    print_sum "$DATA" "inbound"
    echo "-----------------------------"
    echo -e "\n-------------User------------"
    print_sum "$DATA" "user"
    echo "-----------------------------"
}

api2column() {
    cat | awk '{
        if (match($1, /name:/)){ 
            f=1; gsub(/^"|"$/, "", $2); split($2, p,  ">>>");
            print p[1]":"p[2]"->"p[4];
        }
        else if (match($1, /value:/)){ f=0; printf "%.0f\n", $2; }
        else if (match($0, /^>$/) && f == 1) print "0"
        else {}
    }'  | sed '$!N;s/\n/ /; s/link//'
}

print_sum() {
    local DATA="$1"
    local PREFIX="$2"
    local UDATA=$(echo "$DATA" | grep "^${PREFIX}" | sort -r)
    local UPSUM=$(echo "$UDATA" | awk '/->up/{sum+=$2;}END{printf "%.0f\n", sum;}')
    local DOWNSUM=$(echo "$UDATA" | awk '/->down/{sum+=$2;}END{printf "%.0f\n", sum;}')
    UDATA="${UDATA}\nTOTAL->up ${UPSUM}\nTOTAL->down ${DOWNSUM}"
    echo -e "$UDATA" | numfmt --field=2 --suffix=B --to=iec | column -t
}

v2_query_all $1