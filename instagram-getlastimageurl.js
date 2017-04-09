var page = require('webpage').create(),
	system = require('system'),
	account = 'default',
	url,
	image_url

if (system.args.length === 2){
	account = system.args[1]
}
url = 'instagram.com/' + account

page.open('https://' + url, function(status) {
	if (status === 'success'){
		image_url = page.evaluate(function() {
			return window.pImage_0.src;
		})
		console.log(image_url)
	} else {
		console.log('Fail to open ' + url)
	}
	phantom.exit()
})


