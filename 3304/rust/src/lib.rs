struct Solution {}

impl Solution {
    pub fn kth_character(k: i32) -> char {
        let idx = k - 1;
        let shift = (idx.count_ones() % 26) as u8;
        (b'a' + shift) as char
    }
}
