using System;
using System.Text;

public class Solution {
    public string solution(string my_string, int n) 
    {
        StringBuilder sb = new StringBuilder();
        foreach(var ch in my_string)
        {
            for(int i = 0; i < n; i++)
                sb.Append(ch);   
        }
        
        return sb.ToString();
    }
}