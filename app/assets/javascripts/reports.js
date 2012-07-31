$(document).ready(function() {
	var thumbGalleryStt = {
		'viewportWidth' : '100%',
		'viewportHeight' : '100%',
		'startScale' : 0.5,
		'startX' : 0,
		'startY' : 0,
		'animTime' : 500,
		'draggInertia' : 10,
		'contentUrl' : gon.firstImage,
		'intNavEnable' : true,
		'intNavPos' : 'R',
		'intNavAutoHide' : true,
		"fitToViewportShortSide" : false,
		"contentSizeOver100" : false
	};
	$("#myDiv").lhpMegaImgViewer(thumbGalleryStt);
	$('#galleryThumbImg a').each(function(index){
		$(this).click(function(e) { //add thumb mouse click interaction
			e.preventDefault();
			thumbGalleryStt.contentUrl = $(this).attr('href'); //read img url
			$('#myDiv').lhpMegaImgViewer('destroy'); //destroy old instance
			$('#myDiv').lhpMegaImgViewer(thumbGalleryStt); //create new instance
		});
	});
	$("#printBtn").click(function() {
		printElem({
			printMode:"iframe",
			leaveOpen:true
		});
	});
});

function printElem(options) {
	$("#printArea").printElement(options);
        history.back(-1);
}
