struct Solution {}

use std::cmp::Reverse;
use std::collections::BinaryHeap;

impl Solution {
    pub fn max_events(events: Vec<Vec<i32>>) -> i32 {
        let mut events = events.clone();
        events.sort_by_key(|e| e[0]);
        let mut min_heap: BinaryHeap<Reverse<i32>> = BinaryHeap::new();
        let mut count_event = 0;
        let mut current_day = 1;
        for e in events {
            let (start, end) = (e[0], e[1]);
            while start > current_day {
                if let Some(Reverse(v)) = min_heap.pop() {
                    if v >= current_day {
                        count_event += 1;
                        current_day += 1;
                    }
                } else {
                    break;
                }
            }
            current_day = start;
            min_heap.push(Reverse(end));
        }
        while let Some(Reverse(v)) = min_heap.pop() {
            if v >= current_day {
                count_event += 1;
                current_day += 1;
            }
        }
        count_event
    }
}
