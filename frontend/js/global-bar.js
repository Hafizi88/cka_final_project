var scriptData;
var scriptData2;
var currentSite;
var scriptTagline;
//get domain name of current site
var domain = window.location.hostname;  // E.g. 'starproperty.my';
var scripts = document.getElementsByTagName('script');
for(var i = 0, l = scripts.length; i < l; i++) {
	if (location.protocol == 'https:') {
		if(scripts[i].src === 'https://s3-ap-southeast-1.amazonaws.com/clips.thestar.com.my/globalbar/global-bar.js') {
			scriptData = scripts[i].getAttribute('tgflag');
			scriptData2 = scripts[i].getAttribute('tgtext');
			break;
		}
	} else {
		if(scripts[i].src === 'http://clips.thestar.com.my/globalbar/global-bar.js') {
			scriptData = scripts[i].getAttribute('tgflag');
			scriptData2 = scripts[i].getAttribute('tgtext');
			break;
		}
		else if(scripts[i].src === 'http://clips.thestar.com.my/globalbar/global-bar.min.js') {
			scriptData = scripts[i].getAttribute('tgflag');
			scriptData2 = scripts[i].getAttribute('tgtext');
			break;
		}
		else if(scripts[i].src === 'https://s3-ap-southeast-1.amazonaws.com/clips.thestar.com.my/globalbar/global-bar.js') {
			scriptData = scripts[i].getAttribute('tgflag');
			scriptData2 = scripts[i].getAttribute('tgtext');
			break;
		}
	}
}

if (scriptData == '0') {
	if(scriptData2 != null) {
		scriptTagline = scriptData2;
	} else {
		scriptTagline = '';
	}
} else {
	if (domain.indexOf("www.thestar.com.my") == 0) {
		scriptTagline = 'UPDATED EVERY <b>5</b> MINUTES';
	} else {
		scriptTagline = '';
	}
}

if (domain.indexOf("redtomato.com.my") > -1)
{
	
}
else if (location.protocol == 'https:') {
    document.write('<script type=""text/javascript"" src="'+"https://s3-ap-southeast-1.amazonaws.com/clips.thestar.com.my/globalbar/config.min.js"+'"></scr'+'ipt>')
    document.write('<script type=""text/javascript"" src="' + "https://s3-ap-southeast-1.amazonaws.com/clips.thestar.com.my/globalbar/bar.min.js" + '"></scr' + 'ipt>')
} 
else {
    document.write('<script type=""text/javascript"" src="' + "http://clips.thestar.com.my/globalbar/config.min.js" + '"></scr' + 'ipt>')
    document.write('<script type=""text/javascript"" src="' + "http://clips.thestar.com.my/globalbar/bar.min.js" + '"></scr' + 'ipt>')
}
