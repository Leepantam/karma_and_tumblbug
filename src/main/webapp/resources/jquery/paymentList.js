/**
 * 

$("#findBtn").click(function() {
    new daum.Postcode({
        oncomplete: function(data) {
            $("#road_name").val(data.roadAddress);
        }
    }).open();
})

setTimeout(function() {
    opener.location.reload(); //부모창 리프레쉬
    self.close(); //현재창 닫기
    }, 2000); // 2초후 실행 1000당 1초


$(".bankAccount").each(function(items){
		let bNum = $(items).attr("title");
		let numLength = bNum.length-4;
		let showNum = bNum.substr(numLength);
		let result = showNum;
		$(items).text(result);
	})
 */
$(document).ready(function(){
	$(".cardNum").each(function(index, item){
		let cNum = $(item).attr("title");
		console.log(cNum);
		let showNum = cNum.substr(12);
		let result = "************"+showNum;
		$(item).text(result);
			
	})
	$(".bankAccount").each(function(index, items){
		let bNum = $(items).attr("title");
		let numLength = bNum.length-4;
		let showNum = bNum.substr(numLength);
		let result ="************"+showNum
		$(items).text(result);
	})
	
})

openPopup = function() {
    var _width = '650';
    var _height = '600';
    var _left = Math.ceil(( window.screen.width - _width )/2);
    var _top = Math.ceil(( window.screen.height - _height )/2); 

    window.open('./paymentInsert', 'popup-test', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top,
'status=no','toolbar=no','scrollbars=no','titlebar=no'

 );
 
}

$("#addBtn").click(function(){
	openPopup();
	});
	

	

