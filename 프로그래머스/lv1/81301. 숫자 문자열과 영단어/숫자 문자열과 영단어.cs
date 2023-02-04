using System;
using System.Collections.Generic;

public class Solution {
    public int solution(string s)
    {
        var dict = new Dictionary<string, string>
        {
            {"zero", "0"},
            {"one", "1"},
            {"two", "2"},
            {"three", "3"},
            {"four", "4"},
            {"five", "5"},
            {"six", "6"},
            {"seven", "7"},
            {"eight", "8"},
            {"nine", "9"},
        };
        
        foreach(var pair in dict)
            s = s.Replace(pair.Key, pair.Value);
        
        return Convert.ToInt32(s);
    }
}