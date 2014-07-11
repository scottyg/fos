$(document).foundation();

$(document).ready(function(){
	var active = 'about';
	$(".about").click(function(){
		$(".terminal-content").hide();
		$("#terminal-about").show();
		$(".info-content").hide();
		$("#info-about").show();
		$(".nav > a").removeClass("active");
		$(this).addClass("active");
		if(active!='about'){
			active='about';
			
			$(".next").hide();
			setTimeout(function(){
				$(".next").fadeIn(1000);
			}, 2000);
		}
	});
	$(".install").click(function(){
		$(".terminal-content").hide();
		$("#terminal-install").show();
		$(".info-content").hide();
		$("#info-install").show();
		$(".nav > a").removeClass("active");
		$(this).addClass("active");
		if(active!='install'){
			active='install';
			
			$(".next").hide();
			setTimeout(function(){
				$(".next").fadeIn(1000);
			}, 2000);
		}
	});
	$(".use").click(function(){
		$(".terminal-content").hide();
		$("#terminal-use").show();
		$(".info-content").hide();
		$("#info-use").show();
		$(".nav > a").removeClass("active");
		$(this).addClass("active");
		if(active!='use'){
			active='use';
			
			$(".next").hide();
			setTimeout(function(){
				$(".next").fadeIn(1000);
			}, 2000);
		}
	});
	$(".dev").click(function(){
		$(".terminal-content").hide();
		$("#terminal-dev").show();
		$(".info-content").hide();
		$("#info-dev").show();
		$(".nav > a").removeClass("active");
		$(this).addClass("active");
		if(active!='dev'){
			active='dev';
			
			$(".next").hide();
			setTimeout(function(){
				$(".next").fadeIn(1000);
			}, 2000);
		}
	});
	$('a').click(function(){
		$('html, body').animate({
			scrollTop: $( $.attr(this, 'href') ).offset().top
		}, 500);
		return false;
	});
	

	setTimeout(function(){
		$(".next").fadeIn(1000);
	}, 2000);

	$("#terminal").hover(function(){
		var new_height = $("#terminal .content .terminal-content pre").css('height');
		new_height = new_height.replace("px", "");
		new_height = parseInt(new_height) +30;
		$("#terminal .content").animate({
			height: new_height
		});
	}, function(){
		$("#terminal .content").animate({
			height: '200px'
		});
	});
	$(window).scroll(function(i){
    	var scrollVar = $(window).scrollTop();
    	$('.fader').css({'opacity':( 100-scrollVar )/100});
    	$('.fader').css({'top': .9*scrollVar });
    	if(scrollVar>150){
	    	$('.fader').hide();
    	}
    	if(scrollVar<150){
	    	$('.fader').show();
    	}
	})
});