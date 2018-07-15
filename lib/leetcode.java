
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
if (mid * mid == target) return mid; //may overflow
if (mid == target / mid) return mid; //better, but need to handle mid == 0

