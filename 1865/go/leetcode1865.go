package leetcode1865

type FindSumPairs struct {
	nums1 []int
	nums2 []int
	m2    map[int]int
}

func Constructor(nums1 []int, nums2 []int) FindSumPairs {
	m2 := make(map[int]int)
	for _, n := range nums2 {
		m2[n]++
	}

	return FindSumPairs{
		nums1: nums1,
		nums2: nums2,
		m2:    m2,
	}
}

func (f *FindSumPairs) Add(index int, val int) {
	f.m2[f.nums2[index]]--
	f.nums2[index] += val
	f.m2[f.nums2[index]]++
}

func (f *FindSumPairs) Count(tot int) int {
	var count int
	for _, n := range f.nums1 {
		count += f.m2[tot-n]
	}
	return count
}
