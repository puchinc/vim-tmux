
/*
 * Binary Search
*/

public int bsearch(int[] nums, int target) {
    if (nums.length == 0) return -1;
    int start = 0, end = nums.length - 1;
    // start = 2, end = 3, mid = always 2, 
    // target = 3, form a inf loop
    while (start + 1 < end) {
        int mid = start + (end - start) / 2;
        if (nums[mid] == target) return mid;
        else if (nums[mid] < target) start = mid;
        else end = mid;
    }
    if (nums[start] == target) return start;
    if (nums[end] == target) return end;
    return -1;
}

public int bsearch(int[] nums, int target, int start, int end) {
    int mid = start + (end - start) / 2;
    if (nums[mid] == target) return mid;
    else if (nums[mid] < target) return bsearch(nums, target, mid, end);
    else return bsearch(nums, target, start, end);
}


/* 
 *  Backtracking
 */
https://leetcode.com/problems/subsets/discuss/27281/A-general-approach-to-backtracking-questions-in-Java-(Subsets-Permutations-Combination-Sum-Palindrome-Partitioning)


/* 
 *  Bitwise
 */

https://www.allaboutcircuits.com/textbook/digital/chpt-7/converting-truth-tables-boolean-expressions/
https://leetcode.com/problems/single-number-ii/discuss/43296/An-General-Way-to-Handle-All-this-sort-of-questions.
https://www.cnblogs.com/bjwu/p/9323808.html
Single Number II
collect output is 1 and | alltogether
current   incoming  next
a b            c    a b
1 0            0    1 0
0 1            1    1 0
a = a&~b&~c | ~a&b&c

current   incoming  next
a b            c    a b
0 1            0    0 1
0 0            1    0 1
b = ~a&b&~c | ~a&~b&c

mapping
00 => 0
01 => 1
10 => 1

/* 
 *  Linked List
 */

// remove
public ListNode removeElements(ListNode head, int val) {
    ListNode sentinel = new ListNode(0);
    sentinel.next = head;

    head = sentinel;
    while (head.next != null) {
        ListNode tmp = head.next;
        if (tmp.val == val) {
            head.next = tmp.next;
            tmp = head;
        }
        head = tmp;
    }

    return sentinel.next;
}


// find middle
ListNode slow = head, fast = head.next;
while (fast != null && fast.next != null) {
    slow = slow.next;
    fast = fast.next.next;
}
ListNode middle = slow.next;
slow.next = null;

// reverse ListNode on the right side
ListNode prev = null;
while (head != null) {
    ListNode next = head.next;
    head.next = prev;
    prev = head;
    head = next;
}
return prev;

// merge two list
rHead = prev;
ListNode lHead = head;
while (lHead != null && rHead != null) {
    ListNode tmp = lHead.next;
    lHead.next = rHead;
    rHead = rHead.next;
    lHead.next.next = tmp;
    lHead = tmp;
}

/* 
 * Quick Sort
 */

public void qsort(int[] nums, int low, int high) {
    if (low >= high) return;
    /* solid solution */
    //Random rand = new Random();
    //int idx = low + rand.nextInt(high - low); 
    //int pivot = nums[idx];
    //nums[idx] = nums[high];
    //nums[high] = pivot; //pick random pivot and put to high
    /* fast solution */
    int pivot = nums[high];

    // partition
    int mid = low;
    for (int i = low; i < high; i++) {
        if (nums[i] < pivot) {
            int tmp = nums[i];
            nums[i] = nums[mid];
            nums[mid++] = tmp;
        }
    }

    nums[high] = nums[mid];
    nums[mid] = pivot;

    /* quick sort */
    qsort(nums, low, mid - 1);
    qsort(nums, mid + 1, high);

    /* quick select kth idx */
    if (k < mid) qselect(nums, low, mid - 1, k);
    else if (k > mid) return qselect(nums, mid + 1, high, k);
    else pivot;
}


/* 
 * File I/O
 */

public static void sumFile ( String name ) {
	try {
		int total = 0;
		BufferedReader in = new BufferedReader ( new FileReader ( name ));
		for ( String s = in.readLine(); s != null; s = in.readLine() ) {
			total += Integer.parseInt ( s );
		}
		System.out.println ( total );
		in.close();
	}
	catch ( Exception xc ) {
		xc.printStackTrace();
	}
}

/*
 * NSum
 */

public List<List<Integer>> kSum(int[] nums, int k, int target, int start) {
    List<List<Integer>> res = new LinkedList<>();
    int len = nums.length;
    if (start >= len) return res;
    if (k == 2) {
        int left = start, right = len - 1;
        while (left < right) {
            int sum = nums[left] + nums[right];
            if (sum < target) left++;
            else if (sum > target) right--;
            else {
                List<Integer> pair = new LinkedList<>();
                pair.add(nums[left++]);
                pair.add(nums[right--]);
                while (left < right && nums[left - 1] == nums[left]) left++;
                while (left < right && nums[right] == nums[right + 1]) right--;
                res.add(pair);
            }
        }
    }
    else {
        for (int i = start; i < len - k + 1; i++) {
            if (i > start && nums[i - 1] == nums[i]) continue;
            List<List<Integer>> prev = kSum(nums, k-1, target - nums[i], i + 1); 
            for (List<Integer> l: prev) l.add(0, nums[i]);
            res.addAll(prev);
        }
    }
    return res;
}


/*
 * Corner Cases
 */

// STRING

// string partition
"abc".substring(0, i + 1) == "ab"; // i = 1

// valid string number
String s = "0012345";
if (s.trim().length() == 0) return null; // empty string
int num = Integer.parseInt(s);
String parsed = Integer.toString(num); // "12345"

// NUMBER
// Be aware of integer overflow
Integer.MAX_VALUE == 2147483647;
Integer.MIN_VALUE == -2147483648;
if (mid * mid == target) return mid; //may overflow
if (mid == target / mid) return mid; //better, but need to handle mid == 0
