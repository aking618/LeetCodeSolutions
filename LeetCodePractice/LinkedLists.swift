//
//  LinkedLists.swift
//  LeetCodePractice
//
//  Created by Ayren King on 10/4/23.
//

import Foundation

class LinkedLists {
    /// Given the head of a singly linked list, reverse the list, and return the reversed list.
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head else { return nil }
        
        var previous: ListNode? = nil
        var current: ListNode? = head
        while current != nil {
            let temp = current?.next
            current?.next = previous
            previous = current
            current = temp
        }
        
        return previous
    }
    
    /// You are given the heads of two sorted linked lists list1 and list2.
    ///
    /// Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.
    ///
    /// Return the head of the merged linked list.
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let result: ListNode? = ListNode(0)
        var current: ListNode? = result
        var list1 = list1
        var list2 = list2
        
        while let val1 = list1?.val,
              let val2 = list2?.val {
            if val1 < val2 {
                current?.next = list1
                list1 = list1?.next
            }
            else {
                current?.next = list2
                list2 = list2?.next
            }
            
            current = current?.next
        }
        
        if let list1 {
            current?.next = list1
        }
        
        if let list2 {
            current?.next = list2
        }
        
        return result?.next
    }
}

extension LinkedLists {
    public class ListNode: Equatable {
        public var val: Int
        public var next: ListNode?
        
        public init() {
            val = 0; next = nil
        }
        
        public init(_ val: Int) {
            self.val = val; next = nil
        }
        
        public init(_ val: Int, _ next: ListNode?) {
            self.val = val; self.next = next
        }

        public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
            lhs.val == rhs.val && lhs.next == rhs.next
        }
    }
}
