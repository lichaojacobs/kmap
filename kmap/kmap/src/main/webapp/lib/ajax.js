var ajaxflag = false;
function ajaxToServerByPost(url, data, sCallBack, eCallBack, cCallBack) {
	
	$.ajax({
		type: "post",
		url: url + "?" + new Date().getMilliseconds(),
		data: data,
		success: function(data) {
			ajaxflag = false;
			sCallBack(data);
			cCallBack();
		},
		error: function(data) {
			ajaxflag = false;
			eCallBack();
			cCallBack();
		},
		complete:function(){
			ajaxflag=false;
		}
	});
}

function ajaxToServerByGet(url, data, sCallBack, eCallBack, cCallBack) {
	$.ajax({
		type: "get",
		url: url + "?" + new Date().getMilliseconds(),
		data: data,
		success: function(data) {
			ajaxflag = false;
			sCallBack(data);
			cCallBack();
			return data;
		},
		error: function(data) {
			ajaxflag = false;
			eCallBack();
			cCallBack();
		},
		complete:function(){
		}
	});
}