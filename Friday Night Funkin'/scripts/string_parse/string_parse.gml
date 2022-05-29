//Script from: https://www.gmlscripts.com/script/string_parse
function string_parse(str,token,ignore=1){
	var list,tlen,temp;
	list= [];
	tlen= string_length( token);
	while string_length(str)!= 0 {
		temp= string_pos(token,str);
		if temp {
			if temp != 1 || !ignore {array_push(list,string_copy(str,1,temp-1));}
			str= string_copy(str,temp+tlen,string_length(str));
		}else{
			array_push(list,str);
			str= "";
		}
	}
	return list;
}
