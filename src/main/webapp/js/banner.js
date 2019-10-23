// JavaScript Document
$(function () {
	var leng = $(".homeban li").length;
	$(".tablist span:first").addClass("on");
	$(".homeban li:first").show();

	var num = 1;

	function huan() {
		$('.homeban li a').hide();
		$('.homeban li').eq(num).children("a").show();
		$('.homeban li').eq(num).hide().fadeTo(600, 1);
		$('.homeban li').eq(num).siblings().fadeTo(600, 0, function () {
			$('.homeban li').eq(num - 1).siblings().hide();
		});
		$('.tablist span').eq(num).addClass('on').siblings().removeClass("on");
		num++;
		if (num > leng - 1) {
			num = 0;
		}
	}
	if (leng > 1) {
		$(".ban_next").click(function(){
			if(!$(".homeban li").is(":animated")){
				clearInterval(time);
				time = setInterval(huan, 6000);
				$(".tablist span").eq(num).addClass('on').siblings().removeClass("on");
				$(".homeban li").eq(num).hide().stop().fadeTo(600, 1);
				$(".homeban li a").hide();
				$(".homeban li").eq(num).children("a").show();
				$(".homeban li").eq(num).siblings().stop().fadeTo(600, 0, function () {
					$(".homeban li").eq(num-1).siblings().hide();
				});
				num++;
				if(num>leng-1){
					num=0;
				}
			}
		})

		$(".tablist span").mouseover(function (e) {
			if (!$(".homeban li").is(":animated")) {
				var block = $(this).attr("class");
				if (block != 'on') {
					clearInterval(time);
					time = setInterval(huan, 6000);
					var mun = $(this).index()
					$(this).addClass('on').siblings().removeClass("on");
					$(".homeban li").eq(mun).hide().stop().fadeTo(600, 1);
					$(".homeban li a").hide();
					$(".homeban li").eq(mun).children("a").show();
					$(".homeban li").eq(mun).siblings().stop().fadeTo(600, 0, function () {
						$(".homeban li").eq(mun).siblings().hide();
					});
					num = mun + 1;
					if (num == leng) {
						num = 0;
					}
				}
			}
		});
		$(".tablist span").css("display","inline-block");
		$(".tablist .ban_next").show();
		var time = setInterval(huan, 6000);
		$('.homeban ul').hover(function () {
			clearInterval(time);
		}, function () {
			clearInterval(time);
			time = setInterval(huan, 6000);
		})
	}
})
