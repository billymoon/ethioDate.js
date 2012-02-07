#>>lang=cf
# Coffee script implementation of original oracle code to calculate
# ethiopian date from ferangee date. Lovingly translated by Billy Moon

# For future use...
months = ["Maskaram","Tekemt","Hadar","Tahsas","Terr","Yakatit","Magabit","Miyazya","Ganbot","Seni","Hamle","Nuhase","Pagumen"]
days = ["Segno","Maksegno","Erob","Hamus","Arb","Kidame","Ihud"]

getEthiopianDate = (date, rev) ->
  day = getEthiopianDay date
  month = getEthiopianMonth date
  year = getEthiopianYear date
  formatDate year, month, day, rev

getEthiopianDay = (date) ->
  ferangeeYear = date.getFullYear()
  ferangeeDay = getFerangeeDOY date
  if ferangeeYear % 4 == 0
    if ferangeeDay < 255
      ethiopianDOY = ferangeeDay + 110 
      ethiopianYear = ferangeeYear - 8
    else
      ethiopianDOY = ferangeeDay - 255
      ethiopianYear = ferangeeYear - 7
  else if (ferangeeYear + 1) % 4 == 0
    if ferangeeDay < 255
      ethiopianDOY = ferangeeDay + 111 
      ethiopianYear = ferangeeYear - 8
    else
      ethiopianDOY = ferangeeDay - 255
      ethiopianYear = ferangeeYear - 7
  else
    if ferangeeDay < 254
      ethiopianDOY = ferangeeDay + 111
      ethiopianYear = ferangeeYear - 8
    else
      ethiopianDOY = ferangeeDay - 254
      ethiopianYear = ferangeeYear - 7
  ethiopianDOY % 30 + 1
      
getEthiopianMonth = (date) ->
  ferangeeYear = date.getFullYear()
  ferangeeDay = getFerangeeDOY date
  if ferangeeYear % 4 == 0
    if ferangeeDay < 255
      ethiopianDOY = ferangeeDay + 110  
      ethiopianYear = ferangeeYear - 8  
    else
      ethiopianDOY = ferangeeDay - 255  
      ethiopianYear = ferangeeYear - 7      
  else if (ferangeeYear + 1) % 4 == 0
    if ferangeeDay < 255
      ethiopianDOY = ferangeeDay + 111
      ethiopianYear = ferangeeYear - 8
    else
      ethiopianDOY = ferangeeDay - 255 
      ethiopianYear = ferangeeYear - 7  
  else
    if ferangeeDay < 254
      ethiopianDOY = ferangeeDay + 111
      ethiopianYear = ferangeeYear - 8
    else
      ethiopianDOY = ferangeeDay - 254
      ethiopianYear = ferangeeYear - 7  
  Math.floor(ethiopianDOY / 30) + 1

getEthiopianYear = (date) ->
  ferangeeYear = date.getFullYear()
  ferangeeDay = getFerangeeDOY date
  if ferangeeYear % 4 == 0
    if ferangeeDay < 255
      ethiopianYear = ferangeeYear - 8
    else
      ethiopianYear = ferangeeYear - 7        
  else if ferangeeYear + 1 % 4 == 0
    if ferangeeDay < 255
      ethiopianYear = ferangeeYear - 8
    else
      ethiopianYear = ferangeeYear - 7
  else
    if ferangeeDay < 254
      ethiopianYear = ferangeeYear - 8
    else
      ethiopianYear = ferangeeYear - 7
  ethiopianYear

# renamed function (from getEthiopianDateTx to avoid conflict and then to reflect action)
# added rev flag to allow for Y-M-D and D/M/Y output
# removed tx variables (which I assume add text value to numeric month/day name)
formatDate = (year, month, day, rev = false) ->
  if rev == 'full' then day + (if day.toString().match(/(^|2|3)1$/) then 'st' else if day.toString().match(/(^|2)2$/) then 'nd' else if day.toString().match(/(^|2)3$/) then 'rd' else 'th') + ' of ' + months[month] + ' ' + year
  else
    if month < 10 then month = '0' + month
    if day < 10 then day = '0' + day
    if rev then year + '-' + month + '-' + day
    else day + '/' + month + '/' + year    

# Added to calculate ferangee Day of Year
getFerangeeDOY = (dateIn) ->
    Math.floor( ( dateIn - new Date(dateIn.getFullYear()-1 + "-12-31") ) / (24 * 60 * 60 * 1000) )

### Test it all out ###
console.clear()
console.log getEthiopianDate (new Date "1984-07-17"), true # Rahel's Birthday
console.log getEthiopianDate (new Date "2012-01-12"), 'full' # Labour day
console.log getEthiopianDate new Date "2012-01-13" # Mia's Birthday
console.log getEthiopianDate new Date() # today
###
