(function(a,b){a(document).ready(function(){a("#[ID]").dynatree({onSelect:function(f,h){var k=a("#[ID]").dynatree("getTree").serializeArray();var j="";var g;for(g=0;g<k.length;g+=1){j+=k[g].value+","}a("#[StorageControlId]").val(j)},checkbox:true[Children]});var e=a("#[ID]").dynatree("getTree").serializeArray();var d="";var c;for(c=0;c<e.length;c+=1){d+=e[c].value+","}a("#[StorageControlId]").val(d)})}(jQuery,window.Sys));