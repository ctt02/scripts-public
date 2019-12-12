 begin
 ncol  = 2
 ntim  = numAsciiRow("regress1.txt")
 data  = asciiread("regress1.txt", (/ntim,ncol/), "float")
 data@_FillValue = -9999.0 
 x     = data(:,0)              ; model time: units are days              
 y     = data(:,1)              ; model value: units degK

 rc    = regline(x, y)          ; slope           
 rc@units = "degK/day"         
 print(rc)

 pltarry   = new ( (/2,ntim/), typeof(data), data@_FillValue)

 pltarry(0,:) = y                                 ; use markers
 pltarry(1,:) = rc*x + rc@yintercept              ; use solid line

 wks  = gsn_open_wks("png","regress")             ; send graphics to PNG file
   
   res                     = True                   ; plot mods desired
   res@xyMarkLineModes     = (/"Markers","Lines"/)  ; choose which have markers
   res@xyMarkers           = 16                     ; choose type of marker 
   res@xyMarkerColor       = "red"                  ; Marker color
   res@xyMarkerSizeF       = 0.015                  ; Marker size (default 0.01)
   res@xyDashPatterns      = 4                      ; solid line 
   res@xyLineThicknesses   = (/1,2/)                ; set second line to 2
   res@tmYLFormat          = "f"                    ; not necessary but nicer labels 

   res@tiMainString        = "NINO3.4 vs ISMR"  ; title
   res@tiXAxisString   = "NINO3.4 Index (degC)"  
   res@tiYAxisString   = "Rainfall (mm/day)"
   plot  = gsn_csm_xy (wks,x,pltarry,res)           ; create plot


end

