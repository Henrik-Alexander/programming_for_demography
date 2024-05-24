import urllib
url = 'https://www.opendata-hro.de/api/3/action/datastore_search?resource_id=92890912-bf49-4f83-b1ed-7a74e3c3722f&limit=5&q=title:jones'  
fileobj = urllib.response(url)
print fileobj.read()
