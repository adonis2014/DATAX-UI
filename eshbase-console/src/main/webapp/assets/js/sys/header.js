var Header = {
	changeSite : function(name){
		blockUI();
		$.ajax({
			type : "GET",
			url : ctx+"/cms/site/changeSite",
			data :{name:name},
			success : function(data){
				window.location.reload();
			},
			error : function(error) {
				unBlockUI();
			}
		});
	},
	tips : function(){
		alert("还没做0.0!");
	}
}

function showProfile(){
	
}

function modifyPassword(){
	
}

function showFavorite(){
	window.location.href=ctx+"/meta/Favorite/list?userId=1";
}
function showWatch(){
	window.location.href=ctx+"/meta/Watch/list?userId=1";
}
function showOwner(){
	window.location.href=ctx+"/meta/Owner/list?userId=1";
}
function showComment(){
	window.location.href=ctx+"/meta/Comment/list?userId=1";
}