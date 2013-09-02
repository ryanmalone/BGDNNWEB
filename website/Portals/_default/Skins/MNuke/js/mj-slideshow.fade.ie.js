(function($) {
	$(document).ready(function() {	
		// ie fix for arrows		
		var html = "<style type=\"text/css\">\n";
		html += "\t.mj-slideshow-wrap:hover .mj-slideshow-arrow-next { opacity: 1; -ms-filter: \"progid:DXImageTransform.Microsoft.Alpha(Opacity=100)\"; -ms-filter: \"progid:DXImageTransform.Microsoft.gradient(startColorstr=#00FFFFFF,endColorstr=#00FFFFFF)progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='crop',src='modules/mod_mj-slideshow/images/arrow_next.png')\"; background: transparent\9; }\n";
		html += "\t.mj-slideshow-wrap:hover .mj-slideshow-arrow-prev { opacity: 1; -ms-filter: \"progid:DXImageTransform.Microsoft.Alpha(Opacity=100)\"; -ms-filter: \"progid:DXImageTransform.Microsoft.gradient(startColorstr=#00FFFFFF,endColorstr=#00FFFFFF)progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='crop',src='modules/mod_mj-slideshow/images/arrow_prev.png')\"; background: transparent\9; }\n";

		$('body').append(html);
			
		var interval, wrapper, slides, currentSlideIndex=0, sliderWidth, sliderHeight, slideDuration=[time_per_slide], transition_duration=[transition_duration];
		[arrows][arrows_start]var arrowsNext, arrowsPrev;[arrows]
		[pagers][pagers_start]var pagers;[pagers]
		[play][play_start]var playButton;[play]
				
		init();
		events();
		startInterval();

		// ----------------------------------------------------------
		// Variables and function specific to the "transforms" slider
		var direction=0;
		
		// Start the effect on the first slide.
		$('.mj-slideshow-slide').css({ "z-index" : 1, "opacity" : 0 });
		$('#mj-slideshow-slide-1').css({ "z-index" : 99, "opacity" : 1 });
		
		function transitionIn(index) {
			var slide = $(slides[index]);
			$('.mj-slideshow-slide').css({ "z-index" : 1 });
			slide.css({ "z-index" : 99 }).stop().animate({ "opacity" : 1 }, 500);
		}
		function transitionOut(index) {
			var slide = $(slides[index]);
			setTimeout(function() {
				slide.css({ "opacity" : 0 });
			}, 500);
		}
		// ----------------------------------------------------------

		function events() {
			[arrows][arrows_start]
			arrowsNext.on('click', function() {
				pause();
				goForward();
			});
			arrowsPrev.on('click', function() {
				pause();
				goBackwards();
			});
			[arrows]
			[pagers][pagers_start]
			pagers.on('click', function() {
				pause();
				goAt(parseInt($(this).attr('id').replace('mj-slideshow-pager-', ''))-1);
			});
			[pagers]
			[play][play_start]
			playButton.on('click', function() {
				startInterval();
				playButton.animate({ "opacity" : 0 }, 400);
			});
			[play]
		}
		function init() {
			// Init the vars that will hold the references to the DOM elements.
			wrapper = $('.mj-slideshow-wrap');
			slides = $('.mj-slideshow-slide');
			[pagers][pagers_start]
			pagers = $('.mj-slideshow-pager');
			[pagers]
			[arrows][arrows_start]
			arrowsNext = $('.mj-slideshow-arrow-next');
			arrowsPrev = $('.mj-slideshow-arrow-prev');
			[arrows]
			[play][play_start]playButton = $('.mj-slideshow-play');[play]
			sliderWidth = $('.mj-slideshow-wrap').width();
			sliderHeight = $('.mj-slideshow-wrap').height();

			[arrows][arrows_start]
			// Hide all arrows except for the first two. Only two arrows are needed in the JS version!
			arrowsNext.not(arrowsNext.first()).hide();
			arrowsPrev.not(arrowsPrev.first()).hide();
			[arrows]

			[pagers][pagers_start]
			// Set the first pager to active state.
			setActivePager(0);
			[pagers]

			[play][play_start]
			// Hide the play button.
			playButton.css({ "opacity" : 0 });
			[play]
		}
		function startInterval() {
			clearInterval(interval);

			interval = setInterval(function() {
				goForward();
			}, slideDuration);
		}
		function pause() {
			clearInterval(interval);

			[play][play_start]
			playButton.animate({ "opacity" : 1 }, 400);
			[play]
		}
		function goForward() {
			// Transition out the old slide, update the index variable with the new slide's index and transition the new slide in.
			transitionOut(currentSlideIndex);
			currentSlideIndex = (currentSlideIndex == slides.length-1) ? 0 : currentSlideIndex+1;
			transitionIn(currentSlideIndex);

			[pagers][pagers_start]updateUI();[pagers]
		}
		function goBackwards() {
			// Transition out the old slide, update the index variable with the new slide's index and transition the new slide in.
			transitionOut(currentSlideIndex);
			currentSlideIndex = (currentSlideIndex == 0) ? slides.length-1 : currentSlideIndex-1;
			transitionIn(currentSlideIndex);

			[pagers][pagers_start]updateUI();[pagers]
		}
		function goAt(index) {
			transitionOut(currentSlideIndex);
			currentSlideIndex = index;
			transitionIn(currentSlideIndex);

			[pagers][pagers_start]updateUI();[pagers]
		}
		[pagers][pagers_start]
		function updateUI() {
			setActivePager(currentSlideIndex);

		}
		[pagers]
		[pagers][pagers_start]
		function setActivePager(index) {
			pagers.css({ "background" : '#ccc' });
			$(pagers[index]).css({ "background" : '#888' });
		}
		[pagers]
	});
})(jQuery);