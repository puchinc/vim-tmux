# LC 140 Word Break II (3.6: 565 > 154)
# with memoization
def wordBreak(s, wordDict):
    # write your code here
    def helper(s, wordDic, memo):
        if s in memo:
            return memo[s]
        if len(s) == 0:
            return []
        
        res = []
        for i in range(len(s)):
            prefix = s[:i+1]
            if prefix not in wordDict:
                continue
            
            partitions = helper(s[i+1:], wordDict, memo)
            for partition in partitions:
                res.append(prefix + ' ' + partition)
                
        if s in wordDict:
            res.append(s)
                
        memo[s] = res
        return res
    
    return helper(s, wordDict, {}) 
