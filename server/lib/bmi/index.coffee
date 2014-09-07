str_eq = (x,y) ->
  return(x.toLowerCase()==y.toLowerCase())

orgeneral = (cnt, vsum, vcnt, x) ->
  return true  if vsum
  ii = 0

  while ii < x.length
    arr = x[ii][0]
    jj = x[ii][1]

    while jj <= x[ii][3]
      kk = x[ii][2]

      while kk <= x[ii][4]
        return true  if arr[jj][kk]
        kk++
      jj++
    ii++
  false
andgeneral = (cnt, vsum, vcnt, x) ->
  return false  unless vsum
  ii = 0

  while ii < x.length
    arr = x[ii][0]
    jj = x[ii][1]

    while jj <= x[ii][3]
      kk = x[ii][2]

      while kk <= x[ii][4]
        return false  unless arr[jj][kk]
        kk++
      jj++
    ii++
  true


eeisnumber = (v) ->
  if isNaN(v) or v is Number.NEGATIVE_INFINITY or v is Number.POSITIVE_INFINITY
    false
  else
    switch typeof v
      when "number"
        true
      when "object"
        v.constructor is Number
      else
        false

v2n = (v) ->
  switch typeof v
    when "number"
      v
    when "string"
      s2n v
    when "boolean"
      (if v then 1 else 0)
    when "object"
      return v  if v.constructor is Number
      return s2n(v)  if v.constructor is String
      return (if v then 1 else 0)  if v.constructor is Boolean
      Number.NaN
    else
      Number.NaN

round = (n, nd) ->
  if isFinite(n) and isFinite(nd)
    sign_n = (if (n < 0) then -1 else 1)
    abs_n = Math.abs(n)
    factor = Math.pow(10, nd)
    sign_n * Math.round(abs_n * factor) / factor
  else
    NaN

lookup3vv = (key, kvect, kfrom_start, kto_start, vvect, vfrom_, vto_) ->
  current = 0
  from_ = kfrom_start
  to_ = kto_start + 1
  loop
    current = (from_ + to_) >> 1
    break  if kvect[current] is key
    break  if from_ is to_ - 1
    if kvect[current] < key
      from_ = current
    else
      to_ = current
  while current < kto_start
    if kvect[current] is kvect[current + 1]
      current++
    else
      break
  return Number.NaN  if key < kvect[current]
  vvect[vfrom_ + current - kfrom_start]

var_ls = (x, y) ->
  xt = mytypeof(x)
  yt = mytypeof(y)
  return (xt < yt)  unless xt is yt
  switch xt
    when 1, 3
      x < y
    when 2
      str_ls x, y
    else
      false


mytypeof = (v) ->
  switch typeof v
    when "number"
      return 4  if myIsNaN(v)
      1
    when "string"
      2
    when "boolean"
      3
    when "object"
      if v.constructor is Number
        return 4  if myIsNaN(v)
        return 1
      return 2  if v.constructor is String
      return 3  if v.constructor is Boolean
      4
    else
      4
myIsNaN = (x) ->
  isNaN(x) or (typeof x is "number" and not isFinite(x))



var_gr = (x, y) ->
  xt = mytypeof(x)
  yt = mytypeof(y)
  return (xt > yt)  unless xt is yt
  switch xt
    when 1, 3
      x > y
    when 2
      str_gr x, y
    else
      true
calc = (gender, years, size, weight) ->
  eecm1 = []
  row1xB13B31 = [23.44265913309846, 38.85852592293736, 53.18504058637609, 58.34166295985324, 61.5047123725833, 60.55572820111047, 55.527433225418235, 42.01580392838332, 29.382301470853008, 21.16700424801229, 17.151454474635074, 12.150718295745463, 7.912414373465108, 4.499957132673391, "< 5th", "< 5th", "< 5th", "< 5th", "< 5th"]
  row1xC13C31 = [16.603324098022654, 25.096401066941553, 38.88142828126138, 47.229567521399304, 57.829826152072656, 59.88641544590155, 56.52845988579884, 50.61045443098328, 41.496380399169766, 29.432249492475876, 20.347234756716148, 13.005047590860613, 6.50143923129184, "< 5th", "< 5th", "< 5th", "< 5th", "< 5th", "< 5th"]
  gender[0] = gender[0].toUpperCase()
  c1B2 = gender # "Male", "Female"
  c1B3 = years # Years
  c1B4 = size # :)
  c1C4 = "centimeters" #centimeters
  c1B5 = weight
  c1C5 = "kilograms" # data.p1C5 # P1B5 ->
  row1xA13A31=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
  row1xD13D31=[16.6, 16, 15.6, 15.4, 15.3, 15.3, 15.5, 16, 16.6, 17.1, 17.8, 18.3, 18.9, 19.4, 19.9, 20.2, 20.7, 21.1, 21.4]
  row1xA13A31[0] = (1)
  row1xD13D31[0] = (16.6)
  row1xA13A31[1] = (2)
  row1xD13D31[1] = (16)
  row1xA13A31[2] = (3)
  row1xD13D31[2] = (15.6)
  row1xA13A31[3] = (4)
  row1xD13D31[3] = (15.4)
  row1xA13A31[4] = (5)
  row1xD13D31[4] = (15.3)
  row1xA13A31[5] = (6)
  row1xD13D31[5] = (15.3)
  row1xA13A31[6] = (7)
  row1xD13D31[6] = (15.5)
  row1xA13A31[7] = (8)
  row1xD13D31[7] = (16)
  row1xA13A31[8] = (9)
  row1xD13D31[8] = (16.6)
  row1xA13A31[9] = (10)
  row1xD13D31[9] = (17.1)
  row1xA13A31[10] = (11)
  row1xD13D31[10] = (17.8)
  row1xA13A31[11] = (12)
  row1xD13D31[11] = (18.3)
  row1xA13A31[12] = (13)
  row1xD13D31[12] = (18.9)
  row1xA13A31[13] = (14)
  row1xD13D31[13] = (19.4)
  row1xA13A31[14] = (15)
  row1xD13D31[14] = (19.9)
  row1xA13A31[15] = (16)
  row1xD13D31[15] = (20.2)
  row1xA13A31[16] = (17)
  row1xD13D31[16] = (20.7)
  row1xA13A31[17] = (18)
  row1xD13D31[17] = (21.1)
  row1xA13A31[18] = (19)
  row1xD13D31[18] = (21.4)
  c1D4 = ((if (str_eq((c1C4), ("centimeters"))) then (c1B4) else ((c1B4) * (2.54))))
  c1D5 = ((if (str_eq((c1C5), ("kilograms"))) then (c1B5) else ((c1B5) * (0.4536))))
  tmp7 = ((c1D5) <= (0))
  tmp8 = ((c1D5) > (110))
  sumcnt9_sum = ((false or tmp8) or tmp7)
  sumcnt9_cnt = 2
  tmp10 = ((c1D4) < (30))
  tmp11 = ((c1D4) > (240))
  sumcnt12_sum = ((false or tmp11) or tmp10)
  sumcnt12_cnt = 2
  tmp13 = ((((if (orgeneral(0, sumcnt12_sum, sumcnt12_cnt, eecm1)) then 1 else 0)) * ((if (orgeneral(0, sumcnt9_sum, sumcnt9_cnt, eecm1)) then 1 else 0))) isnt 0)
  sumcnt14_sum = (true and tmp13)
  sumcnt14_cnt = 1
  tmp15 = ((c1D4) < (30))
  tmp16 = ((c1D4) > (240))
  sumcnt17_sum = ((false or tmp16) or tmp15)
  sumcnt17_cnt = 2
  tmp18 = ((c1D5) <= (0))
  tmp19 = ((c1D5) > (110))
  sumcnt20_sum = ((false or tmp19) or tmp18)
  sumcnt20_cnt = 2
  c1B7 = ((if (andgeneral(0, sumcnt14_sum, sumcnt14_cnt, eecm1)) then ("Enter a valid height and weight") else ((if (orgeneral(0, sumcnt17_sum, sumcnt17_cnt, eecm1)) then ("Enter a valid height") else ((if (orgeneral(0, sumcnt20_sum, sumcnt20_cnt, eecm1)) then ("Enter a valid weight") else ((c1D5) / (Math.pow(((c1D4) / (100)), (2))))))))))
  tmp1 = ((c1B3) < (0.5))
  tmp2 = ((c1B3) > (20))
  sumcnt3_sum = ((false or tmp2) or tmp1)
  sumcnt3_cnt = 2
  c1B9 = ((if (orgeneral(0, sumcnt3_sum, sumcnt3_cnt, eecm1)) then ("Enter a valid age") else ((if (not (eeisnumber((c1B7)))) then (c1B7) else ((if (str_eq((c1B2), ("Female"))) then ((v2n(c1B7)) / (lookup3vv((round((c1B3), (0))), row1xA13A31, 0, 18, row1xD13D31, 0, 18))) else ((if (str_eq((c1B2), ("Male"))) then ((v2n(c1B7)) / (lookup3vv((round((c1B3), (0))), row1xA13A31, 0, 18, row1xD13D31, 0, 18))) else ("")))))))))
  row1xB13B31[0] = ((if (var_ls((c1B7), (14.7))) then ("< 5th") else ((if (var_gr((c1B7), (19.3))) then ("> 95th") else ((if (var_ls((c1B7), (16.6))) then ((((6.5745111) * (Math.pow((v2n(c1B7)), (2)))) - ((182.3837) * (v2n(c1B7)))) + (1265.7856)) else ((((-4.852769) * (Math.pow((v2n(c1B7)), (2)))) + ((190.85499) * (v2n(c1B7)))) - (1780.938))))))))
  row1xC13C31[0] = ((if (var_ls((c1B7), (14.6))) then ("< 5th") else ((if (var_gr((c1B7), (19.9))) then ("> 95th") else ((if (var_ls((c1B7), (17.2))) then ((((4.5974644) * (Math.pow((v2n(c1B7)), (2)))) - ((128.5099) * (v2n(c1B7)))) + (900.63047)) else ((((-2.01467) * (Math.pow((v2n(c1B7)), (2)))) + ((91.603202) * (v2n(c1B7)))) - (929.6572))))))))
  row1xB13B31[1] = ((if (var_ls((c1B7), (14.3))) then ("< 5th") else ((if (var_gr((c1B7), (18.7))) then ("> 95th") else ((if (var_ls((c1B7), (16))) then ((((9.6601537) * (Math.pow((v2n(c1B7)), (2)))) - ((266.0637) * (v2n(c1B7)))) + (1834.1067)) else ((((-4.102342) * (Math.pow((v2n(c1B7)), (2)))) + ((159.18945) * (v2n(c1B7)))) - (1446.988))))))))
  row1xC13C31[1] = ((if (var_ls((c1B7), (14.4))) then ("< 5th") else ((if (var_gr((c1B7), (19))) then ("> 95th") else ((if (var_ls((c1B7), (16.5))) then ((((8.0084129) * (Math.pow((v2n(c1B7)), (2)))) - ((225.8683) * (v2n(c1B7)))) + (1596.6707)) else ((((-3.840346) * (Math.pow((v2n(c1B7)), (2)))) + ((154.60113) * (v2n(c1B7)))) - (1455.577))))))))
  row1xB13B31[2] = ((if (var_ls((c1B7), (13.9))) then ("< 5th") else ((if (var_gr((c1B7), (18.3))) then ("> 95th") else ((if (var_ls((c1B7), (15.6))) then ((((10.929732) * (Math.pow((v2n(c1B7)), (2)))) - ((295.4886) * (v2n(c1B7)))) + (2000.0595)) else ((((-4.102342) * (Math.pow((v2n(c1B7)), (2)))) + ((155.90758) * (v2n(c1B7)))) - (1383.969))))))))
  row1xC13C31[2] = ((if (var_ls((c1B7), (14))) then ("< 5th") else ((if (var_gr((c1B7), (18.4))) then ("> 95th") else ((if (var_ls((c1B7), (16))) then ((((10.144836) * (Math.pow((v2n(c1B7)), (2)))) - ((281.8513) * (v2n(c1B7)))) + (1962.5378)) else ((((-4.862358) * (Math.pow((v2n(c1B7)), (2)))) + ((186.22083) * (v2n(c1B7)))) - (1684.927))))))))
  row1xB13B31[3] = ((if (var_ls((c1B7), (13.6))) then ("< 5th") else ((if (var_gr((c1B7), (18.2))) then ("> 95th") else ((if (var_ls((c1B7), (15.4))) then ((((10.400031) * (Math.pow((v2n(c1B7)), (2)))) - ((276.3876) * (v2n(c1B7)))) + (1840.0429)) else ((((-4.02173) * (Math.pow((v2n(c1B7)), (2)))) + ((151.26489) * (v2n(c1B7)))) - (1325.746))))))))
  row1xC13C31[3] = ((if (var_ls((c1B7), (13.8))) then ("< 5th") else ((if (var_gr((c1B7), (18.1))) then ("> 95th") else ((if (var_ls((c1B7), (15.8))) then ((((8.4018375) * (Math.pow((v2n(c1B7)), (2)))) - ((225.8422) * (v2n(c1B7)))) + (1521.1476)) else ((((-7.345051) * (Math.pow((v2n(c1B7)), (2)))) + ((268.36966) * (v2n(c1B7)))) - (2356.446))))))))
  row1xB13B31[4] = ((if (var_ls((c1B7), (13.5))) then ("< 5th") else ((if (var_gr((c1B7), (18.3))) then ("> 95th") else ((if (var_ls((c1B7), (15.3))) then ((((10.400031) * (Math.pow((v2n(c1B7)), (2)))) - ((274.3076) * (v2n(c1B7)))) + (1812.5082)) else ((((-4.588485) * (Math.pow((v2n(c1B7)), (2)))) + ((168.95286) * (v2n(c1B7)))) - (1460.582))))))))
  row1xC13C31[4] = ((if (var_ls((c1B7), (13.7))) then ("< 5th") else ((if (var_gr((c1B7), (18))) then ("> 95th") else ((if (var_ls((c1B7), (15.5))) then ((((12.899116) * (Math.pow((v2n(c1B7)), (2)))) - ((351.9558) * (v2n(c1B7)))) + (2406.0664)) else ((((-7.016402) * (Math.pow((v2n(c1B7)), (2)))) + ((252.73142) * (v2n(c1B7)))) - (2181.287))))))))
  row1xB13B31[5] = ((if (var_ls((c1B7), (13.3))) then ("< 5th") else ((if (var_gr((c1B7), (18.8))) then ("> 95th") else ((if (var_ls((c1B7), (15.3))) then ((((10.144836) * (Math.pow((v2n(c1B7)), (2)))) - ((267.6486) * (v2n(c1B7)))) + (1770.2128)) else ((((-3.787879) * (Math.pow((v2n(c1B7)), (2)))) + ((141.86394) * (v2n(c1B7)))) - (1233.534))))))))
  row1xC13C31[5] = ((if (var_ls((c1B7), (13.6))) then ("< 5th") else ((if (var_gr((c1B7), (18.1))) then ("> 95th") else ((if (var_ls((c1B7), (15.4))) then ((((9.5231433) * (Math.pow((v2n(c1B7)), (2)))) - ((251.2705) * (v2n(c1B7)))) + (1661.0014)) else ((((-5.6235) * (Math.pow((v2n(c1B7)), (2)))) + ((204.77956) * (v2n(c1B7)))) - (1769.631))))))))
  row1xB13B31[6] = ((if (var_ls((c1B7), (13.4))) then ("< 5th") else ((if (var_gr((c1B7), (19.7))) then ("> 95th") else ((if (var_ls((c1B7), (15.5))) then ((((8.0084129) * (Math.pow((v2n(c1B7)), (2)))) - ((209.8514) * (v2n(c1B7)))) + (1378.8109)) else ((if (var_ls((c1B7), (16.7))) then ((((-4.166667) * (Math.pow((v2n(c1B7)), (2)))) + ((155) * (v2n(c1B7)))) - (1351.458)) else ((((-1.388889) * (Math.pow((v2n(c1B7)), (2)))) + ((57.222222) * (v2n(c1B7)))) - (493.2639))))))))))
  row1xC13C31[6] = ((if (var_ls((c1B7), (13.6))) then ("< 5th") else ((if (var_gr((c1B7), (18.9))) then ("> 95th") else ((if (var_ls((c1B7), (15.5))) then ((((7.0078568) * (Math.pow((v2n(c1B7)), (2)))) - ((180.1728) * (v2n(c1B7)))) + (1159.0779)) else ((if (var_ls((c1B7), (16.5))) then ((((-5.681818) * (Math.pow((v2n(c1B7)), (2)))) + ((206.81818) * (v2n(c1B7)))) - (1790.625)) else ((((-3.472222) * (Math.pow((v2n(c1B7)), (2)))) + ((131.25) * (v2n(c1B7)))) - (1145.313))))))))))
  row1xB13B31[7] = ((if (var_ls((c1B7), (13.6))) then ("< 5th") else ((if (var_gr((c1B7), (21))) then ("> 95th") else ((if (var_ls((c1B7), (16))) then ((((4.8623579) * (Math.pow((v2n(c1B7)), (2)))) - ((124.9701) * (v2n(c1B7)))) + (804.91472)) else ((if (var_ls((c1B7), (17.2))) then ((((-4.122103) * (Math.pow((v2n(c1B7)), (2)))) + ((157.68717) * (v2n(c1B7)))) - (1417.736)) else ((((-0.97189) * (Math.pow((v2n(c1B7)), (2)))) + ((42.389354) * (v2n(c1B7)))) - (366.573))))))))))
  row1xC13C31[7] = ((if (var_ls((c1B7), (13.7))) then ("< 5th") else ((if (var_gr((c1B7), (19.7))) then ("> 95th") else ((if (var_ls((c1B7), (15.7))) then ((((7.0665829) * (Math.pow((v2n(c1B7)), (2)))) - ((185.3957) * (v2n(c1B7)))) + (1218.7955)) else ((((-2.849003) * (Math.pow((v2n(c1B7)), (2)))) + ((112.04624) * (v2n(c1B7)))) - (1006.758))))))))
  row1xB13B31[8] = ((if (var_ls((c1B7), (14))) then ("< 5th") else ((if (var_gr((c1B7), (22.7))) then ("> 95th") else ((if (var_ls((c1B7), (16.6))) then ((((3.5880286) * (Math.pow((v2n(c1B7)), (2)))) - ((92.50822) * (v2n(c1B7)))) + (596.90511)) else ((if (var_ls((c1B7), (18))) then ((((-2.97619) * (Math.pow((v2n(c1B7)), (2)))) + ((120.83333) * (v2n(c1B7)))) - (1135.714)) else ((((-0.579907) * (Math.pow((v2n(c1B7)), (2)))) + ((27.857543) * (v2n(c1B7)))) - (238.5458))))))))))
  row1xC13C31[8] = ((if (var_ls((c1B7), (14))) then ("< 5th") else ((if (var_gr((c1B7), (20.9))) then ("> 95th") else ((if (var_ls((c1B7), (16))) then ((((4.666799) * (Math.pow((v2n(c1B7)), (2)))) - ((117.6612) * (v2n(c1B7)))) + (737.82339)) else ((((-1.893939) * (Math.pow((v2n(c1B7)), (2)))) + ((79.031345) * (v2n(c1B7)))) - (729.5582))))))))
  row1xB13B31[9] = ((if (var_ls((c1B7), (14.3))) then ("< 5th") else ((if (var_gr((c1B7), (24.2))) then ("> 95th") else ((if (var_ls((c1B7), (17.1))) then ((((3.3517478) * (Math.pow((v2n(c1B7)), (2)))) - ((88.94666) * (v2n(c1B7)))) + (591.09876)) else ((if (var_ls((c1B7), (19))) then ((((-1.659734) * (Math.pow((v2n(c1B7)), (2)))) + ((73.074308) * (v2n(c1B7)))) - (714.2477)) else ((((-0.629579) * (Math.pow((v2n(c1B7)), (2)))) + ((31.043956) * (v2n(c1B7)))) - (287.5572))))))))))
  row1xC13C31[9] = ((if (var_ls((c1B7), (14.2))) then ("< 5th") else ((if (var_gr((c1B7), (22.2))) then ("> 95th") else ((if (var_ls((c1B7), (16.6))) then ((((3.0675692) * (Math.pow((v2n(c1B7)), (2)))) - ((75.72176) * (v2n(c1B7)))) + (461.6862)) else ((((-1.498702) * (Math.pow((v2n(c1B7)), (2)))) + ((66.155292) * (v2n(c1B7)))) - (635.1081))))))))
  row1xB13B31[10] = ((if (var_ls((c1B7), (14.6))) then ("< 5th") else ((if (var_gr((c1B7), (25.7))) then ("> 95th") else ((if (var_ls((c1B7), (17.8))) then ((((1.3605238) * (Math.pow((v2n(c1B7)), (2)))) - ((29.68961) * (v2n(c1B7)))) + (147.63683)) else ((if (var_ls((c1B7), (19.8))) then ((((-1.502404) * (Math.pow((v2n(c1B7)), (2)))) + ((68.990385) * (v2n(c1B7)))) - (702.0072)) else ((((-0.480618) * (Math.pow((v2n(c1B7)), (2)))) + ((25.257965) * (v2n(c1B7)))) - (236.6861))))))))))
  row1xC13C31[10] = ((if (var_ls((c1B7), (14.6))) then ("< 5th") else ((if (var_gr((c1B7), (23.5))) then ("> 95th") else ((if (var_ls((c1B7), (17.2))) then ((((2.4852546) * (Math.pow((v2n(c1B7)), (2)))) - ((61.77326) * (v2n(c1B7)))) + (377.23969)) else ((if (var_ls((c1B7), (19.2))) then ((((-1.30662) * (Math.pow((v2n(c1B7)), (2)))) + ((60.060976) * (v2n(c1B7)))) - (596.4983)) else ((((-1.132588) * (Math.pow((v2n(c1B7)), (2)))) + ((53.012685) * (v2n(c1B7)))) - (525.3262))))))))))
  row1xB13B31[11] = ((if (var_ls((c1B7), (15))) then ("< 5th") else ((if (var_gr((c1B7), (26.8))) then ("> 95th") else ((if (var_ls((c1B7), (18.3))) then ((((1.2853726) * (Math.pow((v2n(c1B7)), (2)))) - ((29.01195) * (v2n(c1B7)))) + (150.55772)) else ((if (var_ls((c1B7), (20.4))) then ((((-1.362835) * (Math.pow((v2n(c1B7)), (2)))) + ((64.646465) * (v2n(c1B7)))) - (676.6306)) else ((((-0.458211) * (Math.pow((v2n(c1B7)), (2)))) + ((24.752566) * (v2n(c1B7)))) - (239.2632))))))))))
  row1xC13C31[11] = ((if (var_ls((c1B7), (15.1))) then ("< 5th") else ((if (var_gr((c1B7), (24.8))) then ("> 95th") else ((if (var_ls((c1B7), (17.8))) then ((((1.8298339) * (Math.pow((v2n(c1B7)), (2)))) - ((43.53786) * (v2n(c1B7)))) + (245.20803)) else ((if (var_ls((c1B7), (20))) then ((((-1.075977) * (Math.pow((v2n(c1B7)), (2)))) + ((52.035573) * (v2n(c1B7)))) - (535.3206)) else ((((-0.942029) * (Math.pow((v2n(c1B7)), (2)))) + ((46.369565) * (v2n(c1B7)))) - (475.5797))))))))))
  row1xB13B31[12] = ((if (var_ls((c1B7), (15.4))) then ("< 5th") else ((if (var_gr((c1B7), (27.9))) then ("> 95th") else ((if (var_ls((c1B7), (18.9))) then ((((0.721787) * (Math.pow((v2n(c1B7)), (2)))) - ((11.71291) * (v2n(c1B7)))) + (13.651678)) else ((if (var_ls((c1B7), (21.2))) then ((((-1.135147) * (Math.pow((v2n(c1B7)), (2)))) + ((56.388948) * (v2n(c1B7)))) - (610.2654)) else ((((-0.40645) * (Math.pow((v2n(c1B7)), (2)))) + ((22.941764) * (v2n(c1B7)))) - (228.6906))))))))))
  row1xC13C31[12] = ((if (var_ls((c1B7), (15.6))) then ("< 5th") else ((if (var_gr((c1B7), (25.8))) then ("> 95th") else ((if (var_ls((c1B7), (18.4))) then ((((2.0573725) * (Math.pow((v2n(c1B7)), (2)))) - ((53.97538) * (v2n(c1B7)))) + (346.55949)) else ((((-0.849432) * (Math.pow((v2n(c1B7)), (2)))) + ((43.608961) * (v2n(c1B7)))) - (464.7563))))))))
  row1xB13B31[13] = ((if (var_ls((c1B7), (15.7))) then ("< 5th") else ((if (var_gr((c1B7), (28.6))) then ("> 95th") else ((if (var_ls((c1B7), (19.4))) then ((((0.7268851) * (Math.pow((v2n(c1B7)), (2)))) - ((13.11623) * (v2n(c1B7)))) + (31.041935)) else ((if (var_ls((c1B7), (21.8))) then ((((-1.039144) * (Math.pow((v2n(c1B7)), (2)))) + ((53.229419) * (v2n(c1B7)))) - (591.5583)) else ((((-0.407436) * (Math.pow((v2n(c1B7)), (2)))) + ((23.475936) * (v2n(c1B7)))) - (243.1457))))))))))
  row1xC13C31[13] = ((if (var_ls((c1B7), (16.1))) then ("< 5th") else ((if (var_gr((c1B7), (26.8))) then ("> 95th") else ((if (var_ls((c1B7), (19.1))) then ((((1.8117346) * (Math.pow((v2n(c1B7)), (2)))) - ((48.73513) * (v2n(c1B7)))) + (319.92319)) else ((((-0.786164) * (Math.pow((v2n(c1B7)), (2)))) + ((41.845615) * (v2n(c1B7)))) - (462.1297))))))))
  row1xB13B31[14] = ((if (var_ls((c1B7), (16.1))) then ("< 5th") else ((if (var_gr((c1B7), (29.4))) then ("> 95th") else ((if (var_ls((c1B7), (19.9))) then ((((0.8137127) * (Math.pow((v2n(c1B7)), (2)))) - ((17.27052) * (v2n(c1B7)))) + (71.571639)) else ((if (var_ls((c1B7), (22.4))) then ((((-0.956284) * (Math.pow((v2n(c1B7)), (2)))) + ((50.45082) * (v2n(c1B7)))) - (575.2732)) else ((((-0.385154) * (Math.pow((v2n(c1B7)), (2)))) + ((22.808123) * (v2n(c1B7)))) - (242.6471))))))))))
  row1xC13C31[14] = ((if (var_ls((c1B7), (16.6))) then ("< 5th") else ((if (var_gr((c1B7), (27.7))) then ("> 95th") else ((if (var_ls((c1B7), (19.7))) then ((((2.5054069) * (Math.pow((v2n(c1B7)), (2)))) - ((76.59692) * (v2n(c1B7)))) + (586.52726)) else ((if (var_ls((c1B7), (22.2))) then ((((-0.932018) * (Math.pow((v2n(c1B7)), (2)))) + ((49.051535) * (v2n(c1B7)))) - (554.6086)) else ((((-0.457016) * (Math.pow((v2n(c1B7)), (2)))) + ((26.441453) * (v2n(c1B7)))) - (286.7646))))))))))
  row1xB13B31[15] = ((if (var_ls((c1B7), (16.4))) then ("< 5th") else ((if (var_gr((c1B7), (30))) then ("> 95th") else ((if (var_ls((c1B7), (20.2))) then ((((1.0986916) * (Math.pow((v2n(c1B7)), (2)))) - ((28.25778) * (v2n(c1B7)))) + (172.58255)) else ((if (var_ls((c1B7), (22.8))) then ((((-0.882751) * (Math.pow((v2n(c1B7)), (2)))) + ((47.573673) * (v2n(c1B7)))) - (550.7905)) else ((((-0.36465) * (Math.pow((v2n(c1B7)), (2)))) + ((22.031317) * (v2n(c1B7)))) - (237.7542))))))))))
  row1xC13C31[15] = ((if (var_ls((c1B7), (17.2))) then ("< 5th") else ((if (var_gr((c1B7), (28.4))) then ("> 95th") else ((if (var_ls((c1B7), (20.5))) then ((((2.178566) * (Math.pow((v2n(c1B7)), (2)))) - ((68.54933) * (v2n(c1B7)))) + (539.67771)) else ((if (var_ls((c1B7), (22.9))) then ((((-1.023065) * (Math.pow((v2n(c1B7)), (2)))) + ((54.817708) * (v2n(c1B7)))) - (643.8198)) else ((((-0.457016) * (Math.pow((v2n(c1B7)), (2)))) + ((27.081275) * (v2n(c1B7)))) - (305.4975))))))))))
  row1xB13B31[16] = ((if (var_ls((c1B7), (16.9))) then ("< 5th") else ((if (var_gr((c1B7), (30.5))) then ("> 95th") else ((if (var_ls((c1B7), (20.7))) then ((((1.0986916) * (Math.pow((v2n(c1B7)), (2)))) - ((29.35647) * (v2n(c1B7)))) + (186.98611)) else ((if (var_ls((c1B7), (23.3))) then ((((-0.885628) * (Math.pow((v2n(c1B7)), (2)))) + ((48.582996) * (v2n(c1B7)))) - (576.1855)) else ((((-0.343997) * (Math.pow((v2n(c1B7)), (2)))) + ((21.28483) * (v2n(c1B7)))) - (234.1839))))))))))
  row1xC13C31[16] = ((if (var_ls((c1B7), (17.7))) then ("< 5th") else ((if (var_gr((c1B7), (29))) then ("> 95th") else ((if (var_ls((c1B7), (21.2))) then ((((1.932012) * (Math.pow((v2n(c1B7)), (2)))) - ((62.26754) * (v2n(c1B7)))) + (501.77516)) else ((if (var_ls((c1B7), (23.4))) then ((((-1.240857) * (Math.pow((v2n(c1B7)), (2)))) + ((66.705852) * (v2n(c1B7)))) - (806.4734)) else ((((-0.297619) * (Math.pow((v2n(c1B7)), (2)))) + ((19.166667) * (v2n(c1B7)))) - (210.5357))))))))))
  row1xB13B31[17] = ((if (var_ls((c1B7), (17.2))) then ("< 5th") else ((if (var_gr((c1B7), (31))) then ("> 95th") else ((if (var_ls((c1B7), (21.1))) then ((((1.4948127) * (Math.pow((v2n(c1B7)), (2)))) - ((45.64661) * (v2n(c1B7)))) + (347.70261)) else ((if (var_ls((c1B7), (23.7))) then ((((-0.882751) * (Math.pow((v2n(c1B7)), (2)))) + ((49.162624) * (v2n(c1B7)))) - (594.3218)) else ((((-0.365091) * (Math.pow((v2n(c1B7)), (2)))) + ((22.71021) * (v2n(c1B7)))) - (258.164))))))))))
  row1xC13C31[17] = ((if (var_ls((c1B7), (18.3))) then ("< 5th") else ((if (var_gr((c1B7), (29.7))) then ("> 95th") else ((if (var_ls((c1B7), (21.9))) then ((((1.7205506) * (Math.pow((v2n(c1B7)), (2)))) - ((56.51408) * (v2n(c1B7)))) + (462.60923)) else ((if (var_ls((c1B7), (24))) then ((((-1.35357) * (Math.pow((v2n(c1B7)), (2)))) + ((74.03364) * (v2n(c1B7)))) - (922.1508)) else ((((-0.272641) * (Math.pow((v2n(c1B7)), (2)))) + ((18.149597) * (v2n(c1B7)))) - (203.5491))))))))))
  row1xB13B31[18] = ((if (var_ls((c1B7), (17.5))) then ("< 5th") else ((if (var_gr((c1B7), (31.3))) then ("> 95th") else ((if (var_ls((c1B7), (21.4))) then ((((1.835396) * (Math.pow((v2n(c1B7)), (2)))) - ((59.80232) * (v2n(c1B7)))) + (489.29761)) else ((if (var_ls((c1B7), (24))) then ((((-0.882751) * (Math.pow((v2n(c1B7)), (2)))) + ((49.692275) * (v2n(c1B7)))) - (609.1501)) else ((((-0.365091) * (Math.pow((v2n(c1B7)), (2)))) + ((22.929265) * (v2n(c1B7)))) - (265.0099))))))))))
  row1xC13C31[18] = ((if (var_ls((c1B7), (19))) then ("< 5th") else ((if (var_gr((c1B7), (30.1))) then ("> 95th") else ((if (var_ls((c1B7), (22.5))) then ((((2.3074556) * (Math.pow((v2n(c1B7)), (2)))) - ((82.98123) * (v2n(c1B7)))) + (748.85294)) else ((if (var_ls((c1B7), (24.4))) then ((((-1.605473) * (Math.pow((v2n(c1B7)), (2)))) + ((88.454558) * (v2n(c1B7)))) - (1127.457)) else ((((-0.187434) * (Math.pow((v2n(c1B7)), (2)))) + ((13.723947) * (v2n(c1B7)))) - (148.2734))))))))))
  tmp4 = ((c1B3) < (0.5))
  tmp5 = ((c1B3) > (20))
  sumcnt6_sum = ((false or tmp5) or tmp4)
  sumcnt6_cnt = 2
  c1B8 = ((if (orgeneral(0, sumcnt6_sum, sumcnt6_cnt, eecm1)) then ("Enter a valid age") else ((if (not (eeisnumber((c1B7)))) then (c1B7) else ((if (str_eq((c1B2), ("Female"))) then (lookup3vv((round((c1B3), (0))), row1xA13A31, 0, 18, row1xB13B31, 0, 18)) else ((if (str_eq((c1B2), ("Male"))) then (lookup3vv((round((c1B3), (0))), row1xA13A31, 0, 18, row1xC13C31, 0, 18)) else ("")))))))))

  data = {}
  data.kms = c1B7
  data.BMIPercentile = c1B8
  data.p1B9 = c1B9

  if !isNaN(data.BMIPercentile)

     data.classification = "PA"
     return data;

  switch data.BMIPercentile
    when "> 95th"
      data.classification = "0"
    when "< 5th"
      data.classification = "PB" #; PB; RPB; PA; SP; O'.split('; ')

  return data


module.exports = calc