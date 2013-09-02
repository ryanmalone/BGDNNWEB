(function(a){if(typeof define==="function"&&define.amd){define(["jquery"],a)}else{a(jQuery)}}(function(a){a.timeago=function(g){if(g instanceof Date){return d(g)}else{if(typeof g==="string"){return d(a.timeago.parse(g))}else{if(typeof g==="number"){return d(new Date(g))}else{return d(a.timeago.datetime(g))}}}};var b=a.timeago;a.extend(a.timeago,{settings:{refreshMillis:60000,allowFuture:false,strings:{prefixAgo:null,prefixFromNow:null,suffixAgo:"ago",suffixFromNow:"from now",seconds:"less than a minute",minute:"about a minute",minutes:"%d minutes",hour:"about an hour",hours:"about %d hours",day:"a day",days:"%d days",month:"about a month",months:"%d months",year:"about a year",years:"%d years",wordSeparator:" ",numbers:[]}},inWords:function(i){var g=this.settings.strings;var l=g.prefixAgo;var p=g.suffixAgo;if(this.settings.allowFuture){if(i<0){l=g.prefixFromNow;p=g.suffixFromNow}}var m=Math.abs(i)/1000;var k=m/60;var j=k/60;var h=j/24;var r=h/365;function o(u,s){var t=a.isFunction(u)?u(s,i):u;var v=(g.numbers&&g.numbers[s])||s;return t.replace(/%d/i,v)}var q=m<45&&o(g.seconds,Math.round(m))||m<90&&o(g.minute,1)||k<45&&o(g.minutes,Math.round(k))||k<90&&o(g.hour,1)||j<24&&o(g.hours,Math.round(j))||j<42&&o(g.day,1)||h<30&&o(g.days,Math.round(h))||h<45&&o(g.month,1)||h<365&&o(g.months,Math.round(h/30))||r<1.5&&o(g.year,1)||o(g.years,Math.round(r));var n=g.wordSeparator||"";if(g.wordSeparator===undefined){n=" "}return a.trim([l,q,p].join(n))},parse:function(g){var h=a.trim(g);h=h.replace(/\.\d+/,"");h=h.replace(/-/,"/").replace(/-/,"/");h=h.replace(/T/," ").replace(/Z/," UTC");h=h.replace(/([\+\-]\d\d)\:?(\d\d)/," $1$2");return new Date(h)},datetime:function(g){var h=b.isTime(g)?a(g).attr("datetime"):a(g).attr("title");return b.parse(h)},isTime:function(g){return a(g).get(0).tagName.toLowerCase()==="time"}});a.fn.timeago=function(){var h=this;h.each(f);var g=b.settings;if(g.refreshMillis>0){setInterval(function(){h.each(f)},g.refreshMillis)}return h};function f(){var g=e(this);if(!isNaN(g.datetime)){a(this).text(d(g.datetime))}return this}function e(g){g=a(g);if(!g.data("timeago")){g.data("timeago",{datetime:b.datetime(g)});var h=a.trim(g.text());if(h.length>0&&!(b.isTime(g)&&g.attr("title"))){g.attr("title",h)}}return g.data("timeago")}function d(g){return b.inWords(c(g))}function c(g){return(new Date().getTime()-g.getTime())}document.createElement("abbr");document.createElement("time")}));