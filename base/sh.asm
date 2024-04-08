
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	push   -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 04             	sub    $0x4,%esp
  static char buf[100];
  int fd;
	int count = 0;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      11:	eb 0e                	jmp    21 <main+0x21>
      13:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      17:	90                   	nop
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f 91 00 00 00    	jg     b2 <main+0xb2>
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 40 14 00 00       	push   $0x1440
      2b:	e8 03 0f 00 00       	call   f33 <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	eb 29                	jmp    62 <main+0x62>
      39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      40:	80 3d 42 1b 00 00 20 	cmpb   $0x20,0x1b42
      47:	0f 84 a1 00 00 00    	je     ee <main+0xee>
      4d:	8d 76 00             	lea    0x0(%esi),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
      50:	e8 96 0e 00 00       	call   eeb <fork>
  if(pid == -1)
      55:	83 f8 ff             	cmp    $0xffffffff,%eax
      58:	0f 84 eb 00 00 00    	je     149 <main+0x149>
    if(fork1() == 0){
      5e:	85 c0                	test   %eax,%eax
      60:	74 5e                	je     c0 <main+0xc0>
  printf(2, "$ ");
      62:	83 ec 08             	sub    $0x8,%esp
      65:	68 a2 13 00 00       	push   $0x13a2
      6a:	6a 02                	push   $0x2
      6c:	e8 ef 0f 00 00       	call   1060 <printf>
  memset(buf, 0, nbuf);
      71:	83 c4 0c             	add    $0xc,%esp
      74:	6a 64                	push   $0x64
      76:	6a 00                	push   $0x0
      78:	68 40 1b 00 00       	push   $0x1b40
      7d:	e8 ee 0c 00 00       	call   d70 <memset>
  gets(buf, nbuf);
      82:	58                   	pop    %eax
      83:	5a                   	pop    %edx
      84:	6a 64                	push   $0x64
      86:	68 40 1b 00 00       	push   $0x1b40
      8b:	e8 40 0d 00 00       	call   dd0 <gets>
  if(buf[0] == 0) // EOF
      90:	0f b6 05 40 1b 00 00 	movzbl 0x1b40,%eax
      97:	83 c4 10             	add    $0x10,%esp
      9a:	84 c0                	test   %al,%al
      9c:	74 0f                	je     ad <main+0xad>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      9e:	3c 63                	cmp    $0x63,%al
      a0:	75 ae                	jne    50 <main+0x50>
      a2:	80 3d 41 1b 00 00 64 	cmpb   $0x64,0x1b41
      a9:	75 a5                	jne    50 <main+0x50>
      ab:	eb 93                	jmp    40 <main+0x40>
  exit();
      ad:	e8 41 0e 00 00       	call   ef3 <exit>
      close(fd);
      b2:	83 ec 0c             	sub    $0xc,%esp
      b5:	50                   	push   %eax
      b6:	e8 60 0e 00 00       	call   f1b <close>
      break;
      bb:	83 c4 10             	add    $0x10,%esp
      be:	eb a2                	jmp    62 <main+0x62>
	    int is_hist =  strncmp(buf, "hist", 4);
      c0:	51                   	push   %ecx
      c1:	6a 04                	push   $0x4
      c3:	68 56 14 00 00       	push   $0x1456
      c8:	68 40 1b 00 00       	push   $0x1b40
      cd:	e8 1e 04 00 00       	call   4f0 <strncmp>
      d2:	83 c4 10             	add    $0x10,%esp
	    if(is_hist == 0){
      d5:	85 c0                	test   %eax,%eax
      d7:	74 5a                	je     133 <main+0x133>
      runcmd(parsecmd(buf));
      d9:	83 ec 0c             	sub    $0xc,%esp
      dc:	68 40 1b 00 00       	push   $0x1b40
      e1:	e8 5a 0b 00 00       	call   c40 <parsecmd>
      e6:	89 04 24             	mov    %eax,(%esp)
      e9:	e8 42 01 00 00       	call   230 <runcmd>
      buf[strlen(buf)-1] = 0;  // chop \n
      ee:	83 ec 0c             	sub    $0xc,%esp
      f1:	68 40 1b 00 00       	push   $0x1b40
      f6:	e8 45 0c 00 00       	call   d40 <strlen>
      if(chdir(buf+3) < 0)
      fb:	c7 04 24 43 1b 00 00 	movl   $0x1b43,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
     102:	c6 80 3f 1b 00 00 00 	movb   $0x0,0x1b3f(%eax)
      if(chdir(buf+3) < 0)
     109:	e8 55 0e 00 00       	call   f63 <chdir>
     10e:	83 c4 10             	add    $0x10,%esp
     111:	85 c0                	test   %eax,%eax
     113:	0f 89 49 ff ff ff    	jns    62 <main+0x62>
        printf(2, "cannot cd %s\n", buf+3);
     119:	50                   	push   %eax
     11a:	68 43 1b 00 00       	push   $0x1b43
     11f:	68 48 14 00 00       	push   $0x1448
     124:	6a 02                	push   $0x2
     126:	e8 35 0f 00 00       	call   1060 <printf>
     12b:	83 c4 10             	add    $0x10,%esp
     12e:	e9 2f ff ff ff       	jmp    62 <main+0x62>
		    hist(buf);
     133:	b8 40 1b 00 00       	mov    $0x1b40,%eax
     138:	83 ec 0c             	sub    $0xc,%esp
     13b:	0f be c0             	movsbl %al,%eax
     13e:	50                   	push   %eax
     13f:	e8 1c 00 00 00       	call   160 <hist>
     144:	83 c4 10             	add    $0x10,%esp
     147:	eb 90                	jmp    d9 <main+0xd9>
    panic("fork");
     149:	83 ec 0c             	sub    $0xc,%esp
     14c:	68 a5 13 00 00       	push   $0x13a5
     151:	e8 9a 00 00 00       	call   1f0 <panic>
     156:	66 90                	xchg   %ax,%ax
     158:	66 90                	xchg   %ax,%ax
     15a:	66 90                	xchg   %ax,%ax
     15c:	66 90                	xchg   %ax,%ax
     15e:	66 90                	xchg   %ax,%ax

00000160 <hist>:
int hist (char input){
     160:	55                   	push   %ebp
     161:	89 e5                	mov    %esp,%ebp
     163:	53                   	push   %ebx
	for(int i; i < 10 ; i++){
     164:	31 db                	xor    %ebx,%ebx
int hist (char input){
     166:	83 ec 04             	sub    $0x4,%esp
     169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		printf(2, "Previous command %d : %s\n", i + 1, command_history[i]);
     170:	0f be 83 20 1b 00 00 	movsbl 0x1b20(%ebx),%eax
     177:	83 c3 01             	add    $0x1,%ebx
     17a:	50                   	push   %eax
     17b:	53                   	push   %ebx
     17c:	68 88 13 00 00       	push   $0x1388
     181:	6a 02                	push   $0x2
     183:	e8 d8 0e 00 00       	call   1060 <printf>
	for(int i; i < 10 ; i++){
     188:	83 c4 10             	add    $0x10,%esp
     18b:	83 fb 0a             	cmp    $0xa,%ebx
     18e:	75 e0                	jne    170 <hist+0x10>
}
     190:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     193:	c9                   	leave
     194:	c3                   	ret
     195:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001a0 <add_to_hist>:
}
     1a0:	c3                   	ret
     1a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1af:	90                   	nop

000001b0 <getcmd>:
{
     1b0:	55                   	push   %ebp
     1b1:	89 e5                	mov    %esp,%ebp
     1b3:	56                   	push   %esi
     1b4:	53                   	push   %ebx
     1b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
     1b8:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     1bb:	83 ec 08             	sub    $0x8,%esp
     1be:	68 a2 13 00 00       	push   $0x13a2
     1c3:	6a 02                	push   $0x2
     1c5:	e8 96 0e 00 00       	call   1060 <printf>
  memset(buf, 0, nbuf);
     1ca:	83 c4 0c             	add    $0xc,%esp
     1cd:	56                   	push   %esi
     1ce:	6a 00                	push   $0x0
     1d0:	53                   	push   %ebx
     1d1:	e8 9a 0b 00 00       	call   d70 <memset>
  gets(buf, nbuf);
     1d6:	58                   	pop    %eax
     1d7:	5a                   	pop    %edx
     1d8:	56                   	push   %esi
     1d9:	53                   	push   %ebx
     1da:	e8 f1 0b 00 00       	call   dd0 <gets>
  if(buf[0] == 0) // EOF
     1df:	83 c4 10             	add    $0x10,%esp
     1e2:	80 3b 01             	cmpb   $0x1,(%ebx)
     1e5:	19 c0                	sbb    %eax,%eax
}
     1e7:	8d 65 f8             	lea    -0x8(%ebp),%esp
     1ea:	5b                   	pop    %ebx
     1eb:	5e                   	pop    %esi
     1ec:	5d                   	pop    %ebp
     1ed:	c3                   	ret
     1ee:	66 90                	xchg   %ax,%ax

000001f0 <panic>:
{
     1f0:	55                   	push   %ebp
     1f1:	89 e5                	mov    %esp,%ebp
     1f3:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     1f6:	ff 75 08             	push   0x8(%ebp)
     1f9:	68 9e 13 00 00       	push   $0x139e
     1fe:	6a 02                	push   $0x2
     200:	e8 5b 0e 00 00       	call   1060 <printf>
  exit();
     205:	e8 e9 0c 00 00       	call   ef3 <exit>
     20a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000210 <fork1>:
{
     210:	55                   	push   %ebp
     211:	89 e5                	mov    %esp,%ebp
     213:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     216:	e8 d0 0c 00 00       	call   eeb <fork>
  if(pid == -1)
     21b:	83 f8 ff             	cmp    $0xffffffff,%eax
     21e:	74 02                	je     222 <fork1+0x12>
  return pid;
}
     220:	c9                   	leave
     221:	c3                   	ret
    panic("fork");
     222:	83 ec 0c             	sub    $0xc,%esp
     225:	68 a5 13 00 00       	push   $0x13a5
     22a:	e8 c1 ff ff ff       	call   1f0 <panic>
     22f:	90                   	nop

00000230 <runcmd>:
{
     230:	55                   	push   %ebp
     231:	89 e5                	mov    %esp,%ebp
     233:	53                   	push   %ebx
     234:	83 ec 14             	sub    $0x14,%esp
     237:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     23a:	85 db                	test   %ebx,%ebx
     23c:	74 3a                	je     278 <runcmd+0x48>
  switch(cmd->type){
     23e:	83 3b 05             	cmpl   $0x5,(%ebx)
     241:	0f 87 f8 00 00 00    	ja     33f <runcmd+0x10f>
     247:	8b 03                	mov    (%ebx),%eax
     249:	ff 24 85 5c 14 00 00 	jmp    *0x145c(,%eax,4)
    if(ecmd->argv[0] == 0)
     250:	8b 43 04             	mov    0x4(%ebx),%eax
     253:	85 c0                	test   %eax,%eax
     255:	74 21                	je     278 <runcmd+0x48>
    exec(ecmd->argv[0], ecmd->argv);
     257:	8d 53 04             	lea    0x4(%ebx),%edx
     25a:	51                   	push   %ecx
     25b:	51                   	push   %ecx
     25c:	52                   	push   %edx
     25d:	50                   	push   %eax
     25e:	e8 c8 0c 00 00       	call   f2b <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     263:	83 c4 0c             	add    $0xc,%esp
     266:	ff 73 04             	push   0x4(%ebx)
     269:	68 b1 13 00 00       	push   $0x13b1
     26e:	6a 02                	push   $0x2
     270:	e8 eb 0d 00 00       	call   1060 <printf>
    break;
     275:	83 c4 10             	add    $0x10,%esp
    exit();
     278:	e8 76 0c 00 00       	call   ef3 <exit>
	runcmd(bcmd -> cmd);
     27d:	83 ec 0c             	sub    $0xc,%esp
     280:	ff 73 04             	push   0x4(%ebx)
     283:	e8 a8 ff ff ff       	call   230 <runcmd>
     if(fork1() ==0)
     288:	e8 83 ff ff ff       	call   210 <fork1>
     28d:	85 c0                	test   %eax,%eax
     28f:	0f 85 95 00 00 00    	jne    32a <runcmd+0xfa>
    if(lcmd->left){
     295:	8b 43 04             	mov    0x4(%ebx),%eax
     298:	85 c0                	test   %eax,%eax
     29a:	0f 84 8a 00 00 00    	je     32a <runcmd+0xfa>
	    runcmd(lcmd -> right);
     2a0:	83 ec 0c             	sub    $0xc,%esp
     2a3:	50                   	push   %eax
     2a4:	e8 87 ff ff ff       	call   230 <runcmd>
  close(rcmd -> fd);
     2a9:	83 ec 0c             	sub    $0xc,%esp
     2ac:	ff 73 14             	push   0x14(%ebx)
     2af:	e8 67 0c 00 00       	call   f1b <close>
   if(open(rcmd -> file , rcmd -> mode ) <0){
     2b4:	58                   	pop    %eax
     2b5:	5a                   	pop    %edx
     2b6:	ff 73 10             	push   0x10(%ebx)
     2b9:	ff 73 08             	push   0x8(%ebx)
     2bc:	e8 72 0c 00 00       	call   f33 <open>
     2c1:	83 c4 10             	add    $0x10,%esp
     2c4:	85 c0                	test   %eax,%eax
     2c6:	79 b5                	jns    27d <runcmd+0x4d>
	  printf(2, "open failes\n");
     2c8:	51                   	push   %ecx
     2c9:	51                   	push   %ecx
     2ca:	68 c1 13 00 00       	push   $0x13c1
     2cf:	6a 02                	push   $0x2
     2d1:	e8 8a 0d 00 00       	call   1060 <printf>
	   exit();
     2d6:	e8 18 0c 00 00       	call   ef3 <exit>
  if(pipe(p) < 0)
     2db:	83 ec 0c             	sub    $0xc,%esp
     2de:	8d 45 f0             	lea    -0x10(%ebp),%eax
     2e1:	50                   	push   %eax
     2e2:	e8 1c 0c 00 00       	call   f03 <pipe>
     2e7:	83 c4 10             	add    $0x10,%esp
     2ea:	85 c0                	test   %eax,%eax
     2ec:	78 5e                	js     34c <runcmd+0x11c>
  if(fork1() == 0){
     2ee:	e8 1d ff ff ff       	call   210 <fork1>
     2f3:	85 c0                	test   %eax,%eax
     2f5:	74 62                	je     359 <runcmd+0x129>
  if(fork1() == 0){
     2f7:	e8 14 ff ff ff       	call   210 <fork1>
     2fc:	85 c0                	test   %eax,%eax
     2fe:	0f 84 83 00 00 00    	je     387 <runcmd+0x157>
  close(p[0]);
     304:	83 ec 0c             	sub    $0xc,%esp
     307:	ff 75 f0             	push   -0x10(%ebp)
     30a:	e8 0c 0c 00 00       	call   f1b <close>
   close(p[1]);
     30f:	58                   	pop    %eax
     310:	ff 75 f4             	push   -0xc(%ebp)
     313:	e8 03 0c 00 00       	call   f1b <close>
  wait();
     318:	e8 de 0b 00 00       	call   efb <wait>
  wait();
     31d:	e8 d9 0b 00 00       	call   efb <wait>
    break;
     322:	83 c4 10             	add    $0x10,%esp
     325:	e9 4e ff ff ff       	jmp    278 <runcmd+0x48>
    wait();
     32a:	e8 cc 0b 00 00       	call   efb <wait>
    if(lcmd -> right){
     32f:	8b 43 08             	mov    0x8(%ebx),%eax
     332:	85 c0                	test   %eax,%eax
     334:	0f 85 66 ff ff ff    	jne    2a0 <runcmd+0x70>
     33a:	e9 39 ff ff ff       	jmp    278 <runcmd+0x48>
    panic("runcmd");
     33f:	83 ec 0c             	sub    $0xc,%esp
     342:	68 aa 13 00 00       	push   $0x13aa
     347:	e8 a4 fe ff ff       	call   1f0 <panic>
	  panic("pipe");
     34c:	83 ec 0c             	sub    $0xc,%esp
     34f:	68 ce 13 00 00       	push   $0x13ce
     354:	e8 97 fe ff ff       	call   1f0 <panic>
	  close(1);
     359:	83 ec 0c             	sub    $0xc,%esp
     35c:	6a 01                	push   $0x1
     35e:	e8 b8 0b 00 00       	call   f1b <close>
	  dup(p[1]);
     363:	58                   	pop    %eax
     364:	ff 75 f4             	push   -0xc(%ebp)
     367:	e8 ff 0b 00 00       	call   f6b <dup>
	  close(p[0]);
     36c:	58                   	pop    %eax
     36d:	ff 75 f0             	push   -0x10(%ebp)
     370:	e8 a6 0b 00 00       	call   f1b <close>
	  close(p[1]);
     375:	58                   	pop    %eax
     376:	ff 75 f4             	push   -0xc(%ebp)
     379:	e8 9d 0b 00 00       	call   f1b <close>
	  runcmd(pcmd -> left);
     37e:	5a                   	pop    %edx
     37f:	ff 73 04             	push   0x4(%ebx)
     382:	e8 a9 fe ff ff       	call   230 <runcmd>
	  close(0);
     387:	83 ec 0c             	sub    $0xc,%esp
     38a:	6a 00                	push   $0x0
     38c:	e8 8a 0b 00 00       	call   f1b <close>
	  dup(p[0]);
     391:	5a                   	pop    %edx
     392:	ff 75 f0             	push   -0x10(%ebp)
     395:	e8 d1 0b 00 00       	call   f6b <dup>
	  close(p[0]);
     39a:	59                   	pop    %ecx
     39b:	ff 75 f0             	push   -0x10(%ebp)
     39e:	e8 78 0b 00 00       	call   f1b <close>
	  close(p[1]);
     3a3:	58                   	pop    %eax
     3a4:	ff 75 f4             	push   -0xc(%ebp)
     3a7:	e8 6f 0b 00 00       	call   f1b <close>
	  runcmd(pcmd -> right);
     3ac:	58                   	pop    %eax
     3ad:	ff 73 08             	push   0x8(%ebx)
     3b0:	e8 7b fe ff ff       	call   230 <runcmd>
     3b5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003c0 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     3c0:	55                   	push   %ebp
     3c1:	89 e5                	mov    %esp,%ebp
     3c3:	53                   	push   %ebx
     3c4:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3c7:	6a 54                	push   $0x54
     3c9:	e8 d2 0e 00 00       	call   12a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3ce:	83 c4 0c             	add    $0xc,%esp
     3d1:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     3d3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3d5:	6a 00                	push   $0x0
     3d7:	50                   	push   %eax
     3d8:	e8 93 09 00 00       	call   d70 <memset>
  cmd->type = EXEC;
     3dd:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     3e3:	89 d8                	mov    %ebx,%eax
     3e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3e8:	c9                   	leave
     3e9:	c3                   	ret
     3ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003f0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     3f0:	55                   	push   %ebp
     3f1:	89 e5                	mov    %esp,%ebp
     3f3:	53                   	push   %ebx
     3f4:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3f7:	6a 18                	push   $0x18
     3f9:	e8 a2 0e 00 00       	call   12a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3fe:	83 c4 0c             	add    $0xc,%esp
     401:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     403:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     405:	6a 00                	push   $0x0
     407:	50                   	push   %eax
     408:	e8 63 09 00 00       	call   d70 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     40d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     410:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     416:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     419:	8b 45 0c             	mov    0xc(%ebp),%eax
     41c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     41f:	8b 45 10             	mov    0x10(%ebp),%eax
     422:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     425:	8b 45 14             	mov    0x14(%ebp),%eax
     428:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     42b:	8b 45 18             	mov    0x18(%ebp),%eax
     42e:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     431:	89 d8                	mov    %ebx,%eax
     433:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     436:	c9                   	leave
     437:	c3                   	ret
     438:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     43f:	90                   	nop

00000440 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     440:	55                   	push   %ebp
     441:	89 e5                	mov    %esp,%ebp
     443:	53                   	push   %ebx
     444:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     447:	6a 0c                	push   $0xc
     449:	e8 52 0e 00 00       	call   12a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     44e:	83 c4 0c             	add    $0xc,%esp
     451:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     453:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     455:	6a 00                	push   $0x0
     457:	50                   	push   %eax
     458:	e8 13 09 00 00       	call   d70 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     45d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     460:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     466:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     469:	8b 45 0c             	mov    0xc(%ebp),%eax
     46c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     46f:	89 d8                	mov    %ebx,%eax
     471:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     474:	c9                   	leave
     475:	c3                   	ret
     476:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     47d:	8d 76 00             	lea    0x0(%esi),%esi

00000480 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     480:	55                   	push   %ebp
     481:	89 e5                	mov    %esp,%ebp
     483:	53                   	push   %ebx
     484:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     487:	6a 0c                	push   $0xc
     489:	e8 12 0e 00 00       	call   12a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     48e:	83 c4 0c             	add    $0xc,%esp
     491:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     493:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     495:	6a 00                	push   $0x0
     497:	50                   	push   %eax
     498:	e8 d3 08 00 00       	call   d70 <memset>
  cmd->type = LIST;
  cmd->left = left;
     49d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     4a0:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     4a6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     4a9:	8b 45 0c             	mov    0xc(%ebp),%eax
     4ac:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     4af:	89 d8                	mov    %ebx,%eax
     4b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     4b4:	c9                   	leave
     4b5:	c3                   	ret
     4b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     4bd:	8d 76 00             	lea    0x0(%esi),%esi

000004c0 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     4c0:	55                   	push   %ebp
     4c1:	89 e5                	mov    %esp,%ebp
     4c3:	53                   	push   %ebx
     4c4:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4c7:	6a 08                	push   $0x8
     4c9:	e8 d2 0d 00 00       	call   12a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     4ce:	83 c4 0c             	add    $0xc,%esp
     4d1:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     4d3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     4d5:	6a 00                	push   $0x0
     4d7:	50                   	push   %eax
     4d8:	e8 93 08 00 00       	call   d70 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     4dd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     4e0:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     4e6:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     4e9:	89 d8                	mov    %ebx,%eax
     4eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     4ee:	c9                   	leave
     4ef:	c3                   	ret

000004f0 <strncmp>:
//PAGEBREAK!
// Parsing
int strncmp ( char *s1, char *s2, int n){
     4f0:	55                   	push   %ebp
     4f1:	89 e5                	mov    %esp,%ebp
     4f3:	56                   	push   %esi
     4f4:	53                   	push   %ebx
     4f5:	8b 45 10             	mov    0x10(%ebp),%eax
     4f8:	8b 55 08             	mov    0x8(%ebp),%edx
     4fb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
	while( n-- && *s1 && *s2 && *s1 == *s2){
     4fe:	8d 70 ff             	lea    -0x1(%eax),%esi
     501:	85 c0                	test   %eax,%eax
     503:	75 21                	jne    526 <strncmp+0x36>
     505:	eb 2b                	jmp    532 <strncmp+0x42>
     507:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     50e:	66 90                	xchg   %ax,%ax
     510:	0f b6 19             	movzbl (%ecx),%ebx
     513:	38 d8                	cmp    %bl,%al
     515:	75 16                	jne    52d <strncmp+0x3d>
     517:	84 db                	test   %bl,%bl
     519:	74 12                	je     52d <strncmp+0x3d>
		s1++;
     51b:	83 c2 01             	add    $0x1,%edx
		s2++;
     51e:	83 c1 01             	add    $0x1,%ecx
	while( n-- && *s1 && *s2 && *s1 == *s2){
     521:	83 ee 01             	sub    $0x1,%esi
     524:	72 1a                	jb     540 <strncmp+0x50>
     526:	0f b6 02             	movzbl (%edx),%eax
     529:	84 c0                	test   %al,%al
     52b:	75 e3                	jne    510 <strncmp+0x20>
     52d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
	}
	if(n == -1){return 0;}
	return -1;
}
     532:	5b                   	pop    %ebx
     533:	5e                   	pop    %esi
     534:	5d                   	pop    %ebp
     535:	c3                   	ret
     536:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     53d:	8d 76 00             	lea    0x0(%esi),%esi
     540:	5b                   	pop    %ebx
     541:	31 c0                	xor    %eax,%eax
     543:	5e                   	pop    %esi
     544:	5d                   	pop    %ebp
     545:	c3                   	ret
     546:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     54d:	8d 76 00             	lea    0x0(%esi),%esi

00000550 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     550:	55                   	push   %ebp
     551:	89 e5                	mov    %esp,%ebp
     553:	57                   	push   %edi
     554:	56                   	push   %esi
     555:	53                   	push   %ebx
     556:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     559:	8b 45 08             	mov    0x8(%ebp),%eax
{
     55c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     55f:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     562:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     564:	39 df                	cmp    %ebx,%edi
     566:	72 0f                	jb     577 <gettoken+0x27>
     568:	eb 25                	jmp    58f <gettoken+0x3f>
     56a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     570:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     573:	39 fb                	cmp    %edi,%ebx
     575:	74 18                	je     58f <gettoken+0x3f>
     577:	0f be 07             	movsbl (%edi),%eax
     57a:	83 ec 08             	sub    $0x8,%esp
     57d:	50                   	push   %eax
     57e:	68 10 1b 00 00       	push   $0x1b10
     583:	e8 08 08 00 00       	call   d90 <strchr>
     588:	83 c4 10             	add    $0x10,%esp
     58b:	85 c0                	test   %eax,%eax
     58d:	75 e1                	jne    570 <gettoken+0x20>
  if(q)
     58f:	85 f6                	test   %esi,%esi
     591:	74 02                	je     595 <gettoken+0x45>
    *q = s;
     593:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     595:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
     598:	3c 3c                	cmp    $0x3c,%al
     59a:	0f 8f d0 00 00 00    	jg     670 <gettoken+0x120>
     5a0:	3c 3a                	cmp    $0x3a,%al
     5a2:	0f 8f bc 00 00 00    	jg     664 <gettoken+0x114>
     5a8:	84 c0                	test   %al,%al
     5aa:	75 44                	jne    5f0 <gettoken+0xa0>
     5ac:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     5ae:	8b 4d 14             	mov    0x14(%ebp),%ecx
     5b1:	85 c9                	test   %ecx,%ecx
     5b3:	74 05                	je     5ba <gettoken+0x6a>
    *eq = s;
     5b5:	8b 45 14             	mov    0x14(%ebp),%eax
     5b8:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     5ba:	39 df                	cmp    %ebx,%edi
     5bc:	72 09                	jb     5c7 <gettoken+0x77>
     5be:	eb 1f                	jmp    5df <gettoken+0x8f>
    s++;
     5c0:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     5c3:	39 fb                	cmp    %edi,%ebx
     5c5:	74 18                	je     5df <gettoken+0x8f>
     5c7:	0f be 07             	movsbl (%edi),%eax
     5ca:	83 ec 08             	sub    $0x8,%esp
     5cd:	50                   	push   %eax
     5ce:	68 10 1b 00 00       	push   $0x1b10
     5d3:	e8 b8 07 00 00       	call   d90 <strchr>
     5d8:	83 c4 10             	add    $0x10,%esp
     5db:	85 c0                	test   %eax,%eax
     5dd:	75 e1                	jne    5c0 <gettoken+0x70>
  *ps = s;
     5df:	8b 45 08             	mov    0x8(%ebp),%eax
     5e2:	89 38                	mov    %edi,(%eax)
  return ret;
}
     5e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5e7:	89 f0                	mov    %esi,%eax
     5e9:	5b                   	pop    %ebx
     5ea:	5e                   	pop    %esi
     5eb:	5f                   	pop    %edi
     5ec:	5d                   	pop    %ebp
     5ed:	c3                   	ret
     5ee:	66 90                	xchg   %ax,%ax
  switch(*s){
     5f0:	79 66                	jns    658 <gettoken+0x108>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5f2:	39 df                	cmp    %ebx,%edi
     5f4:	72 39                	jb     62f <gettoken+0xdf>
  if(eq)
     5f6:	8b 55 14             	mov    0x14(%ebp),%edx
     5f9:	85 d2                	test   %edx,%edx
     5fb:	0f 84 b3 00 00 00    	je     6b4 <gettoken+0x164>
    *eq = s;
     601:	8b 45 14             	mov    0x14(%ebp),%eax
     604:	89 38                	mov    %edi,(%eax)
  while(s < es && strchr(whitespace, *s))
     606:	e9 a9 00 00 00       	jmp    6b4 <gettoken+0x164>
     60b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     60f:	90                   	nop
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     610:	0f be 07             	movsbl (%edi),%eax
     613:	83 ec 08             	sub    $0x8,%esp
     616:	50                   	push   %eax
     617:	68 08 1b 00 00       	push   $0x1b08
     61c:	e8 6f 07 00 00       	call   d90 <strchr>
     621:	83 c4 10             	add    $0x10,%esp
     624:	85 c0                	test   %eax,%eax
     626:	75 1f                	jne    647 <gettoken+0xf7>
      s++;
     628:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     62b:	39 fb                	cmp    %edi,%ebx
     62d:	74 77                	je     6a6 <gettoken+0x156>
     62f:	0f be 07             	movsbl (%edi),%eax
     632:	83 ec 08             	sub    $0x8,%esp
     635:	50                   	push   %eax
     636:	68 10 1b 00 00       	push   $0x1b10
     63b:	e8 50 07 00 00       	call   d90 <strchr>
     640:	83 c4 10             	add    $0x10,%esp
     643:	85 c0                	test   %eax,%eax
     645:	74 c9                	je     610 <gettoken+0xc0>
    ret = 'a';
     647:	be 61 00 00 00       	mov    $0x61,%esi
     64c:	e9 5d ff ff ff       	jmp    5ae <gettoken+0x5e>
     651:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     658:	3c 26                	cmp    $0x26,%al
     65a:	74 08                	je     664 <gettoken+0x114>
     65c:	8d 48 d8             	lea    -0x28(%eax),%ecx
     65f:	80 f9 01             	cmp    $0x1,%cl
     662:	77 8e                	ja     5f2 <gettoken+0xa2>
  ret = *s;
     664:	0f be f0             	movsbl %al,%esi
    s++;
     667:	83 c7 01             	add    $0x1,%edi
    break;
     66a:	e9 3f ff ff ff       	jmp    5ae <gettoken+0x5e>
     66f:	90                   	nop
  switch(*s){
     670:	3c 3e                	cmp    $0x3e,%al
     672:	75 1c                	jne    690 <gettoken+0x140>
    if(*s == '>'){
     674:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     678:	74 1f                	je     699 <gettoken+0x149>
    s++;
     67a:	83 c7 01             	add    $0x1,%edi
  ret = *s;
     67d:	be 3e 00 00 00       	mov    $0x3e,%esi
     682:	e9 27 ff ff ff       	jmp    5ae <gettoken+0x5e>
     687:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     68e:	66 90                	xchg   %ax,%ax
  switch(*s){
     690:	3c 7c                	cmp    $0x7c,%al
     692:	74 d0                	je     664 <gettoken+0x114>
     694:	e9 59 ff ff ff       	jmp    5f2 <gettoken+0xa2>
      s++;
     699:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     69c:	be 2b 00 00 00       	mov    $0x2b,%esi
     6a1:	e9 08 ff ff ff       	jmp    5ae <gettoken+0x5e>
  if(eq)
     6a6:	8b 45 14             	mov    0x14(%ebp),%eax
     6a9:	85 c0                	test   %eax,%eax
     6ab:	74 05                	je     6b2 <gettoken+0x162>
    *eq = s;
     6ad:	8b 45 14             	mov    0x14(%ebp),%eax
     6b0:	89 18                	mov    %ebx,(%eax)
      s++;
     6b2:	89 df                	mov    %ebx,%edi
    ret = 'a';
     6b4:	be 61 00 00 00       	mov    $0x61,%esi
     6b9:	e9 21 ff ff ff       	jmp    5df <gettoken+0x8f>
     6be:	66 90                	xchg   %ax,%ax

000006c0 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     6c0:	55                   	push   %ebp
     6c1:	89 e5                	mov    %esp,%ebp
     6c3:	57                   	push   %edi
     6c4:	56                   	push   %esi
     6c5:	53                   	push   %ebx
     6c6:	83 ec 0c             	sub    $0xc,%esp
     6c9:	8b 7d 08             	mov    0x8(%ebp),%edi
     6cc:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     6cf:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     6d1:	39 f3                	cmp    %esi,%ebx
     6d3:	72 12                	jb     6e7 <peek+0x27>
     6d5:	eb 28                	jmp    6ff <peek+0x3f>
     6d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6de:	66 90                	xchg   %ax,%ax
    s++;
     6e0:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     6e3:	39 de                	cmp    %ebx,%esi
     6e5:	74 18                	je     6ff <peek+0x3f>
     6e7:	0f be 03             	movsbl (%ebx),%eax
     6ea:	83 ec 08             	sub    $0x8,%esp
     6ed:	50                   	push   %eax
     6ee:	68 10 1b 00 00       	push   $0x1b10
     6f3:	e8 98 06 00 00       	call   d90 <strchr>
     6f8:	83 c4 10             	add    $0x10,%esp
     6fb:	85 c0                	test   %eax,%eax
     6fd:	75 e1                	jne    6e0 <peek+0x20>
  *ps = s;
     6ff:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     701:	0f be 03             	movsbl (%ebx),%eax
     704:	31 d2                	xor    %edx,%edx
     706:	84 c0                	test   %al,%al
     708:	75 0e                	jne    718 <peek+0x58>
}
     70a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     70d:	89 d0                	mov    %edx,%eax
     70f:	5b                   	pop    %ebx
     710:	5e                   	pop    %esi
     711:	5f                   	pop    %edi
     712:	5d                   	pop    %ebp
     713:	c3                   	ret
     714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     718:	83 ec 08             	sub    $0x8,%esp
     71b:	50                   	push   %eax
     71c:	ff 75 10             	push   0x10(%ebp)
     71f:	e8 6c 06 00 00       	call   d90 <strchr>
     724:	83 c4 10             	add    $0x10,%esp
     727:	31 d2                	xor    %edx,%edx
     729:	85 c0                	test   %eax,%eax
     72b:	0f 95 c2             	setne  %dl
}
     72e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     731:	5b                   	pop    %ebx
     732:	89 d0                	mov    %edx,%eax
     734:	5e                   	pop    %esi
     735:	5f                   	pop    %edi
     736:	5d                   	pop    %ebp
     737:	c3                   	ret
     738:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     73f:	90                   	nop

00000740 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     740:	55                   	push   %ebp
     741:	89 e5                	mov    %esp,%ebp
     743:	57                   	push   %edi
     744:	56                   	push   %esi
     745:	53                   	push   %ebx
     746:	83 ec 2c             	sub    $0x2c,%esp
     749:	8b 75 0c             	mov    0xc(%ebp),%esi
     74c:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     74f:	90                   	nop
     750:	83 ec 04             	sub    $0x4,%esp
     753:	68 f0 13 00 00       	push   $0x13f0
     758:	53                   	push   %ebx
     759:	56                   	push   %esi
     75a:	e8 61 ff ff ff       	call   6c0 <peek>
     75f:	83 c4 10             	add    $0x10,%esp
     762:	85 c0                	test   %eax,%eax
     764:	0f 84 f6 00 00 00    	je     860 <parseredirs+0x120>
    tok = gettoken(ps, es, 0, 0);
     76a:	6a 00                	push   $0x0
     76c:	6a 00                	push   $0x0
     76e:	53                   	push   %ebx
     76f:	56                   	push   %esi
     770:	e8 db fd ff ff       	call   550 <gettoken>
     775:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     777:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     77a:	50                   	push   %eax
     77b:	8d 45 e0             	lea    -0x20(%ebp),%eax
     77e:	50                   	push   %eax
     77f:	53                   	push   %ebx
     780:	56                   	push   %esi
     781:	e8 ca fd ff ff       	call   550 <gettoken>
     786:	83 c4 20             	add    $0x20,%esp
     789:	83 f8 61             	cmp    $0x61,%eax
     78c:	0f 85 d9 00 00 00    	jne    86b <parseredirs+0x12b>
      panic("missing file for redirection");
    switch(tok){
     792:	83 ff 3c             	cmp    $0x3c,%edi
     795:	74 69                	je     800 <parseredirs+0xc0>
     797:	83 ff 3e             	cmp    $0x3e,%edi
     79a:	74 05                	je     7a1 <parseredirs+0x61>
     79c:	83 ff 2b             	cmp    $0x2b,%edi
     79f:	75 af                	jne    750 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     7a1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     7a4:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     7a7:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     7aa:	89 55 d0             	mov    %edx,-0x30(%ebp)
     7ad:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     7b0:	6a 18                	push   $0x18
     7b2:	e8 e9 0a 00 00       	call   12a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     7b7:	83 c4 0c             	add    $0xc,%esp
     7ba:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     7bc:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     7be:	6a 00                	push   $0x0
     7c0:	50                   	push   %eax
     7c1:	e8 aa 05 00 00       	call   d70 <memset>
  cmd->type = REDIR;
     7c6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     7cc:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
     7cf:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     7d2:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     7d5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     7d8:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     7db:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->mode = mode;
     7de:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
  cmd->efile = efile;
     7e5:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->fd = fd;
     7e8:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
      break;
     7ef:	89 7d 08             	mov    %edi,0x8(%ebp)
     7f2:	e9 59 ff ff ff       	jmp    750 <parseredirs+0x10>
     7f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     7fe:	66 90                	xchg   %ax,%ax
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     800:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     803:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     806:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     809:	89 55 d0             	mov    %edx,-0x30(%ebp)
     80c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     80f:	6a 18                	push   $0x18
     811:	e8 8a 0a 00 00       	call   12a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     816:	83 c4 0c             	add    $0xc,%esp
     819:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     81b:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     81d:	6a 00                	push   $0x0
     81f:	50                   	push   %eax
     820:	e8 4b 05 00 00       	call   d70 <memset>
  cmd->cmd = subcmd;
     825:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->file = file;
     828:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      break;
     82b:	89 7d 08             	mov    %edi,0x8(%ebp)
  cmd->efile = efile;
     82e:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->type = REDIR;
     831:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
      break;
     837:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     83a:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     83d:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     840:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->mode = mode;
     843:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
  cmd->fd = fd;
     84a:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
      break;
     851:	e9 fa fe ff ff       	jmp    750 <parseredirs+0x10>
     856:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     85d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
  return cmd;
}
     860:	8b 45 08             	mov    0x8(%ebp),%eax
     863:	8d 65 f4             	lea    -0xc(%ebp),%esp
     866:	5b                   	pop    %ebx
     867:	5e                   	pop    %esi
     868:	5f                   	pop    %edi
     869:	5d                   	pop    %ebp
     86a:	c3                   	ret
      panic("missing file for redirection");
     86b:	83 ec 0c             	sub    $0xc,%esp
     86e:	68 d3 13 00 00       	push   $0x13d3
     873:	e8 78 f9 ff ff       	call   1f0 <panic>
     878:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     87f:	90                   	nop

00000880 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     880:	55                   	push   %ebp
     881:	89 e5                	mov    %esp,%ebp
     883:	57                   	push   %edi
     884:	56                   	push   %esi
     885:	53                   	push   %ebx
     886:	83 ec 30             	sub    $0x30,%esp
     889:	8b 5d 08             	mov    0x8(%ebp),%ebx
     88c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     88f:	68 f3 13 00 00       	push   $0x13f3
     894:	56                   	push   %esi
     895:	53                   	push   %ebx
     896:	e8 25 fe ff ff       	call   6c0 <peek>
     89b:	83 c4 10             	add    $0x10,%esp
     89e:	85 c0                	test   %eax,%eax
     8a0:	0f 85 aa 00 00 00    	jne    950 <parseexec+0xd0>
  cmd = malloc(sizeof(*cmd));
     8a6:	83 ec 0c             	sub    $0xc,%esp
     8a9:	89 c7                	mov    %eax,%edi
     8ab:	6a 54                	push   $0x54
     8ad:	e8 ee 09 00 00       	call   12a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     8b2:	83 c4 0c             	add    $0xc,%esp
     8b5:	6a 54                	push   $0x54
     8b7:	6a 00                	push   $0x0
     8b9:	89 45 d0             	mov    %eax,-0x30(%ebp)
     8bc:	50                   	push   %eax
     8bd:	e8 ae 04 00 00       	call   d70 <memset>
  cmd->type = EXEC;
     8c2:	8b 45 d0             	mov    -0x30(%ebp),%eax

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     8c5:	83 c4 0c             	add    $0xc,%esp
  cmd->type = EXEC;
     8c8:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  ret = parseredirs(ret, ps, es);
     8ce:	56                   	push   %esi
     8cf:	53                   	push   %ebx
     8d0:	50                   	push   %eax
     8d1:	e8 6a fe ff ff       	call   740 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     8d6:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     8d9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     8dc:	eb 15                	jmp    8f3 <parseexec+0x73>
     8de:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     8e0:	83 ec 04             	sub    $0x4,%esp
     8e3:	56                   	push   %esi
     8e4:	53                   	push   %ebx
     8e5:	ff 75 d4             	push   -0x2c(%ebp)
     8e8:	e8 53 fe ff ff       	call   740 <parseredirs>
     8ed:	83 c4 10             	add    $0x10,%esp
     8f0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     8f3:	83 ec 04             	sub    $0x4,%esp
     8f6:	68 0a 14 00 00       	push   $0x140a
     8fb:	56                   	push   %esi
     8fc:	53                   	push   %ebx
     8fd:	e8 be fd ff ff       	call   6c0 <peek>
     902:	83 c4 10             	add    $0x10,%esp
     905:	85 c0                	test   %eax,%eax
     907:	75 5f                	jne    968 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     909:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     90c:	50                   	push   %eax
     90d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     910:	50                   	push   %eax
     911:	56                   	push   %esi
     912:	53                   	push   %ebx
     913:	e8 38 fc ff ff       	call   550 <gettoken>
     918:	83 c4 10             	add    $0x10,%esp
     91b:	85 c0                	test   %eax,%eax
     91d:	74 49                	je     968 <parseexec+0xe8>
    if(tok != 'a')
     91f:	83 f8 61             	cmp    $0x61,%eax
     922:	75 62                	jne    986 <parseexec+0x106>
    cmd->argv[argc] = q;
     924:	8b 45 e0             	mov    -0x20(%ebp),%eax
     927:	8b 55 d0             	mov    -0x30(%ebp),%edx
     92a:	89 44 ba 04          	mov    %eax,0x4(%edx,%edi,4)
    cmd->eargv[argc] = eq;
     92e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     931:	89 44 ba 2c          	mov    %eax,0x2c(%edx,%edi,4)
    argc++;
     935:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARGS)
     938:	83 ff 0a             	cmp    $0xa,%edi
     93b:	75 a3                	jne    8e0 <parseexec+0x60>
      panic("too many args");
     93d:	83 ec 0c             	sub    $0xc,%esp
     940:	68 fc 13 00 00       	push   $0x13fc
     945:	e8 a6 f8 ff ff       	call   1f0 <panic>
     94a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     950:	89 75 0c             	mov    %esi,0xc(%ebp)
     953:	89 5d 08             	mov    %ebx,0x8(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     956:	8d 65 f4             	lea    -0xc(%ebp),%esp
     959:	5b                   	pop    %ebx
     95a:	5e                   	pop    %esi
     95b:	5f                   	pop    %edi
     95c:	5d                   	pop    %ebp
    return parseblock(ps, es);
     95d:	e9 ae 01 00 00       	jmp    b10 <parseblock>
     962:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  cmd->argv[argc] = 0;
     968:	8b 45 d0             	mov    -0x30(%ebp),%eax
     96b:	c7 44 b8 04 00 00 00 	movl   $0x0,0x4(%eax,%edi,4)
     972:	00 
  cmd->eargv[argc] = 0;
     973:	c7 44 b8 2c 00 00 00 	movl   $0x0,0x2c(%eax,%edi,4)
     97a:	00 
}
     97b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     97e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     981:	5b                   	pop    %ebx
     982:	5e                   	pop    %esi
     983:	5f                   	pop    %edi
     984:	5d                   	pop    %ebp
     985:	c3                   	ret
      panic("syntax");
     986:	83 ec 0c             	sub    $0xc,%esp
     989:	68 f5 13 00 00       	push   $0x13f5
     98e:	e8 5d f8 ff ff       	call   1f0 <panic>
     993:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     99a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000009a0 <parsepipe>:
{
     9a0:	55                   	push   %ebp
     9a1:	89 e5                	mov    %esp,%ebp
     9a3:	57                   	push   %edi
     9a4:	56                   	push   %esi
     9a5:	53                   	push   %ebx
     9a6:	83 ec 14             	sub    $0x14,%esp
     9a9:	8b 75 08             	mov    0x8(%ebp),%esi
     9ac:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     9af:	57                   	push   %edi
     9b0:	56                   	push   %esi
     9b1:	e8 ca fe ff ff       	call   880 <parseexec>
  if(peek(ps, es, "|")){
     9b6:	83 c4 0c             	add    $0xc,%esp
     9b9:	68 0f 14 00 00       	push   $0x140f
  cmd = parseexec(ps, es);
     9be:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     9c0:	57                   	push   %edi
     9c1:	56                   	push   %esi
     9c2:	e8 f9 fc ff ff       	call   6c0 <peek>
     9c7:	83 c4 10             	add    $0x10,%esp
     9ca:	85 c0                	test   %eax,%eax
     9cc:	75 12                	jne    9e0 <parsepipe+0x40>
}
     9ce:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9d1:	89 d8                	mov    %ebx,%eax
     9d3:	5b                   	pop    %ebx
     9d4:	5e                   	pop    %esi
     9d5:	5f                   	pop    %edi
     9d6:	5d                   	pop    %ebp
     9d7:	c3                   	ret
     9d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     9df:	90                   	nop
    gettoken(ps, es, 0, 0);
     9e0:	6a 00                	push   $0x0
     9e2:	6a 00                	push   $0x0
     9e4:	57                   	push   %edi
     9e5:	56                   	push   %esi
     9e6:	e8 65 fb ff ff       	call   550 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     9eb:	58                   	pop    %eax
     9ec:	5a                   	pop    %edx
     9ed:	57                   	push   %edi
     9ee:	56                   	push   %esi
     9ef:	e8 ac ff ff ff       	call   9a0 <parsepipe>
  cmd = malloc(sizeof(*cmd));
     9f4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
     9fb:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     9fd:	e8 9e 08 00 00       	call   12a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     a02:	83 c4 0c             	add    $0xc,%esp
     a05:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     a07:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     a09:	6a 00                	push   $0x0
     a0b:	50                   	push   %eax
     a0c:	e8 5f 03 00 00       	call   d70 <memset>
  cmd->left = left;
     a11:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     a14:	83 c4 10             	add    $0x10,%esp
     a17:	89 f3                	mov    %esi,%ebx
  cmd->type = PIPE;
     a19:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
     a1f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     a21:	89 7e 08             	mov    %edi,0x8(%esi)
}
     a24:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a27:	5b                   	pop    %ebx
     a28:	5e                   	pop    %esi
     a29:	5f                   	pop    %edi
     a2a:	5d                   	pop    %ebp
     a2b:	c3                   	ret
     a2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a30 <parseline>:
{
     a30:	55                   	push   %ebp
     a31:	89 e5                	mov    %esp,%ebp
     a33:	57                   	push   %edi
     a34:	56                   	push   %esi
     a35:	53                   	push   %ebx
     a36:	83 ec 24             	sub    $0x24,%esp
     a39:	8b 75 08             	mov    0x8(%ebp),%esi
     a3c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     a3f:	57                   	push   %edi
     a40:	56                   	push   %esi
     a41:	e8 5a ff ff ff       	call   9a0 <parsepipe>
  while(peek(ps, es, "&")){
     a46:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     a49:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     a4b:	eb 3b                	jmp    a88 <parseline+0x58>
     a4d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     a50:	6a 00                	push   $0x0
     a52:	6a 00                	push   $0x0
     a54:	57                   	push   %edi
     a55:	56                   	push   %esi
     a56:	e8 f5 fa ff ff       	call   550 <gettoken>
  cmd = malloc(sizeof(*cmd));
     a5b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     a62:	e8 39 08 00 00       	call   12a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     a67:	83 c4 0c             	add    $0xc,%esp
     a6a:	6a 08                	push   $0x8
     a6c:	6a 00                	push   $0x0
     a6e:	50                   	push   %eax
     a6f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     a72:	e8 f9 02 00 00       	call   d70 <memset>
  cmd->type = BACK;
     a77:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cmd->cmd = subcmd;
     a7a:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
     a7d:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
  cmd->cmd = subcmd;
     a83:	89 5a 04             	mov    %ebx,0x4(%edx)
     a86:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
     a88:	83 ec 04             	sub    $0x4,%esp
     a8b:	68 11 14 00 00       	push   $0x1411
     a90:	57                   	push   %edi
     a91:	56                   	push   %esi
     a92:	e8 29 fc ff ff       	call   6c0 <peek>
     a97:	83 c4 10             	add    $0x10,%esp
     a9a:	85 c0                	test   %eax,%eax
     a9c:	75 b2                	jne    a50 <parseline+0x20>
  if(peek(ps, es, ";")){
     a9e:	83 ec 04             	sub    $0x4,%esp
     aa1:	68 0d 14 00 00       	push   $0x140d
     aa6:	57                   	push   %edi
     aa7:	56                   	push   %esi
     aa8:	e8 13 fc ff ff       	call   6c0 <peek>
     aad:	83 c4 10             	add    $0x10,%esp
     ab0:	85 c0                	test   %eax,%eax
     ab2:	75 0c                	jne    ac0 <parseline+0x90>
}
     ab4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ab7:	89 d8                	mov    %ebx,%eax
     ab9:	5b                   	pop    %ebx
     aba:	5e                   	pop    %esi
     abb:	5f                   	pop    %edi
     abc:	5d                   	pop    %ebp
     abd:	c3                   	ret
     abe:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     ac0:	6a 00                	push   $0x0
     ac2:	6a 00                	push   $0x0
     ac4:	57                   	push   %edi
     ac5:	56                   	push   %esi
     ac6:	e8 85 fa ff ff       	call   550 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     acb:	58                   	pop    %eax
     acc:	5a                   	pop    %edx
     acd:	57                   	push   %edi
     ace:	56                   	push   %esi
     acf:	e8 5c ff ff ff       	call   a30 <parseline>
  cmd = malloc(sizeof(*cmd));
     ad4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
     adb:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     add:	e8 be 07 00 00       	call   12a0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     ae2:	83 c4 0c             	add    $0xc,%esp
     ae5:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     ae7:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     ae9:	6a 00                	push   $0x0
     aeb:	50                   	push   %eax
     aec:	e8 7f 02 00 00       	call   d70 <memset>
  cmd->left = left;
     af1:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     af4:	83 c4 10             	add    $0x10,%esp
     af7:	89 f3                	mov    %esi,%ebx
  cmd->type = LIST;
     af9:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
     aff:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     b01:	89 7e 08             	mov    %edi,0x8(%esi)
}
     b04:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b07:	5b                   	pop    %ebx
     b08:	5e                   	pop    %esi
     b09:	5f                   	pop    %edi
     b0a:	5d                   	pop    %ebp
     b0b:	c3                   	ret
     b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b10 <parseblock>:
{
     b10:	55                   	push   %ebp
     b11:	89 e5                	mov    %esp,%ebp
     b13:	57                   	push   %edi
     b14:	56                   	push   %esi
     b15:	53                   	push   %ebx
     b16:	83 ec 10             	sub    $0x10,%esp
     b19:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b1c:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     b1f:	68 f3 13 00 00       	push   $0x13f3
     b24:	56                   	push   %esi
     b25:	53                   	push   %ebx
     b26:	e8 95 fb ff ff       	call   6c0 <peek>
     b2b:	83 c4 10             	add    $0x10,%esp
     b2e:	85 c0                	test   %eax,%eax
     b30:	74 4a                	je     b7c <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     b32:	6a 00                	push   $0x0
     b34:	6a 00                	push   $0x0
     b36:	56                   	push   %esi
     b37:	53                   	push   %ebx
     b38:	e8 13 fa ff ff       	call   550 <gettoken>
  cmd = parseline(ps, es);
     b3d:	58                   	pop    %eax
     b3e:	5a                   	pop    %edx
     b3f:	56                   	push   %esi
     b40:	53                   	push   %ebx
     b41:	e8 ea fe ff ff       	call   a30 <parseline>
  if(!peek(ps, es, ")"))
     b46:	83 c4 0c             	add    $0xc,%esp
     b49:	68 2f 14 00 00       	push   $0x142f
  cmd = parseline(ps, es);
     b4e:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     b50:	56                   	push   %esi
     b51:	53                   	push   %ebx
     b52:	e8 69 fb ff ff       	call   6c0 <peek>
     b57:	83 c4 10             	add    $0x10,%esp
     b5a:	85 c0                	test   %eax,%eax
     b5c:	74 2b                	je     b89 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     b5e:	6a 00                	push   $0x0
     b60:	6a 00                	push   $0x0
     b62:	56                   	push   %esi
     b63:	53                   	push   %ebx
     b64:	e8 e7 f9 ff ff       	call   550 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     b69:	83 c4 0c             	add    $0xc,%esp
     b6c:	56                   	push   %esi
     b6d:	53                   	push   %ebx
     b6e:	57                   	push   %edi
     b6f:	e8 cc fb ff ff       	call   740 <parseredirs>
}
     b74:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b77:	5b                   	pop    %ebx
     b78:	5e                   	pop    %esi
     b79:	5f                   	pop    %edi
     b7a:	5d                   	pop    %ebp
     b7b:	c3                   	ret
    panic("parseblock");
     b7c:	83 ec 0c             	sub    $0xc,%esp
     b7f:	68 13 14 00 00       	push   $0x1413
     b84:	e8 67 f6 ff ff       	call   1f0 <panic>
    panic("syntax - missing )");
     b89:	83 ec 0c             	sub    $0xc,%esp
     b8c:	68 1e 14 00 00       	push   $0x141e
     b91:	e8 5a f6 ff ff       	call   1f0 <panic>
     b96:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b9d:	8d 76 00             	lea    0x0(%esi),%esi

00000ba0 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     ba0:	55                   	push   %ebp
     ba1:	89 e5                	mov    %esp,%ebp
     ba3:	53                   	push   %ebx
     ba4:	83 ec 04             	sub    $0x4,%esp
     ba7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     baa:	85 db                	test   %ebx,%ebx
     bac:	0f 84 7e 00 00 00    	je     c30 <nulterminate+0x90>
    return 0;

  switch(cmd->type){
     bb2:	83 3b 05             	cmpl   $0x5,(%ebx)
     bb5:	77 20                	ja     bd7 <nulterminate+0x37>
     bb7:	8b 03                	mov    (%ebx),%eax
     bb9:	ff 24 85 74 14 00 00 	jmp    *0x1474(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     bc0:	83 ec 0c             	sub    $0xc,%esp
     bc3:	ff 73 04             	push   0x4(%ebx)
     bc6:	e8 d5 ff ff ff       	call   ba0 <nulterminate>
    nulterminate(lcmd->right);
     bcb:	58                   	pop    %eax
     bcc:	ff 73 08             	push   0x8(%ebx)
     bcf:	e8 cc ff ff ff       	call   ba0 <nulterminate>
    break;
     bd4:	83 c4 10             	add    $0x10,%esp
    return 0;
     bd7:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     bd9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     bdc:	c9                   	leave
     bdd:	c3                   	ret
     bde:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
     be0:	83 ec 0c             	sub    $0xc,%esp
     be3:	ff 73 04             	push   0x4(%ebx)
     be6:	e8 b5 ff ff ff       	call   ba0 <nulterminate>
    break;
     beb:	83 c4 10             	add    $0x10,%esp
     bee:	eb e7                	jmp    bd7 <nulterminate+0x37>
    for(i=0; ecmd->argv[i]; i++)
     bf0:	8b 4b 04             	mov    0x4(%ebx),%ecx
     bf3:	8d 43 08             	lea    0x8(%ebx),%eax
     bf6:	85 c9                	test   %ecx,%ecx
     bf8:	74 dd                	je     bd7 <nulterminate+0x37>
     bfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     c00:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
     c03:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
     c06:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     c09:	8b 50 fc             	mov    -0x4(%eax),%edx
     c0c:	85 d2                	test   %edx,%edx
     c0e:	75 f0                	jne    c00 <nulterminate+0x60>
     c10:	eb c5                	jmp    bd7 <nulterminate+0x37>
     c12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    nulterminate(rcmd->cmd);
     c18:	83 ec 0c             	sub    $0xc,%esp
     c1b:	ff 73 04             	push   0x4(%ebx)
     c1e:	e8 7d ff ff ff       	call   ba0 <nulterminate>
    *rcmd->efile = 0;
     c23:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     c26:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     c29:	c6 00 00             	movb   $0x0,(%eax)
    break;
     c2c:	eb a9                	jmp    bd7 <nulterminate+0x37>
     c2e:	66 90                	xchg   %ax,%ax
    return 0;
     c30:	31 c0                	xor    %eax,%eax
     c32:	eb a5                	jmp    bd9 <nulterminate+0x39>
     c34:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c3f:	90                   	nop

00000c40 <parsecmd>:
{
     c40:	55                   	push   %ebp
     c41:	89 e5                	mov    %esp,%ebp
     c43:	57                   	push   %edi
     c44:	56                   	push   %esi
  cmd = parseline(&s, es);
     c45:	8d 7d 08             	lea    0x8(%ebp),%edi
{
     c48:	53                   	push   %ebx
     c49:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
     c4c:	8b 5d 08             	mov    0x8(%ebp),%ebx
     c4f:	53                   	push   %ebx
     c50:	e8 eb 00 00 00       	call   d40 <strlen>
  cmd = parseline(&s, es);
     c55:	59                   	pop    %ecx
     c56:	5e                   	pop    %esi
  es = s + strlen(s);
     c57:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     c59:	53                   	push   %ebx
     c5a:	57                   	push   %edi
     c5b:	e8 d0 fd ff ff       	call   a30 <parseline>
  peek(&s, es, "");
     c60:	83 c4 0c             	add    $0xc,%esp
     c63:	68 c0 13 00 00       	push   $0x13c0
  cmd = parseline(&s, es);
     c68:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     c6a:	53                   	push   %ebx
     c6b:	57                   	push   %edi
     c6c:	e8 4f fa ff ff       	call   6c0 <peek>
  if(s != es){
     c71:	8b 45 08             	mov    0x8(%ebp),%eax
     c74:	83 c4 10             	add    $0x10,%esp
     c77:	39 d8                	cmp    %ebx,%eax
     c79:	75 13                	jne    c8e <parsecmd+0x4e>
  nulterminate(cmd);
     c7b:	83 ec 0c             	sub    $0xc,%esp
     c7e:	56                   	push   %esi
     c7f:	e8 1c ff ff ff       	call   ba0 <nulterminate>
}
     c84:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c87:	89 f0                	mov    %esi,%eax
     c89:	5b                   	pop    %ebx
     c8a:	5e                   	pop    %esi
     c8b:	5f                   	pop    %edi
     c8c:	5d                   	pop    %ebp
     c8d:	c3                   	ret
    printf(2, "leftovers: %s\n", s);
     c8e:	52                   	push   %edx
     c8f:	50                   	push   %eax
     c90:	68 31 14 00 00       	push   $0x1431
     c95:	6a 02                	push   $0x2
     c97:	e8 c4 03 00 00       	call   1060 <printf>
    panic("syntax");
     c9c:	c7 04 24 f5 13 00 00 	movl   $0x13f5,(%esp)
     ca3:	e8 48 f5 ff ff       	call   1f0 <panic>
     ca8:	66 90                	xchg   %ax,%ax
     caa:	66 90                	xchg   %ax,%ax
     cac:	66 90                	xchg   %ax,%ax
     cae:	66 90                	xchg   %ax,%ax

00000cb0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     cb0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     cb1:	31 c0                	xor    %eax,%eax
{
     cb3:	89 e5                	mov    %esp,%ebp
     cb5:	53                   	push   %ebx
     cb6:	8b 4d 08             	mov    0x8(%ebp),%ecx
     cb9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     cbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     cc0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     cc4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     cc7:	83 c0 01             	add    $0x1,%eax
     cca:	84 d2                	test   %dl,%dl
     ccc:	75 f2                	jne    cc0 <strcpy+0x10>
    ;
  return os;
}
     cce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     cd1:	89 c8                	mov    %ecx,%eax
     cd3:	c9                   	leave
     cd4:	c3                   	ret
     cd5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     cdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ce0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     ce0:	55                   	push   %ebp
     ce1:	89 e5                	mov    %esp,%ebp
     ce3:	53                   	push   %ebx
     ce4:	8b 55 08             	mov    0x8(%ebp),%edx
     ce7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     cea:	0f b6 02             	movzbl (%edx),%eax
     ced:	84 c0                	test   %al,%al
     cef:	75 17                	jne    d08 <strcmp+0x28>
     cf1:	eb 3a                	jmp    d2d <strcmp+0x4d>
     cf3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     cf7:	90                   	nop
     cf8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     cfc:	83 c2 01             	add    $0x1,%edx
     cff:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     d02:	84 c0                	test   %al,%al
     d04:	74 1a                	je     d20 <strcmp+0x40>
    p++, q++;
     d06:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
     d08:	0f b6 19             	movzbl (%ecx),%ebx
     d0b:	38 c3                	cmp    %al,%bl
     d0d:	74 e9                	je     cf8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     d0f:	29 d8                	sub    %ebx,%eax
}
     d11:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d14:	c9                   	leave
     d15:	c3                   	ret
     d16:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d1d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
     d20:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     d24:	31 c0                	xor    %eax,%eax
     d26:	29 d8                	sub    %ebx,%eax
}
     d28:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d2b:	c9                   	leave
     d2c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
     d2d:	0f b6 19             	movzbl (%ecx),%ebx
     d30:	31 c0                	xor    %eax,%eax
     d32:	eb db                	jmp    d0f <strcmp+0x2f>
     d34:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d3f:	90                   	nop

00000d40 <strlen>:

uint
strlen(char *s)
{
     d40:	55                   	push   %ebp
     d41:	89 e5                	mov    %esp,%ebp
     d43:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     d46:	80 3a 00             	cmpb   $0x0,(%edx)
     d49:	74 15                	je     d60 <strlen+0x20>
     d4b:	31 c0                	xor    %eax,%eax
     d4d:	8d 76 00             	lea    0x0(%esi),%esi
     d50:	83 c0 01             	add    $0x1,%eax
     d53:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     d57:	89 c1                	mov    %eax,%ecx
     d59:	75 f5                	jne    d50 <strlen+0x10>
    ;
  return n;
}
     d5b:	89 c8                	mov    %ecx,%eax
     d5d:	5d                   	pop    %ebp
     d5e:	c3                   	ret
     d5f:	90                   	nop
  for(n = 0; s[n]; n++)
     d60:	31 c9                	xor    %ecx,%ecx
}
     d62:	5d                   	pop    %ebp
     d63:	89 c8                	mov    %ecx,%eax
     d65:	c3                   	ret
     d66:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d6d:	8d 76 00             	lea    0x0(%esi),%esi

00000d70 <memset>:

void*
memset(void *dst, int c, uint n)
{
     d70:	55                   	push   %ebp
     d71:	89 e5                	mov    %esp,%ebp
     d73:	57                   	push   %edi
     d74:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     d77:	8b 4d 10             	mov    0x10(%ebp),%ecx
     d7a:	8b 45 0c             	mov    0xc(%ebp),%eax
     d7d:	89 d7                	mov    %edx,%edi
     d7f:	fc                   	cld
     d80:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     d82:	8b 7d fc             	mov    -0x4(%ebp),%edi
     d85:	89 d0                	mov    %edx,%eax
     d87:	c9                   	leave
     d88:	c3                   	ret
     d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d90 <strchr>:

char*
strchr(const char *s, char c)
{
     d90:	55                   	push   %ebp
     d91:	89 e5                	mov    %esp,%ebp
     d93:	8b 45 08             	mov    0x8(%ebp),%eax
     d96:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     d9a:	0f b6 10             	movzbl (%eax),%edx
     d9d:	84 d2                	test   %dl,%dl
     d9f:	75 12                	jne    db3 <strchr+0x23>
     da1:	eb 1d                	jmp    dc0 <strchr+0x30>
     da3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     da7:	90                   	nop
     da8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     dac:	83 c0 01             	add    $0x1,%eax
     daf:	84 d2                	test   %dl,%dl
     db1:	74 0d                	je     dc0 <strchr+0x30>
    if(*s == c)
     db3:	38 d1                	cmp    %dl,%cl
     db5:	75 f1                	jne    da8 <strchr+0x18>
      return (char*)s;
  return 0;
}
     db7:	5d                   	pop    %ebp
     db8:	c3                   	ret
     db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     dc0:	31 c0                	xor    %eax,%eax
}
     dc2:	5d                   	pop    %ebp
     dc3:	c3                   	ret
     dc4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     dcb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     dcf:	90                   	nop

00000dd0 <gets>:

char*
gets(char *buf, int max)
{
     dd0:	55                   	push   %ebp
     dd1:	89 e5                	mov    %esp,%ebp
     dd3:	57                   	push   %edi
     dd4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     dd5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
     dd8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     dd9:	31 db                	xor    %ebx,%ebx
{
     ddb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     dde:	eb 27                	jmp    e07 <gets+0x37>
    cc = read(0, &c, 1);
     de0:	83 ec 04             	sub    $0x4,%esp
     de3:	6a 01                	push   $0x1
     de5:	56                   	push   %esi
     de6:	6a 00                	push   $0x0
     de8:	e8 1e 01 00 00       	call   f0b <read>
    if(cc < 1)
     ded:	83 c4 10             	add    $0x10,%esp
     df0:	85 c0                	test   %eax,%eax
     df2:	7e 1d                	jle    e11 <gets+0x41>
      break;
    buf[i++] = c;
     df4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     df8:	8b 55 08             	mov    0x8(%ebp),%edx
     dfb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     dff:	3c 0a                	cmp    $0xa,%al
     e01:	74 10                	je     e13 <gets+0x43>
     e03:	3c 0d                	cmp    $0xd,%al
     e05:	74 0c                	je     e13 <gets+0x43>
  for(i=0; i+1 < max; ){
     e07:	89 df                	mov    %ebx,%edi
     e09:	83 c3 01             	add    $0x1,%ebx
     e0c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     e0f:	7c cf                	jl     de0 <gets+0x10>
     e11:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
     e13:	8b 45 08             	mov    0x8(%ebp),%eax
     e16:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
     e1a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e1d:	5b                   	pop    %ebx
     e1e:	5e                   	pop    %esi
     e1f:	5f                   	pop    %edi
     e20:	5d                   	pop    %ebp
     e21:	c3                   	ret
     e22:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000e30 <stat>:

int
stat(char *n, struct stat *st)
{
     e30:	55                   	push   %ebp
     e31:	89 e5                	mov    %esp,%ebp
     e33:	56                   	push   %esi
     e34:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     e35:	83 ec 08             	sub    $0x8,%esp
     e38:	6a 00                	push   $0x0
     e3a:	ff 75 08             	push   0x8(%ebp)
     e3d:	e8 f1 00 00 00       	call   f33 <open>
  if(fd < 0)
     e42:	83 c4 10             	add    $0x10,%esp
     e45:	85 c0                	test   %eax,%eax
     e47:	78 27                	js     e70 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     e49:	83 ec 08             	sub    $0x8,%esp
     e4c:	ff 75 0c             	push   0xc(%ebp)
     e4f:	89 c3                	mov    %eax,%ebx
     e51:	50                   	push   %eax
     e52:	e8 f4 00 00 00       	call   f4b <fstat>
  close(fd);
     e57:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     e5a:	89 c6                	mov    %eax,%esi
  close(fd);
     e5c:	e8 ba 00 00 00       	call   f1b <close>
  return r;
     e61:	83 c4 10             	add    $0x10,%esp
}
     e64:	8d 65 f8             	lea    -0x8(%ebp),%esp
     e67:	89 f0                	mov    %esi,%eax
     e69:	5b                   	pop    %ebx
     e6a:	5e                   	pop    %esi
     e6b:	5d                   	pop    %ebp
     e6c:	c3                   	ret
     e6d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     e70:	be ff ff ff ff       	mov    $0xffffffff,%esi
     e75:	eb ed                	jmp    e64 <stat+0x34>
     e77:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e7e:	66 90                	xchg   %ax,%ax

00000e80 <atoi>:

int
atoi(const char *s)
{
     e80:	55                   	push   %ebp
     e81:	89 e5                	mov    %esp,%ebp
     e83:	53                   	push   %ebx
     e84:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     e87:	0f be 02             	movsbl (%edx),%eax
     e8a:	8d 48 d0             	lea    -0x30(%eax),%ecx
     e8d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     e90:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     e95:	77 1e                	ja     eb5 <atoi+0x35>
     e97:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e9e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
     ea0:	83 c2 01             	add    $0x1,%edx
     ea3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     ea6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     eaa:	0f be 02             	movsbl (%edx),%eax
     ead:	8d 58 d0             	lea    -0x30(%eax),%ebx
     eb0:	80 fb 09             	cmp    $0x9,%bl
     eb3:	76 eb                	jbe    ea0 <atoi+0x20>
  return n;
}
     eb5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     eb8:	89 c8                	mov    %ecx,%eax
     eba:	c9                   	leave
     ebb:	c3                   	ret
     ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ec0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     ec0:	55                   	push   %ebp
     ec1:	89 e5                	mov    %esp,%ebp
     ec3:	57                   	push   %edi
     ec4:	56                   	push   %esi
     ec5:	8b 45 10             	mov    0x10(%ebp),%eax
     ec8:	8b 55 08             	mov    0x8(%ebp),%edx
     ecb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     ece:	85 c0                	test   %eax,%eax
     ed0:	7e 13                	jle    ee5 <memmove+0x25>
     ed2:	01 d0                	add    %edx,%eax
  dst = vdst;
     ed4:	89 d7                	mov    %edx,%edi
     ed6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     edd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
     ee0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     ee1:	39 f8                	cmp    %edi,%eax
     ee3:	75 fb                	jne    ee0 <memmove+0x20>
  return vdst;
}
     ee5:	5e                   	pop    %esi
     ee6:	89 d0                	mov    %edx,%eax
     ee8:	5f                   	pop    %edi
     ee9:	5d                   	pop    %ebp
     eea:	c3                   	ret

00000eeb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     eeb:	b8 01 00 00 00       	mov    $0x1,%eax
     ef0:	cd 40                	int    $0x40
     ef2:	c3                   	ret

00000ef3 <exit>:
SYSCALL(exit)
     ef3:	b8 02 00 00 00       	mov    $0x2,%eax
     ef8:	cd 40                	int    $0x40
     efa:	c3                   	ret

00000efb <wait>:
SYSCALL(wait)
     efb:	b8 03 00 00 00       	mov    $0x3,%eax
     f00:	cd 40                	int    $0x40
     f02:	c3                   	ret

00000f03 <pipe>:
SYSCALL(pipe)
     f03:	b8 04 00 00 00       	mov    $0x4,%eax
     f08:	cd 40                	int    $0x40
     f0a:	c3                   	ret

00000f0b <read>:
SYSCALL(read)
     f0b:	b8 05 00 00 00       	mov    $0x5,%eax
     f10:	cd 40                	int    $0x40
     f12:	c3                   	ret

00000f13 <write>:
SYSCALL(write)
     f13:	b8 10 00 00 00       	mov    $0x10,%eax
     f18:	cd 40                	int    $0x40
     f1a:	c3                   	ret

00000f1b <close>:
SYSCALL(close)
     f1b:	b8 15 00 00 00       	mov    $0x15,%eax
     f20:	cd 40                	int    $0x40
     f22:	c3                   	ret

00000f23 <kill>:
SYSCALL(kill)
     f23:	b8 06 00 00 00       	mov    $0x6,%eax
     f28:	cd 40                	int    $0x40
     f2a:	c3                   	ret

00000f2b <exec>:
SYSCALL(exec)
     f2b:	b8 07 00 00 00       	mov    $0x7,%eax
     f30:	cd 40                	int    $0x40
     f32:	c3                   	ret

00000f33 <open>:
SYSCALL(open)
     f33:	b8 0f 00 00 00       	mov    $0xf,%eax
     f38:	cd 40                	int    $0x40
     f3a:	c3                   	ret

00000f3b <mknod>:
SYSCALL(mknod)
     f3b:	b8 11 00 00 00       	mov    $0x11,%eax
     f40:	cd 40                	int    $0x40
     f42:	c3                   	ret

00000f43 <unlink>:
SYSCALL(unlink)
     f43:	b8 12 00 00 00       	mov    $0x12,%eax
     f48:	cd 40                	int    $0x40
     f4a:	c3                   	ret

00000f4b <fstat>:
SYSCALL(fstat)
     f4b:	b8 08 00 00 00       	mov    $0x8,%eax
     f50:	cd 40                	int    $0x40
     f52:	c3                   	ret

00000f53 <link>:
SYSCALL(link)
     f53:	b8 13 00 00 00       	mov    $0x13,%eax
     f58:	cd 40                	int    $0x40
     f5a:	c3                   	ret

00000f5b <mkdir>:
SYSCALL(mkdir)
     f5b:	b8 14 00 00 00       	mov    $0x14,%eax
     f60:	cd 40                	int    $0x40
     f62:	c3                   	ret

00000f63 <chdir>:
SYSCALL(chdir)
     f63:	b8 09 00 00 00       	mov    $0x9,%eax
     f68:	cd 40                	int    $0x40
     f6a:	c3                   	ret

00000f6b <dup>:
SYSCALL(dup)
     f6b:	b8 0a 00 00 00       	mov    $0xa,%eax
     f70:	cd 40                	int    $0x40
     f72:	c3                   	ret

00000f73 <getpid>:
SYSCALL(getpid)
     f73:	b8 0b 00 00 00       	mov    $0xb,%eax
     f78:	cd 40                	int    $0x40
     f7a:	c3                   	ret

00000f7b <sbrk>:
SYSCALL(sbrk)
     f7b:	b8 0c 00 00 00       	mov    $0xc,%eax
     f80:	cd 40                	int    $0x40
     f82:	c3                   	ret

00000f83 <sleep>:
SYSCALL(sleep)
     f83:	b8 0d 00 00 00       	mov    $0xd,%eax
     f88:	cd 40                	int    $0x40
     f8a:	c3                   	ret

00000f8b <uptime>:
SYSCALL(uptime)
     f8b:	b8 0e 00 00 00       	mov    $0xe,%eax
     f90:	cd 40                	int    $0x40
     f92:	c3                   	ret

00000f93 <shutdown>:
SYSCALL(shutdown)
     f93:	b8 16 00 00 00       	mov    $0x16,%eax
     f98:	cd 40                	int    $0x40
     f9a:	c3                   	ret

00000f9b <cps>:
SYSCALL(cps)
     f9b:	b8 17 00 00 00       	mov    $0x17,%eax
     fa0:	cd 40                	int    $0x40
     fa2:	c3                   	ret

00000fa3 <chpr>:
SYSCALL(chpr)
     fa3:	b8 18 00 00 00       	mov    $0x18,%eax
     fa8:	cd 40                	int    $0x40
     faa:	c3                   	ret

00000fab <waitpid>:
SYSCALL(waitpid)
     fab:	b8 17 00 00 00       	mov    $0x17,%eax
     fb0:	cd 40                	int    $0x40
     fb2:	c3                   	ret
     fb3:	66 90                	xchg   %ax,%ax
     fb5:	66 90                	xchg   %ax,%ax
     fb7:	66 90                	xchg   %ax,%ax
     fb9:	66 90                	xchg   %ax,%ax
     fbb:	66 90                	xchg   %ax,%ax
     fbd:	66 90                	xchg   %ax,%ax
     fbf:	90                   	nop

00000fc0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     fc0:	55                   	push   %ebp
     fc1:	89 e5                	mov    %esp,%ebp
     fc3:	57                   	push   %edi
     fc4:	56                   	push   %esi
     fc5:	53                   	push   %ebx
     fc6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     fc8:	89 d1                	mov    %edx,%ecx
{
     fca:	83 ec 3c             	sub    $0x3c,%esp
     fcd:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
     fd0:	85 d2                	test   %edx,%edx
     fd2:	0f 89 80 00 00 00    	jns    1058 <printint+0x98>
     fd8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     fdc:	74 7a                	je     1058 <printint+0x98>
    x = -xx;
     fde:	f7 d9                	neg    %ecx
    neg = 1;
     fe0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
     fe5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
     fe8:	31 f6                	xor    %esi,%esi
     fea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     ff0:	89 c8                	mov    %ecx,%eax
     ff2:	31 d2                	xor    %edx,%edx
     ff4:	89 f7                	mov    %esi,%edi
     ff6:	f7 f3                	div    %ebx
     ff8:	8d 76 01             	lea    0x1(%esi),%esi
     ffb:	0f b6 92 ec 14 00 00 	movzbl 0x14ec(%edx),%edx
    1002:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
    1006:	89 ca                	mov    %ecx,%edx
    1008:	89 c1                	mov    %eax,%ecx
    100a:	39 da                	cmp    %ebx,%edx
    100c:	73 e2                	jae    ff0 <printint+0x30>
  if(neg)
    100e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1011:	85 c0                	test   %eax,%eax
    1013:	74 07                	je     101c <printint+0x5c>
    buf[i++] = '-';
    1015:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
    buf[i++] = digits[x % base];
    101a:	89 f7                	mov    %esi,%edi
    101c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
    101f:	8b 75 c0             	mov    -0x40(%ebp),%esi
    1022:	01 df                	add    %ebx,%edi
    1024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  while(--i >= 0)
    putc(fd, buf[i]);
    1028:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
    102b:	83 ec 04             	sub    $0x4,%esp
    102e:	88 45 d7             	mov    %al,-0x29(%ebp)
    1031:	8d 45 d7             	lea    -0x29(%ebp),%eax
    1034:	6a 01                	push   $0x1
    1036:	50                   	push   %eax
    1037:	56                   	push   %esi
    1038:	e8 d6 fe ff ff       	call   f13 <write>
  while(--i >= 0)
    103d:	89 f8                	mov    %edi,%eax
    103f:	83 c4 10             	add    $0x10,%esp
    1042:	83 ef 01             	sub    $0x1,%edi
    1045:	39 d8                	cmp    %ebx,%eax
    1047:	75 df                	jne    1028 <printint+0x68>
}
    1049:	8d 65 f4             	lea    -0xc(%ebp),%esp
    104c:	5b                   	pop    %ebx
    104d:	5e                   	pop    %esi
    104e:	5f                   	pop    %edi
    104f:	5d                   	pop    %ebp
    1050:	c3                   	ret
    1051:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1058:	31 c0                	xor    %eax,%eax
    105a:	eb 89                	jmp    fe5 <printint+0x25>
    105c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001060 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	57                   	push   %edi
    1064:	56                   	push   %esi
    1065:	53                   	push   %ebx
    1066:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1069:	8b 75 0c             	mov    0xc(%ebp),%esi
{
    106c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
    106f:	0f b6 1e             	movzbl (%esi),%ebx
    1072:	83 c6 01             	add    $0x1,%esi
    1075:	84 db                	test   %bl,%bl
    1077:	74 67                	je     10e0 <printf+0x80>
    1079:	8d 4d 10             	lea    0x10(%ebp),%ecx
    107c:	31 d2                	xor    %edx,%edx
    107e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
    1081:	eb 34                	jmp    10b7 <printf+0x57>
    1083:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1087:	90                   	nop
    1088:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    108b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1090:	83 f8 25             	cmp    $0x25,%eax
    1093:	74 18                	je     10ad <printf+0x4d>
  write(fd, &c, 1);
    1095:	83 ec 04             	sub    $0x4,%esp
    1098:	8d 45 e7             	lea    -0x19(%ebp),%eax
    109b:	88 5d e7             	mov    %bl,-0x19(%ebp)
    109e:	6a 01                	push   $0x1
    10a0:	50                   	push   %eax
    10a1:	57                   	push   %edi
    10a2:	e8 6c fe ff ff       	call   f13 <write>
    10a7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    10aa:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    10ad:	0f b6 1e             	movzbl (%esi),%ebx
    10b0:	83 c6 01             	add    $0x1,%esi
    10b3:	84 db                	test   %bl,%bl
    10b5:	74 29                	je     10e0 <printf+0x80>
    c = fmt[i] & 0xff;
    10b7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    10ba:	85 d2                	test   %edx,%edx
    10bc:	74 ca                	je     1088 <printf+0x28>
      }
    } else if(state == '%'){
    10be:	83 fa 25             	cmp    $0x25,%edx
    10c1:	75 ea                	jne    10ad <printf+0x4d>
      if(c == 'd'){
    10c3:	83 f8 25             	cmp    $0x25,%eax
    10c6:	0f 84 24 01 00 00    	je     11f0 <printf+0x190>
    10cc:	83 e8 63             	sub    $0x63,%eax
    10cf:	83 f8 15             	cmp    $0x15,%eax
    10d2:	77 1c                	ja     10f0 <printf+0x90>
    10d4:	ff 24 85 94 14 00 00 	jmp    *0x1494(,%eax,4)
    10db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10df:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    10e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    10e3:	5b                   	pop    %ebx
    10e4:	5e                   	pop    %esi
    10e5:	5f                   	pop    %edi
    10e6:	5d                   	pop    %ebp
    10e7:	c3                   	ret
    10e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ef:	90                   	nop
  write(fd, &c, 1);
    10f0:	83 ec 04             	sub    $0x4,%esp
    10f3:	8d 55 e7             	lea    -0x19(%ebp),%edx
    10f6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    10fa:	6a 01                	push   $0x1
    10fc:	52                   	push   %edx
    10fd:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    1100:	57                   	push   %edi
    1101:	e8 0d fe ff ff       	call   f13 <write>
    1106:	83 c4 0c             	add    $0xc,%esp
    1109:	88 5d e7             	mov    %bl,-0x19(%ebp)
    110c:	6a 01                	push   $0x1
    110e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1111:	52                   	push   %edx
    1112:	57                   	push   %edi
    1113:	e8 fb fd ff ff       	call   f13 <write>
        putc(fd, c);
    1118:	83 c4 10             	add    $0x10,%esp
      state = 0;
    111b:	31 d2                	xor    %edx,%edx
    111d:	eb 8e                	jmp    10ad <printf+0x4d>
    111f:	90                   	nop
        printint(fd, *ap, 16, 0);
    1120:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1123:	83 ec 0c             	sub    $0xc,%esp
    1126:	b9 10 00 00 00       	mov    $0x10,%ecx
    112b:	8b 13                	mov    (%ebx),%edx
    112d:	6a 00                	push   $0x0
    112f:	89 f8                	mov    %edi,%eax
        ap++;
    1131:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
    1134:	e8 87 fe ff ff       	call   fc0 <printint>
        ap++;
    1139:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    113c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    113f:	31 d2                	xor    %edx,%edx
    1141:	e9 67 ff ff ff       	jmp    10ad <printf+0x4d>
    1146:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    114d:	8d 76 00             	lea    0x0(%esi),%esi
        s = (char*)*ap;
    1150:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1153:	8b 18                	mov    (%eax),%ebx
        ap++;
    1155:	83 c0 04             	add    $0x4,%eax
    1158:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    115b:	85 db                	test   %ebx,%ebx
    115d:	0f 84 9d 00 00 00    	je     1200 <printf+0x1a0>
        while(*s != 0){
    1163:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    1166:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    1168:	84 c0                	test   %al,%al
    116a:	0f 84 3d ff ff ff    	je     10ad <printf+0x4d>
    1170:	8d 55 e7             	lea    -0x19(%ebp),%edx
    1173:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    1176:	89 de                	mov    %ebx,%esi
    1178:	89 d3                	mov    %edx,%ebx
    117a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1180:	83 ec 04             	sub    $0x4,%esp
    1183:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
    1186:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1189:	6a 01                	push   $0x1
    118b:	53                   	push   %ebx
    118c:	57                   	push   %edi
    118d:	e8 81 fd ff ff       	call   f13 <write>
        while(*s != 0){
    1192:	0f b6 06             	movzbl (%esi),%eax
    1195:	83 c4 10             	add    $0x10,%esp
    1198:	84 c0                	test   %al,%al
    119a:	75 e4                	jne    1180 <printf+0x120>
      state = 0;
    119c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    119f:	31 d2                	xor    %edx,%edx
    11a1:	e9 07 ff ff ff       	jmp    10ad <printf+0x4d>
    11a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ad:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    11b0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    11b3:	83 ec 0c             	sub    $0xc,%esp
    11b6:	b9 0a 00 00 00       	mov    $0xa,%ecx
    11bb:	8b 13                	mov    (%ebx),%edx
    11bd:	6a 01                	push   $0x1
    11bf:	e9 6b ff ff ff       	jmp    112f <printf+0xcf>
    11c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    11c8:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    11cb:	83 ec 04             	sub    $0x4,%esp
    11ce:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
    11d1:	8b 03                	mov    (%ebx),%eax
        ap++;
    11d3:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
    11d6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    11d9:	6a 01                	push   $0x1
    11db:	52                   	push   %edx
    11dc:	57                   	push   %edi
    11dd:	e8 31 fd ff ff       	call   f13 <write>
        ap++;
    11e2:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    11e5:	83 c4 10             	add    $0x10,%esp
      state = 0;
    11e8:	31 d2                	xor    %edx,%edx
    11ea:	e9 be fe ff ff       	jmp    10ad <printf+0x4d>
    11ef:	90                   	nop
  write(fd, &c, 1);
    11f0:	83 ec 04             	sub    $0x4,%esp
    11f3:	88 5d e7             	mov    %bl,-0x19(%ebp)
    11f6:	8d 55 e7             	lea    -0x19(%ebp),%edx
    11f9:	6a 01                	push   $0x1
    11fb:	e9 11 ff ff ff       	jmp    1111 <printf+0xb1>
    1200:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
    1205:	bb 8c 14 00 00       	mov    $0x148c,%ebx
    120a:	e9 61 ff ff ff       	jmp    1170 <printf+0x110>
    120f:	90                   	nop

00001210 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1210:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1211:	a1 a4 1b 00 00       	mov    0x1ba4,%eax
{
    1216:	89 e5                	mov    %esp,%ebp
    1218:	57                   	push   %edi
    1219:	56                   	push   %esi
    121a:	53                   	push   %ebx
    121b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    121e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1228:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    122a:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    122c:	39 ca                	cmp    %ecx,%edx
    122e:	73 30                	jae    1260 <free+0x50>
    1230:	39 c1                	cmp    %eax,%ecx
    1232:	72 04                	jb     1238 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1234:	39 c2                	cmp    %eax,%edx
    1236:	72 f0                	jb     1228 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1238:	8b 73 fc             	mov    -0x4(%ebx),%esi
    123b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    123e:	39 f8                	cmp    %edi,%eax
    1240:	74 2e                	je     1270 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1242:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1245:	8b 42 04             	mov    0x4(%edx),%eax
    1248:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    124b:	39 f1                	cmp    %esi,%ecx
    124d:	74 38                	je     1287 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    124f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1251:	5b                   	pop    %ebx
  freep = p;
    1252:	89 15 a4 1b 00 00    	mov    %edx,0x1ba4
}
    1258:	5e                   	pop    %esi
    1259:	5f                   	pop    %edi
    125a:	5d                   	pop    %ebp
    125b:	c3                   	ret
    125c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1260:	39 c1                	cmp    %eax,%ecx
    1262:	72 d0                	jb     1234 <free+0x24>
    1264:	eb c2                	jmp    1228 <free+0x18>
    1266:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    126d:	8d 76 00             	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
    1270:	03 70 04             	add    0x4(%eax),%esi
    1273:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1276:	8b 02                	mov    (%edx),%eax
    1278:	8b 00                	mov    (%eax),%eax
    127a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    127d:	8b 42 04             	mov    0x4(%edx),%eax
    1280:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1283:	39 f1                	cmp    %esi,%ecx
    1285:	75 c8                	jne    124f <free+0x3f>
    p->s.size += bp->s.size;
    1287:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    128a:	89 15 a4 1b 00 00    	mov    %edx,0x1ba4
    p->s.size += bp->s.size;
    1290:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1293:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1296:	89 0a                	mov    %ecx,(%edx)
}
    1298:	5b                   	pop    %ebx
    1299:	5e                   	pop    %esi
    129a:	5f                   	pop    %edi
    129b:	5d                   	pop    %ebp
    129c:	c3                   	ret
    129d:	8d 76 00             	lea    0x0(%esi),%esi

000012a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	57                   	push   %edi
    12a4:	56                   	push   %esi
    12a5:	53                   	push   %ebx
    12a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    12a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    12ac:	8b 15 a4 1b 00 00    	mov    0x1ba4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    12b2:	8d 78 07             	lea    0x7(%eax),%edi
    12b5:	c1 ef 03             	shr    $0x3,%edi
    12b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    12bb:	85 d2                	test   %edx,%edx
    12bd:	0f 84 8d 00 00 00    	je     1350 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    12c3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    12c5:	8b 48 04             	mov    0x4(%eax),%ecx
    12c8:	39 f9                	cmp    %edi,%ecx
    12ca:	73 64                	jae    1330 <malloc+0x90>
  if(nu < 4096)
    12cc:	bb 00 10 00 00       	mov    $0x1000,%ebx
    12d1:	39 df                	cmp    %ebx,%edi
    12d3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    12d6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    12dd:	eb 0a                	jmp    12e9 <malloc+0x49>
    12df:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    12e0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    12e2:	8b 48 04             	mov    0x4(%eax),%ecx
    12e5:	39 f9                	cmp    %edi,%ecx
    12e7:	73 47                	jae    1330 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    12e9:	89 c2                	mov    %eax,%edx
    12eb:	39 05 a4 1b 00 00    	cmp    %eax,0x1ba4
    12f1:	75 ed                	jne    12e0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
    12f3:	83 ec 0c             	sub    $0xc,%esp
    12f6:	56                   	push   %esi
    12f7:	e8 7f fc ff ff       	call   f7b <sbrk>
  if(p == (char*)-1)
    12fc:	83 c4 10             	add    $0x10,%esp
    12ff:	83 f8 ff             	cmp    $0xffffffff,%eax
    1302:	74 1c                	je     1320 <malloc+0x80>
  hp->s.size = nu;
    1304:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1307:	83 ec 0c             	sub    $0xc,%esp
    130a:	83 c0 08             	add    $0x8,%eax
    130d:	50                   	push   %eax
    130e:	e8 fd fe ff ff       	call   1210 <free>
  return freep;
    1313:	8b 15 a4 1b 00 00    	mov    0x1ba4,%edx
      if((p = morecore(nunits)) == 0)
    1319:	83 c4 10             	add    $0x10,%esp
    131c:	85 d2                	test   %edx,%edx
    131e:	75 c0                	jne    12e0 <malloc+0x40>
        return 0;
  }
}
    1320:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1323:	31 c0                	xor    %eax,%eax
}
    1325:	5b                   	pop    %ebx
    1326:	5e                   	pop    %esi
    1327:	5f                   	pop    %edi
    1328:	5d                   	pop    %ebp
    1329:	c3                   	ret
    132a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1330:	39 cf                	cmp    %ecx,%edi
    1332:	74 4c                	je     1380 <malloc+0xe0>
        p->s.size -= nunits;
    1334:	29 f9                	sub    %edi,%ecx
    1336:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1339:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    133c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    133f:	89 15 a4 1b 00 00    	mov    %edx,0x1ba4
}
    1345:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1348:	83 c0 08             	add    $0x8,%eax
}
    134b:	5b                   	pop    %ebx
    134c:	5e                   	pop    %esi
    134d:	5f                   	pop    %edi
    134e:	5d                   	pop    %ebp
    134f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
    1350:	c7 05 a4 1b 00 00 a8 	movl   $0x1ba8,0x1ba4
    1357:	1b 00 00 
    base.s.size = 0;
    135a:	b8 a8 1b 00 00       	mov    $0x1ba8,%eax
    base.s.ptr = freep = prevp = &base;
    135f:	c7 05 a8 1b 00 00 a8 	movl   $0x1ba8,0x1ba8
    1366:	1b 00 00 
    base.s.size = 0;
    1369:	c7 05 ac 1b 00 00 00 	movl   $0x0,0x1bac
    1370:	00 00 00 
    if(p->s.size >= nunits){
    1373:	e9 54 ff ff ff       	jmp    12cc <malloc+0x2c>
    1378:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    137f:	90                   	nop
        prevp->s.ptr = p->s.ptr;
    1380:	8b 08                	mov    (%eax),%ecx
    1382:	89 0a                	mov    %ecx,(%edx)
    1384:	eb b9                	jmp    133f <malloc+0x9f>
