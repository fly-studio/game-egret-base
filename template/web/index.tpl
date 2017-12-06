<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <title>Egret</title>
    <meta name="viewport" content="width=device-width,initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="full-screen" content="true" />
    <meta name="screen-orientation" content="portrait" />
    <meta name="x5-fullscreen" content="true" />
    <meta name="360-fullscreen" content="true" />
    <style>
        html, body {
            -ms-touch-action: none;
            background: #888888;
            padding: 0;
            border: 0;
            margin: 0;
            height: 100%;
        }
    </style>
	<script>
    var baseURI = '<{''|url nofilter}>/'; // ends with /
	var resURI = '<{'img/XXXXX'|static nofilter}>/'; // ends with /
    </script>
</head>

<body>
    <div style="margin: auto;width: 100%;height: 100%;" class="egret-player"
         data-entry-class="Main"
         data-orientation="auto"
         data-scale-mode="showAll"
         data-frame-rate="30"
         data-content-width="640"
         data-content-height="1136"
         data-show-paint-rect="false"
         data-multi-fingered="2"
         data-show-fps="false" data-show-log="false"
         data-show-fps-style="x:0,y:0,size:12,textColor:0xffffff,bgAlpha:0.9">
    </div>
<script>
    document.querySelector('.egret-player').dataset.scaleMode = typeof window.orientation !== 'undefined' ? 'fixedNarrow' : 'showAll';
    var loadScript = function (list, callback) {
        var loaded = 0;
        var loadNext = function () {
            loadSingleScript(list[loaded], function () {
                loaded++;
                if (loaded >= list.length) {
                    callback();
                }
                else {
                    loadNext();
                }
            })
        };
        loadNext();
    };

    var loadSingleScript = function (src, callback) {
        var s = document.createElement('script');
        s.async = false;
        s.src = src;
        s.addEventListener('load', function () {
            s.parentNode.removeChild(s);
            s.removeEventListener('load', arguments.callee, false);
            callback();
        }, false);
        document.body.appendChild(s);
    };

	var list = [
		"<{'js/game/egret/v5.0/egret.min.js'|static nofilter}>",
		"<{'js/game/egret/v5.0/egret.web.min.js'|static nofilter}>",
		"<{'js/game/egret/v5.0/game.min.js'|static nofilter}>",
		"<{'js/game/egret/v5.0/res.min.js'|static nofilter}>",
		"<{'js/game/egret/v5.0/tween.min.js'|static nofilter}>",
		"<{'js/game/egret/v5.0/eui.min.js'|static nofilter}>",
		"<{'js/es/promise.min.js'|static nofilter}>",
		"<{'js/lodash/lodash.min.js'|static nofilter}>",
		"<{'js/axios/axios.min.js'|static nofilter}>",
		"<{'js/game/_.min.js'|static nofilter}>",
		"<{'js/game/egret/layer.min.js'|static nofilter}>",
		"Your Main JS"
	];
	loadScript(list, function () {
		/**
			* {
			* "renderMode":, //Engine rendering mode, "canvas" or "webgl"
			* "audioType": 0 //Use the audio type, 0: default, 2: web audio, 3: audio
			* "antialias": //Whether the anti-aliasing is enabled in WebGL mode, true: on, false: off, defaults to false
			* "calculateCanvasScaleFactor": //a function return canvas scale factor
			* }
			**/
		egret.runEgret({ renderMode: "webgl", audioType: 0, calculateCanvasScaleFactor:function(context) {
			var backingStore = context.backingStorePixelRatio ||
				context.webkitBackingStorePixelRatio ||
				context.mozBackingStorePixelRatio ||
				context.msBackingStorePixelRatio ||
				context.oBackingStorePixelRatio ||
				context.backingStorePixelRatio || 1;
			return (window.devicePixelRatio || 1) / backingStore;
		}});
	});
</script>
</body>

</html>