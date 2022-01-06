#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
#include <Array.au3> ; Required for _ArrayDisplay.

HotKeySet("{END}","quit")
local $i,$j =0
Local $pixelLogg[0][2]
$sFill = "pixel" &"|"& "#####"
_ArrayAdd($pixelLogg, $sFill)

ToolTip("BOOT",0,0)
Sleep(2000)

Func quit()
    _ArrayDisplay($pixelLogg)
    Exit
EndFunc

Func _PixelGetColorLog($pixel) ;; to extend ??
    Local $iRows = UBound($pixelLogg, $UBOUND_ROWS) ; Total number of rows. In this example it will be 10.
    Local $iCols = UBound($pixelLogg, $UBOUND_COLUMNS) ; Total number of columns. In this example it will be 20.
    Local $iDimension = UBound($pixelLogg, $UBOUND_DIMENSIONS) ; The dimension of the array e.g. 1/2/3 dimensional.
    $pixel = Hex($pixel,6)
    ToolTip($pixel,0,0)
    For $i = 0 To $iRows - 1
        For $j = 0 To $iCols - 1
            ConsoleWrite("["&$i&"],["&$j&"]"&$pixelLogg[$i][$j] &@CRLF)
            if($pixelLogg[$i][$j] == $pixel) Then
            ConsoleWrite("++" &@CRLF)
            $pixelLogg[$i][$j+1] = $pixelLogg[$i][$j+1] +1
            ExitLoop
            ExitLoop
            EndIf

            If ($i == $iRows-1 ) Then
            ConsoleWrite("_ArrayAdd" &@CRLF)
                $sFill = $pixel &"|"& 1
                _ArrayAdd($pixelLogg, $sFill)
            ExitLoop
            ExitLoop
            EndIf
        Next
    Next
EndFunc

While 1
$MousePos = MouseGetPos()
$pixelMouse = PixelGetColor($MousePos[0],$MousePos[1])
_PixelGetColorLog($pixelMouse)
Sleep(100)
WEnd