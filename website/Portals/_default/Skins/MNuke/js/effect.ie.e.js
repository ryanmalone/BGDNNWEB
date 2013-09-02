(function($) {
	$(document).ready(function() {
		// ie fix for arrows		
		var html = "<style type=\"text/css\">\n";
		html += "\t.mj-slideshow-wrap:hover .mj-slideshow-arrow-next { opacity: 1; -ms-filter: \"progid:DXImageTransform.Microsoft.Alpha(Opacity=100)\"; -ms-filter: \"progid:DXImageTransform.Microsoft.gradient(startColorstr=#00FFFFFF,endColorstr=#00FFFFFF)progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='crop',src='modules/mod_mj-slideshow/images/arrow_next.png')\"; background: transparent\9; }\n";
		html += "\t.mj-slideshow-wrap:hover .mj-slideshow-arrow-prev { opacity: 1; -ms-filter: \"progid:DXImageTransform.Microsoft.Alpha(Opacity=100)\"; -ms-filter: \"progid:DXImageTransform.Microsoft.gradient(startColorstr=#00FFFFFF,endColorstr=#00FFFFFF)progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='crop',src='modules/mod_mj-slideshow/images/arrow_prev.png')\"; background: transparent\9; }\n";

		$('body').append(html);	
				
		// Variables and function specific to the "MJ-SLIDESHOW" slider
		var anim_order = new Array();
		anim_order = ["topleft", "topright", "bottomleft", "bottomright"];
		
		function setSlidesPositionData() {
			var pos = 0;
			slides.each(function() {
				if ($(this).attr('id') != 'mj-slideshow-slide-1') {
					if (anim_order[pos] == 'topleft') {
						$(this).find('.mj-slideshow-image').css({ "margin-left" : -sliderHeight, "margin-top" : -sliderWidth });
						$(this).find('.mj-slideshow-text').css({ "margin-left" : sliderHeight, "margin-top" : sliderWidth });
						$(this).data({ x : -sliderHeight, y : -sliderWidth });
					}
					if (anim_order[pos] == 'topright') {
						$(this).find('.mj-slideshow-image').css({ "margin-left" : sliderHeight, "margin-top" : -sliderWidth });
						$(this).find('.mj-slideshow-text').css({ "margin-left" : -sliderHeight, "margin-top" : sliderWidth });
						$(this).data({ x : sliderHeight, y : -sliderWidth });
					}
					if (anim_order[pos] == 'bottomleft') {
						$(this).find('.mj-slideshow-image').css({ "margin-left" : -sliderHeight, "margin-top" : sliderWidth });
						$(this).find('.mj-slideshow-text').css({ "margin-left" : sliderHeight, "margin-top" : -sliderWidth });
						$(this).data({ x : -sliderHeight, y : sliderWidth });
					}
					if (anim_order[pos] == 'bottomright') {
						$(this).find('.mj-slideshow-image').css({ "margin-left" : sliderHeight, "margin-top" : sliderWidth });
						$(this).find('.mj-slideshow-text').css({ "margin-left" : -sliderHeight, "margin-top" : -sliderWidth });
						$(this).data({ x : sliderHeight, y : sliderWidth });
					}			
				} else {
					$(this).data({ x : -sliderHeight, y : -sliderWidth });
				}
				pos++;
				if (pos == slides.length) {
					pos = 0;
				}
			});
		}
		
		
		
		function transitionIn(index) {
			var slide = $(slides[index]);
			
			$(slides).css({ "z-index" : 0 });
			slide.css({ "z-index" : 99 });
			slide.find('.mj-slideshow-text').animate({ "margin-left" : 0, "margin-top" : 0 }, transition_duration);
			slide.find('.mj-slideshow-image').animate({ "margin-left" : 0, "margin-top" : 0 }, transition_duration);
		}
		function transitionOut(index) {
			var slide = $(slides[index]);
			
			slide.find('.mj-slideshow-text').animate({ "margin-left" : slide.data('x'), "margin-top" : slide.data('y') }, transition_duration);
			slide.find('.mj-slideshow-image').animate({ "margin-left" : -slide.data('x'), "margin-top" : -slide.data('y') }, transition_duration);
		}
		
		// ----------------------------------------------------------
		
		
		var interval, wrapper, slides, currentSlideIndex=0, sliderWidth, sliderHeight, slideDuration = 4000, transition_duration = 1000;
		var arrowsNext, arrowsPrev;
		var pagers;
		var playButton;
		
		init();
		events();
		setSlidesPositionData();
		startInterval();
		
		function events() {
			
			arrowsNext.on('click', function() {
				pause();
				goForward();
			});
			arrowsPrev.on('click', function() {
				pause();
				goBackwards();
			});
			
			
			pagers.on('click', function() {
				pause();
				goAt(parseInt($(this).attr('id').replace('mj-slideshow-pager-', ''))-1);
			});
			
			
			playButton.on('click', function() {
				startInterval();
				playButton.animate({ "opacity" : 1 }, 400);
			});
			
		}
		function init() {
			// Init the vars that will hold the references to the DOM elements.
			wrapper = $('.mj-slideshow-wrap');
			slides = $('.mj-slideshow-slide');
			
			pagers = $('.mj-slideshow-pager');
			
			
			arrowsNext = $('.mj-slideshow-arrow-next');
			arrowsPrev = $('.mj-slideshow-arrow-prev');
			
			playButton = $('.mj-slideshow-play');
			sliderWidth = $('.mj-slideshow-wrap').width();
			sliderHeight = $('.mj-slideshow-wrap').height();
			
			
			// Hide all arrows except for the first two. Only two arrows are needed in the JS version!
			arrowsNext.not(arrowsNext.first()).hide();
			arrowsPrev.not(arrowsPrev.first()).hide();
			
			
			
			// Set the first pager to active state.
			setActivePager(0);
			
			
			
			// Hide the play button.
			playButton.css({ "opacity" : 1 });
			
		}
		function startInterval() {
			clearInterval(interval);
			
			interval = setInterval(function() {
				goForward();
			}, slideDuration);
		}
		function pause() {
			clearInterval(interval);
			
			
			playButton.animate({ "opacity" : 1 }, 400);
			
		}
		function goForward() {
			// Transition out the old slide, update the index variable with the new slide's index and transition the new slide in.
			transitionOut(currentSlideIndex);
			currentSlideIndex = (currentSlideIndex == slides.length-1) ? 0 : currentSlideIndex+1;
			transitionIn(currentSlideIndex);
			
			updateUI();
		}
		function goBackwards() {
			// Transition out the old slide, update the index variable with the new slide's index and transition the new slide in.
			transitionOut(currentSlideIndex);
			currentSlideIndex = (currentSlideIndex == 0) ? slides.length-1 : currentSlideIndex-1;
			transitionIn(currentSlideIndex);
			
			updateUI();
		}
		function goAt(index) {
			transitionOut(currentSlideIndex);
			currentSlideIndex = index;
			transitionIn(currentSlideIndex);
			
			updateUI();
		}
		
		function updateUI() {
			setActivePager(currentSlideIndex);
			
		}
		
		
		function setActivePager(index) {
			pagers.css({ "background" : '#ccc' });
			$(pagers[index]).css({ "background" : '#888' });
		}
		
	});
})(jQuery);