#!/bin/bash

function get_start_time ()
{
    echo $(tail -n2 ~/.stopwatch | head -n1)
}

function get_status ()
{
    status=$(head -n1 ~/.stopwatch)
    echo $status
}

function reset_timer () {
    printf "stopped\n0\n0\n" > ~/.stopwatch
}

function timer_toggle ()
{
    status=$(get_status)
    if [[ $status == "stopped" ]]; then
        date=$(date +%s)
        printf "started\n$date\n0\n" > ~/.stopwatch

    elif [[ $status == "started" ]]; then
        start_time=$(get_start_time)
        date=$(date +%s)
        run_time=$(($date - $start_time))

        current_seconds=$(tail -n1 ~/.stopwatch)
        total_runtime=$(($run_time + $current_seconds))

        printf "paused\n$date\n$total_runtime\n" > ~/.stopwatch

    else
        current_seconds=$(tail -n1 ~/.stopwatch)
        date=$(date +%s)
        printf "started\n$date\n$current_seconds\n" > ~/.stopwatch
    fi
}

function get_human_status ()
{
    status=$(get_status)
    if [[ $status == "started" ]]; then
        start_time=$(get_start_time)
        date=$(date +%s)
        paused_time=$(tail -n1 ~/.stopwatch)
        run_time=$(($date - $start_time + $paused_time))

        human_readable=$(date -u -d @${run_time} +"%T")
        echo "$status $human_readable"
    elif [[ $status == "paused" ]]; then
        duration=$(tail -n1 ~/.stopwatch)
        human=$(date -u -d @${duration} +"%T")
        echo "$status $human"
    else
        echo $status
    fi
}

case $BLOCK_BUTTON in
    1) timer_toggle ;;
    3) reset_timer ;;
esac

get_human_status
get_human_status
