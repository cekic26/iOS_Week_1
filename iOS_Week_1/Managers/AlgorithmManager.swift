//
//  AlgorithmManager.swift
//  iOS_Week_1
//
//  Created by Erkut Bas on 19.09.2021.
//

import Foundation

class AlgoruthmManager: AlgorithmProtocol {
    
    // MARK: - Two Sum
    /*
     Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
     You may assume that each input would have exactly one solution, and you may not use the same element twice.
     You can return the answer in any order.
     
     Input: nums = [2,7,11,15], target = 9
     Output: [0,1]
     Output: Because nums[0] + nums[1] == 9, we return [0, 1].
     */
    func twoSumTest() {
        let nums = [2,7,11,15]
        let target = 9
        let result = twoSum(nums, target)
        print("result : \(result)")
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
           for i in 0...(nums.count - 1) {
               for j in (i+1)...(nums.count-1) {
                   if target == (nums[i] + nums[j]) {
                       return [i, j]
                   }
               }
           }
           
           return [0, 0]
       }
    
    
    // MARK: - IsPalindrome
    /*
     Given a string s, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
     Input: s = "A man, a plan, a canal: Panama"
     Output: true
     Explanation: "amanaplanacanalpanama" is a palindrome.
     */
    func isPalindromTest() {
            let result = isPalindrome("A man, a plan, a canal: Panama")
            print("result : \(result)")
        }
        
        func isPalindrome(_ palindrome: String) -> Bool {
            let newPalindrom = palindrome.lowercased().replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ",", with: "").replacingOccurrences(of: ":", with: "")
            print("newPalindrom : \(newPalindrom)")
            
            let palindromCount = newPalindrom.count
            
            for i in 0..<palindromCount
            {
                let firstIndex = newPalindrom[newPalindrom.index(newPalindrom.startIndex, offsetBy: i)]
                let secondIndex = newPalindrom[newPalindrom.index(newPalindrom.startIndex, offsetBy: palindromCount-1-i)]
                if firstIndex != secondIndex{
                    return false}
            }
            return true
        }
    
//    func isPalindrome(_ s: String) -> Bool {
//
//    }
    
    // MARK: - Valid Anagram
    /*
     Given two strings s and t, return true if t is an anagram of s, and false otherwise.
     Input: s = "anagram", t = "nagaram"
     Output: true
     */
    func isAnagramTest() {
        let s = "anagram"
        let t = "nagaram"
        print("'\(s)' an nagaram of '\(t)': \(isAnagram(s, t))")
        
    }
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
            var mappingCharacterToCount = [Character: Int]()

            for (characterOne, characterTwo) in zip(s, t) {
                mappingCharacterToCount[characterOne, default: 0] += 1
                mappingCharacterToCount[characterTwo, default: 0] -= 1
            }
            for count in mappingCharacterToCount.values {
                if count != 0 { return false }
            }
            return true
        }
    
//    func isAnagram(_ s: String, _ t: String) -> Bool {
//
//    }
    
    // MARK: - Contains Duplicate
    /*
     Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
     Input: nums = [1,2,3,1]
     Output: true
     Input: nums = [1,2,3,4]
     Output: false
     */
    func duplicateTest() {
        var nums = [1,2,3,1]
                var result = containsDuplicate(nums)
                print("result \(result)")
                nums = [1,2,3,4]
                result = containsDuplicate(nums)
                print("result \(result)")
        
    }
    func containsDuplicate(_ nums: [Int]) -> Bool {
               
               var distinctSet = Set<Int>()
               for num in nums {
                   if distinctSet.contains(num) {
                       return true
                   } else {
                       distinctSet.insert(num)
                   }
               }
               return false
           }
    
//    func containsDuplicate(_ nums: [Int]) -> Bool {
//            
//    }
    
    // MARK: - Merge Sorted Array
    /*
    
     You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.
     Merge nums1 and nums2 into a single array sorted in non-decreasing order.
     The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.
     
     Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
     Output: [1,2,2,3,5,6]
     Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
     The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
     */
    func mergeArraysTest() {
                var nums1 = [1,2,3,0,0,0]
                let m = 3
                let nums2 = [2,5,6]
                let n = 3
                let result: () = merge(&nums1, m, nums2, n)
                print("Result \(result)")
        
    }
    
    private func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        if m == 0 {
                    nums1 = nums2
                    return
                }
                if n == 0 { return }
                var pointerOne = m - 1
                var pointerTwo = n - 1
                var pointer = m + n - 1
                
                while pointerOne >= 0 && pointerTwo >= 0 {
                    if nums1[pointerOne] >= nums2[pointerTwo] {
                        nums1[pointer] = nums1[pointerOne]
                        pointer -= 1
                        pointerOne -= 1
                        
                    } else {
                        nums1[pointer] = nums2[pointerTwo]
                        pointer -= 1
                        pointerTwo -= 1
                    }
                }
                while pointerTwo >= 0 {
                    nums1[pointer] = nums2[pointerTwo]
                    pointer -= 1
                    pointerTwo -= 1
                }
            }
    
            
    
    
    // MARK: - Intersection of Two Arrays
    /*
     Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.
     
     Input: nums1 = [1,2,2,1], nums2 = [2,2]
     Output: [2,2]
     */
    func arrayIntersectionTest() {
            let nums1 = [4,9,5]
            let nums2 = [9,4,9,8,4]
            let result = intersection(nums1, nums2)
            print("Result :\(result)")
        }
        
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
            var set = Set<Int>()
            var result = Set<Int>()
            
            for number in nums1 {
                set.insert(number)
            }
            
            for number in nums2 {
                if set.contains(number) {
                    result.insert(number)
                }
            }
            return Array(result)
        }
    
//    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
//
//    }
    
    // MARK: - Missing Number
    /*
     Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.

     Input: nums = [3,0,1]
     Output: 2
     Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.

     */
    func missingNumberTest() {
        let nums = [3,0,1]
               let result = missingNumber(nums)
               print("Result :\(result)")
        }
    func missingNumber(_ nums: [Int]) -> Int {
            var missingNumber = nums.count
            for (index, number) in nums.enumerated() {
                missingNumber ^= index ^ number
            }
            return missingNumber
        }
    
//    private func missingNumber(_ nums: [Int]) -> Int {
//
//    }
    
    
}
