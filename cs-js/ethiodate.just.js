         var fmtDate, getEthiopianDate,
    getEthiopianDay, getEthiopianMonth,
      getEthiopianYear, getFerangeeDOY;
getEthiopianDate = function(date, rev){
  var day, month, year;
  day = getEthiopianDay(date);
  month = getEthiopianMonth(date);
  year = getEthiopianYear(date);
  return fmtDate(year, month, day,rev);
}; getEthiopianDay =   function(date) {
  var ethiopianDOY, ethiopianYear,
             ferangeeDay, ferangeeYear;
  ferangeeYear    = date.getFullYear();
  ferangeeDay   = getFerangeeDOY(date);
  if (ferangeeYear % 4 === 0) {
    if (ferangeeDay < 255) {
      ethiopianDOY = ferangeeDay + 110;
      ethiopianYear = ferangeeYear - 8;
    } else {
      ethiopianDOY = ferangeeDay - 255;
      ethiopianYear = ferangeeYear - 7;
    }
  } else if ((ferangeeYear+1)%4 === 0){
    if (ferangeeDay < 255) {
      ethiopianDOY = ferangeeDay + 111;
      ethiopianYear = ferangeeYear - 8;
    } else {
      ethiopianDOY = ferangeeDay - 255;
      ethiopianYear = ferangeeYear - 7;
    }
  } else {
    if (ferangeeDay < 254) {
      ethiopianDOY = ferangeeDay + 111;
      ethiopianYear = ferangeeYear - 8;
    } else {
      ethiopianDOY = ferangeeDay - 254;
      ethiopianYear = ferangeeYear - 7;
    }
  }
  return ethiopianDOY % 30 + 1;
}; getEthiopianMonth = function(date) {
  var ethiopianDOY, ethiopianYear,
             ferangeeDay, ferangeeYear;
  ferangeeYear =    date.getFullYear();
  ferangeeDay =   getFerangeeDOY(date);
  if (ferangeeYear % 4 === 0) {
    if (ferangeeDay < 255) {
      ethiopianDOY = ferangeeDay + 110;
      ethiopianYear = ferangeeYear - 8;
    } else {
      ethiopianDOY = ferangeeDay - 255;
      ethiopianYear = ferangeeYear - 7;
    }
  } else if ((ferangeeYear+1)%4 === 0){
    if (ferangeeDay < 255) {
      ethiopianDOY = ferangeeDay + 111;
      ethiopianYear = ferangeeYear - 8;
    } else {
      ethiopianDOY = ferangeeDay - 255;
      ethiopianYear = ferangeeYear - 7;
    }
  } else {
    if (ferangeeDay < 254) {
      ethiopianDOY = ferangeeDay + 111;
      ethiopianYear = ferangeeYear - 8;
    } else {
      ethiopianDOY = ferangeeDay - 254;
      ethiopianYear = ferangeeYear - 7;
    }
  }
  return Math.floor(ethiopianDOY/30)+1;
};  getEthiopianYear = function(date) {
  var ethiopianYear, ferangeeDay,
                          ferangeeYear;
  ferangeeYear = date.getFullYear();
  ferangeeDay = getFerangeeDOY( date );
  if (ferangeeYear % 4 === 0) {
    if (ferangeeDay < 255) {
      ethiopianYear = ferangeeYear - 8;
    } else {
      ethiopianYear = ferangeeYear - 7;
    }
  } else if (ferangeeYear+1 % 4 === 0){
    if (ferangeeDay < 255) {
      ethiopianYear = ferangeeYear - 8;
    } else {
      ethiopianYear = ferangeeYear - 7;
    }
  } else {
    if (ferangeeDay < 254) {
      ethiopianYear = ferangeeYear - 8;
    } else {
      ethiopianYear = ferangeeYear - 7;
    }
  }
  return ethiopianYear;
};
fmtDate = function(year,month,day,rev){
  if (rev == null){ rev = false; }
  if (month < 10){ month = '0'+month; }
  if ( day < 10 ){  day  = '0' + day; }
  if (rev){ 
    return year+ '-' +month+ '-' + day;
  } else {
    return day + '/' +month+ '/' +year;
  }
};
getFerangeeDOY = function(dateIn) {
  return Math.floor((dateIn - new Date(
    dateIn.getFullYear() - 1 + "-12-31"
  )  )  /  ( 24 * 60 * 60 * 1000)  )  ;
};
/* Test it all out */
console.clear();
console.log(getEthiopianDate(new Date("1984-07-17"), true));
console.log(getEthiopianDate(new Date("2012-01-12")));
console.log(getEthiopianDate(new Date("2012-01-13")));
console.log(getEthiopianDate(new Date()));