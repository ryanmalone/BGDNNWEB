(function(){var a;a=function(c,b,e,g){var d;d=c%10;if(d===1&&(c===1||c>20)){return b}else{if(d>1&&d<5&&(c>20||c<10)){return e}else{return g}}};jQuery.timeago.settings.strings={prefixAgo:"prije",prefixFromNow:"za",suffixAgo:null,suffixFromNow:null,second:"sekundu",seconds:function(b){return a(b,"%d sekundu","%d sekunde","%d sekundi")},minute:"oko minutu",minutes:function(b){return a(b,"%d minutu","%d minute","%d minuta")},hour:"oko jedan sat",hours:function(b){return a(b,"%d sat","%d sata","%d sati")},day:"jedan dan",days:function(b){return a(b,"%d dan","%d dana","%d dana")},month:"mjesec dana",months:function(b){return a(b,"%d mjesec","%d mjeseca","%d mjeseci")},year:"prije godinu dana",years:function(b){return a(b,"%d godinu","%d godine","%d godina")},wordSeparator:" "}}).call(this);