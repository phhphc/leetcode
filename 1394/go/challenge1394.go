package challenge1394

func findLucky(arr []int) int {
	m := make(map[int]int)
	for _, v := range arr {
		m[v]++
	}

	res := -1

	for k, v := range m {
		if k == v {
			res = max(res, k)
		}
	}

	return res
}
