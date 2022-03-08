'from http://superuser.com/questions/140047                                                   
If WScript.Arguments.Count >= 1 Then                                                        
    ReDim arr(WScript.Arguments.Count-1)                                                     
    For i = 0 To WScript.Arguments.Count-1                                                   
        Arg = WScript.Arguments(i)                                                           
        If InStr(Arg, " ") > 0 or InStr(Arg, "&") > 0 Then Arg = chr(34) & Arg & chr(34) 
      arr(i) = Arg                                                                           
    Next                                                                                     
    RunCmd = Join(arr)                                                                       
    CreateObject("Wscript.Shell").Run RunCmd, 0 , True                                       
End If                                                                                       
