' Helper function to slice an array (like Python's list slicing)
Function ArraySlice(arr, startIdx)
    Dim newArr(), i, j
    ReDim newArr(UBound(arr) - startIdx)
    j = 0
    For i = startIdx To UBound(arr)
        newArr(j) = arr(i)
        j = j + 1
    Next
    ArraySlice = newArr
End Function

If WScript.Arguments.Count >= 1 Then
    Dim objShell, arrArgs, i, RunCmd, strArgs
    Set objShell = CreateObject("Shell.Application")
    ReDim arrArgs(WScript.Arguments.Count-1)

    ' Encapsulate arguments in quotes if they contain spaces
    For i = 0 To WScript.Arguments.Count-1
        arrArgs(i) = WScript.Arguments(i)
        If InStr(arrArgs(i), " ") > 0 Or InStr(arrArgs(i), "&") > 0 Then 
            arrArgs(i) = """" & arrArgs(i) & """"
        End If
    Next

    ' Run the command with administrative privileges
    objShell.ShellExecute arrArgs(0), Join(ArraySlice(arrArgs, 1), " "), "", "runas", 1
End If
