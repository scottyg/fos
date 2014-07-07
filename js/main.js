$(document).foundation();

$(document).ready(function(){
	$(".install").click(function(){
		$(".content").html("$ gem install fos");
		$("#info-content").html("<h1>Installation</h1><p>fos is a Ruby gem and can be easily installed from terminal with <span class='code'>$ gem install fos</span></p>");
	});
	$(".use").click(function(){
		$(".content").html("$ fos");
		$("#info-content").html("<h1>Usage</h1><p>Fos archives <span class='code'>~/Desktop</span> and <span class='code'>~/Downloads</span> by default.<br/><br/>Try <span class='code'>$ fos -h</span> for more options.</p>");
	});
	$(".dev").click(function(){
		$(".content").html("$ bundle install<br/>$ rake install<br/>");
		$("#info-content").html("<h1>Development</h1><p></p>");
	});
});