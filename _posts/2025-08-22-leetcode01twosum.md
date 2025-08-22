---
layout: post
title:  "[AI]LeetCode - 1. Two Sum 學習紀錄"
image: ''
date: 2025-08-23 00:22
cover: ''
tags:
- leetcode
- python
- algorithm

description: 'LeetCode Two Sum 題目的學習過程，從暴力解法到優化解法的思考歷程'
categories: 'coding'
serie: 
---

## 📅 Day 1：Two Sum

**🔗 題目連結**：[LeetCode 1. Two Sum](https://leetcode.com/problems/two-sum/)

**📝 題目簡述**：  
給一個整數陣列 `nums` 和目標值 `target`，請找出兩個數字的索引，使得它們的和等於 `target`。

---

## 💭 解題思考過程

### 第一步：理解暴力解法

**導師**：先不寫程式，請用你的話描述「雙迴圈暴力解」怎麼找出兩個索引？

**我**：第一個迴圈由0到最後一個數字組成，第二個迴圈也由0到最後一個數字組成。第一個迴圈的第一個數字和第二個迴圈的第一個數字組合看看是不是答案，不是的話就再比第二個迴圈的下個數字，如此依序比到組合出現，回傳組合索引。

**導師**：你的描述接近，但需兩點修正：
- 第二個迴圈從 `i+1` 開始，避免重複與自配對
- 找到解就立刻回傳。時間複雜度 `O(n²)`，空間 `O(1)`

### 第二步：實作暴力解法

**導師**：請寫出 Python 暴力解骨架，只要兩層迴圈與判斷即可。

**我**：
```python
for i in range(len(nums))
    for j in range(i+1, len(nums))
        if nums[i]+nums[j] == target
            return [i, j]
```

**導師**：你已經抓到重點，只差幾個 Python 語法小細節：
- `for` 與 `if` 的行尾需要冒號 `:`
- 內縮要用四個空格或一個 tab

正確版本：
```python
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        for i in range(len(nums)):
            for j in range(i + 1, len(nums)):
                if nums[i] + nums[j] == target:
                    return [i, j]
```

**結果**：✅ Accepted！

---

## 🚀 升級：O(n) 解法

### 第三步：思考優化方向

**導師**：如果現在迴圈走到某個數字 `num`，要湊出 `target`，你會需要找「哪個數字」？

**我**：`target - num`

**導師**：正確！那我們就可以在迴圈時檢查：這個 `target - num` 是否已經出現在 dict 裡。

### 第四步：設計資料結構

**導師**：dict 裡應該存「什麼當 key，什麼當 value」？

**我**：索引是 key...

**導師**：接近，但要反過來。應該用「**數值當 key，索引當 value**」。原因：要 O(1) 查 complement 是否已出現。

### 第五步：確認演算法流程

**導師**：走訪到索引 i 的數字 num 時，檢查流程的正確順序是什麼？

**我**：
1. 檢查 `target - num` 的值是否位於 dict 中
2. 若是則回傳 index

**導師**：很好，第三步要補齊：
1. 檢查 `target - num` 是否在 dict 中
2. 若是，回傳 `[dict[target - num], i]`
3. 否則，把當前 `num` 存進 dict，格式是 `dict[num] = i`

### 第六步：理解為什麼要「先查後存」

**導師**：假設 `nums = [2, 7, 11, 15]`，`target = 9`

- **迴圈到 i=0，num=2**
  - 需要找的是 9-2=7
  - dict 目前是空的，找不到
  - 所以要把「這個數字 2」存起來：`dict[2] = 0`

- **迴圈到 i=1，num=7**
  - 需要找的是 9-7=2
  - dict 裡剛好有 2，索引是 0
  - 所以直接回傳 `[0,1]`

### 第七步：完成程式碼

**導師給的骨架**：
```python
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        seen = {}  # 用來記錄 num -> index
        for i, num in enumerate(nums):
            complement = ______
            if ______ in seen:
                return [seen[____], ____]
            seen[____] = ____
```

**我的答案**：
```python
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        seen = {}  # num -> index
        for i, num in enumerate(nums):
            complement = target - num
            if complement in seen:
                return [seen[complement], i]
            seen[num] = i
```

---

## 📚 學習重點總結

1. **暴力解法**：雙迴圈檢查所有 pair，時間 `O(n²)`，空間 `O(1)`
2. **優化解法**：利用 dict 儲存「數字→索引」的映射，時間 `O(n)`，空間 `O(n)`
3. **關鍵觀念**：「先查後存」的順序很重要
4. **資料結構選擇**：Hash Map 讓查找變成 `O(1)` 操作

