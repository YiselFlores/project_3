
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	bb 01 00 00 00       	mov    $0x1,%ebx
  15:	51                   	push   %ecx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 31                	mov    (%ecx),%esi
  1b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  1e:	83 fe 01             	cmp    $0x1,%esi
  21:	7e 27                	jle    4a <main+0x4a>
  23:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  27:	90                   	nop
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	ff 34 9f             	push   (%edi,%ebx,4)
  for(i=1; i<argc; i++)
  2e:	83 c3 01             	add    $0x1,%ebx
    kill(atoi(argv[i]));
  31:	e8 fa 01 00 00       	call   230 <atoi>
  36:	89 04 24             	mov    %eax,(%esp)
  39:	e8 95 02 00 00       	call   2d3 <kill>
  for(i=1; i<argc; i++)
  3e:	83 c4 10             	add    $0x10,%esp
  41:	39 de                	cmp    %ebx,%esi
  43:	75 e3                	jne    28 <main+0x28>
  exit();
  45:	e8 59 02 00 00       	call   2a3 <exit>
    printf(2, "usage: kill pid...\n");
  4a:	50                   	push   %eax
  4b:	50                   	push   %eax
  4c:	68 38 07 00 00       	push   $0x738
  51:	6a 02                	push   $0x2
  53:	e8 b8 03 00 00       	call   410 <printf>
    exit();
  58:	e8 46 02 00 00       	call   2a3 <exit>
  5d:	66 90                	xchg   %ax,%ax
  5f:	90                   	nop

00000060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  60:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  61:	31 c0                	xor    %eax,%eax
{
  63:	89 e5                	mov    %esp,%ebp
  65:	53                   	push   %ebx
  66:	8b 4d 08             	mov    0x8(%ebp),%ecx
  69:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  70:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  74:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  77:	83 c0 01             	add    $0x1,%eax
  7a:	84 d2                	test   %dl,%dl
  7c:	75 f2                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  81:	89 c8                	mov    %ecx,%eax
  83:	c9                   	leave
  84:	c3                   	ret
  85:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	53                   	push   %ebx
  94:	8b 55 08             	mov    0x8(%ebp),%edx
  97:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  9a:	0f b6 02             	movzbl (%edx),%eax
  9d:	84 c0                	test   %al,%al
  9f:	75 17                	jne    b8 <strcmp+0x28>
  a1:	eb 3a                	jmp    dd <strcmp+0x4d>
  a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  a7:	90                   	nop
  a8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  ac:	83 c2 01             	add    $0x1,%edx
  af:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  b2:	84 c0                	test   %al,%al
  b4:	74 1a                	je     d0 <strcmp+0x40>
    p++, q++;
  b6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  b8:	0f b6 19             	movzbl (%ecx),%ebx
  bb:	38 c3                	cmp    %al,%bl
  bd:	74 e9                	je     a8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  bf:	29 d8                	sub    %ebx,%eax
}
  c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c4:	c9                   	leave
  c5:	c3                   	ret
  c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  d0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  d4:	31 c0                	xor    %eax,%eax
  d6:	29 d8                	sub    %ebx,%eax
}
  d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  db:	c9                   	leave
  dc:	c3                   	ret
  return (uchar)*p - (uchar)*q;
  dd:	0f b6 19             	movzbl (%ecx),%ebx
  e0:	31 c0                	xor    %eax,%eax
  e2:	eb db                	jmp    bf <strcmp+0x2f>
  e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ef:	90                   	nop

000000f0 <strlen>:

uint
strlen(char *s)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  f6:	80 3a 00             	cmpb   $0x0,(%edx)
  f9:	74 15                	je     110 <strlen+0x20>
  fb:	31 c0                	xor    %eax,%eax
  fd:	8d 76 00             	lea    0x0(%esi),%esi
 100:	83 c0 01             	add    $0x1,%eax
 103:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 107:	89 c1                	mov    %eax,%ecx
 109:	75 f5                	jne    100 <strlen+0x10>
    ;
  return n;
}
 10b:	89 c8                	mov    %ecx,%eax
 10d:	5d                   	pop    %ebp
 10e:	c3                   	ret
 10f:	90                   	nop
  for(n = 0; s[n]; n++)
 110:	31 c9                	xor    %ecx,%ecx
}
 112:	5d                   	pop    %ebp
 113:	89 c8                	mov    %ecx,%eax
 115:	c3                   	ret
 116:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11d:	8d 76 00             	lea    0x0(%esi),%esi

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 127:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	89 d7                	mov    %edx,%edi
 12f:	fc                   	cld
 130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 132:	8b 7d fc             	mov    -0x4(%ebp),%edi
 135:	89 d0                	mov    %edx,%eax
 137:	c9                   	leave
 138:	c3                   	ret
 139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 14a:	0f b6 10             	movzbl (%eax),%edx
 14d:	84 d2                	test   %dl,%dl
 14f:	75 12                	jne    163 <strchr+0x23>
 151:	eb 1d                	jmp    170 <strchr+0x30>
 153:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 157:	90                   	nop
 158:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 15c:	83 c0 01             	add    $0x1,%eax
 15f:	84 d2                	test   %dl,%dl
 161:	74 0d                	je     170 <strchr+0x30>
    if(*s == c)
 163:	38 d1                	cmp    %dl,%cl
 165:	75 f1                	jne    158 <strchr+0x18>
      return (char*)s;
  return 0;
}
 167:	5d                   	pop    %ebp
 168:	c3                   	ret
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 170:	31 c0                	xor    %eax,%eax
}
 172:	5d                   	pop    %ebp
 173:	c3                   	ret
 174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 17f:	90                   	nop

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 185:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 188:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 189:	31 db                	xor    %ebx,%ebx
{
 18b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 18e:	eb 27                	jmp    1b7 <gets+0x37>
    cc = read(0, &c, 1);
 190:	83 ec 04             	sub    $0x4,%esp
 193:	6a 01                	push   $0x1
 195:	56                   	push   %esi
 196:	6a 00                	push   $0x0
 198:	e8 1e 01 00 00       	call   2bb <read>
    if(cc < 1)
 19d:	83 c4 10             	add    $0x10,%esp
 1a0:	85 c0                	test   %eax,%eax
 1a2:	7e 1d                	jle    1c1 <gets+0x41>
      break;
    buf[i++] = c;
 1a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1a8:	8b 55 08             	mov    0x8(%ebp),%edx
 1ab:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1af:	3c 0a                	cmp    $0xa,%al
 1b1:	74 10                	je     1c3 <gets+0x43>
 1b3:	3c 0d                	cmp    $0xd,%al
 1b5:	74 0c                	je     1c3 <gets+0x43>
  for(i=0; i+1 < max; ){
 1b7:	89 df                	mov    %ebx,%edi
 1b9:	83 c3 01             	add    $0x1,%ebx
 1bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1bf:	7c cf                	jl     190 <gets+0x10>
 1c1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 1c3:	8b 45 08             	mov    0x8(%ebp),%eax
 1c6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 1ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1cd:	5b                   	pop    %ebx
 1ce:	5e                   	pop    %esi
 1cf:	5f                   	pop    %edi
 1d0:	5d                   	pop    %ebp
 1d1:	c3                   	ret
 1d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001e0 <stat>:

int
stat(char *n, struct stat *st)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	56                   	push   %esi
 1e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e5:	83 ec 08             	sub    $0x8,%esp
 1e8:	6a 00                	push   $0x0
 1ea:	ff 75 08             	push   0x8(%ebp)
 1ed:	e8 f1 00 00 00       	call   2e3 <open>
  if(fd < 0)
 1f2:	83 c4 10             	add    $0x10,%esp
 1f5:	85 c0                	test   %eax,%eax
 1f7:	78 27                	js     220 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1f9:	83 ec 08             	sub    $0x8,%esp
 1fc:	ff 75 0c             	push   0xc(%ebp)
 1ff:	89 c3                	mov    %eax,%ebx
 201:	50                   	push   %eax
 202:	e8 f4 00 00 00       	call   2fb <fstat>
  close(fd);
 207:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 20a:	89 c6                	mov    %eax,%esi
  close(fd);
 20c:	e8 ba 00 00 00       	call   2cb <close>
  return r;
 211:	83 c4 10             	add    $0x10,%esp
}
 214:	8d 65 f8             	lea    -0x8(%ebp),%esp
 217:	89 f0                	mov    %esi,%eax
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret
 21d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 220:	be ff ff ff ff       	mov    $0xffffffff,%esi
 225:	eb ed                	jmp    214 <stat+0x34>
 227:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22e:	66 90                	xchg   %ax,%ax

00000230 <atoi>:

int
atoi(const char *s)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	53                   	push   %ebx
 234:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 237:	0f be 02             	movsbl (%edx),%eax
 23a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 23d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 240:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 245:	77 1e                	ja     265 <atoi+0x35>
 247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 250:	83 c2 01             	add    $0x1,%edx
 253:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 256:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 25a:	0f be 02             	movsbl (%edx),%eax
 25d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 260:	80 fb 09             	cmp    $0x9,%bl
 263:	76 eb                	jbe    250 <atoi+0x20>
  return n;
}
 265:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 268:	89 c8                	mov    %ecx,%eax
 26a:	c9                   	leave
 26b:	c3                   	ret
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	56                   	push   %esi
 275:	8b 45 10             	mov    0x10(%ebp),%eax
 278:	8b 55 08             	mov    0x8(%ebp),%edx
 27b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 27e:	85 c0                	test   %eax,%eax
 280:	7e 13                	jle    295 <memmove+0x25>
 282:	01 d0                	add    %edx,%eax
  dst = vdst;
 284:	89 d7                	mov    %edx,%edi
 286:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 290:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 291:	39 f8                	cmp    %edi,%eax
 293:	75 fb                	jne    290 <memmove+0x20>
  return vdst;
}
 295:	5e                   	pop    %esi
 296:	89 d0                	mov    %edx,%eax
 298:	5f                   	pop    %edi
 299:	5d                   	pop    %ebp
 29a:	c3                   	ret

0000029b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 29b:	b8 01 00 00 00       	mov    $0x1,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret

000002a3 <exit>:
SYSCALL(exit)
 2a3:	b8 02 00 00 00       	mov    $0x2,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret

000002ab <wait>:
SYSCALL(wait)
 2ab:	b8 03 00 00 00       	mov    $0x3,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret

000002b3 <pipe>:
SYSCALL(pipe)
 2b3:	b8 04 00 00 00       	mov    $0x4,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret

000002bb <read>:
SYSCALL(read)
 2bb:	b8 05 00 00 00       	mov    $0x5,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret

000002c3 <write>:
SYSCALL(write)
 2c3:	b8 10 00 00 00       	mov    $0x10,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret

000002cb <close>:
SYSCALL(close)
 2cb:	b8 15 00 00 00       	mov    $0x15,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret

000002d3 <kill>:
SYSCALL(kill)
 2d3:	b8 06 00 00 00       	mov    $0x6,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret

000002db <exec>:
SYSCALL(exec)
 2db:	b8 07 00 00 00       	mov    $0x7,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret

000002e3 <open>:
SYSCALL(open)
 2e3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret

000002eb <mknod>:
SYSCALL(mknod)
 2eb:	b8 11 00 00 00       	mov    $0x11,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret

000002f3 <unlink>:
SYSCALL(unlink)
 2f3:	b8 12 00 00 00       	mov    $0x12,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret

000002fb <fstat>:
SYSCALL(fstat)
 2fb:	b8 08 00 00 00       	mov    $0x8,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret

00000303 <link>:
SYSCALL(link)
 303:	b8 13 00 00 00       	mov    $0x13,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret

0000030b <mkdir>:
SYSCALL(mkdir)
 30b:	b8 14 00 00 00       	mov    $0x14,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret

00000313 <chdir>:
SYSCALL(chdir)
 313:	b8 09 00 00 00       	mov    $0x9,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret

0000031b <dup>:
SYSCALL(dup)
 31b:	b8 0a 00 00 00       	mov    $0xa,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret

00000323 <getpid>:
SYSCALL(getpid)
 323:	b8 0b 00 00 00       	mov    $0xb,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret

0000032b <sbrk>:
SYSCALL(sbrk)
 32b:	b8 0c 00 00 00       	mov    $0xc,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret

00000333 <sleep>:
SYSCALL(sleep)
 333:	b8 0d 00 00 00       	mov    $0xd,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret

0000033b <uptime>:
SYSCALL(uptime)
 33b:	b8 0e 00 00 00       	mov    $0xe,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret

00000343 <shutdown>:
SYSCALL(shutdown)
 343:	b8 16 00 00 00       	mov    $0x16,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret

0000034b <cps>:
SYSCALL(cps)
 34b:	b8 17 00 00 00       	mov    $0x17,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret

00000353 <chpr>:
SYSCALL(chpr)
 353:	b8 18 00 00 00       	mov    $0x18,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret

0000035b <waitpid>:
SYSCALL(waitpid)
 35b:	b8 17 00 00 00       	mov    $0x17,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret
 363:	66 90                	xchg   %ax,%ax
 365:	66 90                	xchg   %ax,%ax
 367:	66 90                	xchg   %ax,%ax
 369:	66 90                	xchg   %ax,%ax
 36b:	66 90                	xchg   %ax,%ax
 36d:	66 90                	xchg   %ax,%ax
 36f:	90                   	nop

00000370 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	56                   	push   %esi
 375:	53                   	push   %ebx
 376:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 378:	89 d1                	mov    %edx,%ecx
{
 37a:	83 ec 3c             	sub    $0x3c,%esp
 37d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 380:	85 d2                	test   %edx,%edx
 382:	0f 89 80 00 00 00    	jns    408 <printint+0x98>
 388:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 38c:	74 7a                	je     408 <printint+0x98>
    x = -xx;
 38e:	f7 d9                	neg    %ecx
    neg = 1;
 390:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 395:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 398:	31 f6                	xor    %esi,%esi
 39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3a0:	89 c8                	mov    %ecx,%eax
 3a2:	31 d2                	xor    %edx,%edx
 3a4:	89 f7                	mov    %esi,%edi
 3a6:	f7 f3                	div    %ebx
 3a8:	8d 76 01             	lea    0x1(%esi),%esi
 3ab:	0f b6 92 ac 07 00 00 	movzbl 0x7ac(%edx),%edx
 3b2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 3b6:	89 ca                	mov    %ecx,%edx
 3b8:	89 c1                	mov    %eax,%ecx
 3ba:	39 da                	cmp    %ebx,%edx
 3bc:	73 e2                	jae    3a0 <printint+0x30>
  if(neg)
 3be:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3c1:	85 c0                	test   %eax,%eax
 3c3:	74 07                	je     3cc <printint+0x5c>
    buf[i++] = '-';
 3c5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
    buf[i++] = digits[x % base];
 3ca:	89 f7                	mov    %esi,%edi
 3cc:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 3cf:	8b 75 c0             	mov    -0x40(%ebp),%esi
 3d2:	01 df                	add    %ebx,%edi
 3d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  while(--i >= 0)
    putc(fd, buf[i]);
 3d8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 3db:	83 ec 04             	sub    $0x4,%esp
 3de:	88 45 d7             	mov    %al,-0x29(%ebp)
 3e1:	8d 45 d7             	lea    -0x29(%ebp),%eax
 3e4:	6a 01                	push   $0x1
 3e6:	50                   	push   %eax
 3e7:	56                   	push   %esi
 3e8:	e8 d6 fe ff ff       	call   2c3 <write>
  while(--i >= 0)
 3ed:	89 f8                	mov    %edi,%eax
 3ef:	83 c4 10             	add    $0x10,%esp
 3f2:	83 ef 01             	sub    $0x1,%edi
 3f5:	39 d8                	cmp    %ebx,%eax
 3f7:	75 df                	jne    3d8 <printint+0x68>
}
 3f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3fc:	5b                   	pop    %ebx
 3fd:	5e                   	pop    %esi
 3fe:	5f                   	pop    %edi
 3ff:	5d                   	pop    %ebp
 400:	c3                   	ret
 401:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 408:	31 c0                	xor    %eax,%eax
 40a:	eb 89                	jmp    395 <printint+0x25>
 40c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000410 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	53                   	push   %ebx
 416:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 419:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 41c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 41f:	0f b6 1e             	movzbl (%esi),%ebx
 422:	83 c6 01             	add    $0x1,%esi
 425:	84 db                	test   %bl,%bl
 427:	74 67                	je     490 <printf+0x80>
 429:	8d 4d 10             	lea    0x10(%ebp),%ecx
 42c:	31 d2                	xor    %edx,%edx
 42e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 431:	eb 34                	jmp    467 <printf+0x57>
 433:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 437:	90                   	nop
 438:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 43b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 440:	83 f8 25             	cmp    $0x25,%eax
 443:	74 18                	je     45d <printf+0x4d>
  write(fd, &c, 1);
 445:	83 ec 04             	sub    $0x4,%esp
 448:	8d 45 e7             	lea    -0x19(%ebp),%eax
 44b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 44e:	6a 01                	push   $0x1
 450:	50                   	push   %eax
 451:	57                   	push   %edi
 452:	e8 6c fe ff ff       	call   2c3 <write>
 457:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 45a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 45d:	0f b6 1e             	movzbl (%esi),%ebx
 460:	83 c6 01             	add    $0x1,%esi
 463:	84 db                	test   %bl,%bl
 465:	74 29                	je     490 <printf+0x80>
    c = fmt[i] & 0xff;
 467:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 46a:	85 d2                	test   %edx,%edx
 46c:	74 ca                	je     438 <printf+0x28>
      }
    } else if(state == '%'){
 46e:	83 fa 25             	cmp    $0x25,%edx
 471:	75 ea                	jne    45d <printf+0x4d>
      if(c == 'd'){
 473:	83 f8 25             	cmp    $0x25,%eax
 476:	0f 84 24 01 00 00    	je     5a0 <printf+0x190>
 47c:	83 e8 63             	sub    $0x63,%eax
 47f:	83 f8 15             	cmp    $0x15,%eax
 482:	77 1c                	ja     4a0 <printf+0x90>
 484:	ff 24 85 54 07 00 00 	jmp    *0x754(,%eax,4)
 48b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 48f:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 490:	8d 65 f4             	lea    -0xc(%ebp),%esp
 493:	5b                   	pop    %ebx
 494:	5e                   	pop    %esi
 495:	5f                   	pop    %edi
 496:	5d                   	pop    %ebp
 497:	c3                   	ret
 498:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49f:	90                   	nop
  write(fd, &c, 1);
 4a0:	83 ec 04             	sub    $0x4,%esp
 4a3:	8d 55 e7             	lea    -0x19(%ebp),%edx
 4a6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4aa:	6a 01                	push   $0x1
 4ac:	52                   	push   %edx
 4ad:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 4b0:	57                   	push   %edi
 4b1:	e8 0d fe ff ff       	call   2c3 <write>
 4b6:	83 c4 0c             	add    $0xc,%esp
 4b9:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4bc:	6a 01                	push   $0x1
 4be:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 4c1:	52                   	push   %edx
 4c2:	57                   	push   %edi
 4c3:	e8 fb fd ff ff       	call   2c3 <write>
        putc(fd, c);
 4c8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4cb:	31 d2                	xor    %edx,%edx
 4cd:	eb 8e                	jmp    45d <printf+0x4d>
 4cf:	90                   	nop
        printint(fd, *ap, 16, 0);
 4d0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4d3:	83 ec 0c             	sub    $0xc,%esp
 4d6:	b9 10 00 00 00       	mov    $0x10,%ecx
 4db:	8b 13                	mov    (%ebx),%edx
 4dd:	6a 00                	push   $0x0
 4df:	89 f8                	mov    %edi,%eax
        ap++;
 4e1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 4e4:	e8 87 fe ff ff       	call   370 <printint>
        ap++;
 4e9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 4ec:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4ef:	31 d2                	xor    %edx,%edx
 4f1:	e9 67 ff ff ff       	jmp    45d <printf+0x4d>
 4f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
        s = (char*)*ap;
 500:	8b 45 d0             	mov    -0x30(%ebp),%eax
 503:	8b 18                	mov    (%eax),%ebx
        ap++;
 505:	83 c0 04             	add    $0x4,%eax
 508:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 50b:	85 db                	test   %ebx,%ebx
 50d:	0f 84 9d 00 00 00    	je     5b0 <printf+0x1a0>
        while(*s != 0){
 513:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 516:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 518:	84 c0                	test   %al,%al
 51a:	0f 84 3d ff ff ff    	je     45d <printf+0x4d>
 520:	8d 55 e7             	lea    -0x19(%ebp),%edx
 523:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 526:	89 de                	mov    %ebx,%esi
 528:	89 d3                	mov    %edx,%ebx
 52a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 530:	83 ec 04             	sub    $0x4,%esp
 533:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 536:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 539:	6a 01                	push   $0x1
 53b:	53                   	push   %ebx
 53c:	57                   	push   %edi
 53d:	e8 81 fd ff ff       	call   2c3 <write>
        while(*s != 0){
 542:	0f b6 06             	movzbl (%esi),%eax
 545:	83 c4 10             	add    $0x10,%esp
 548:	84 c0                	test   %al,%al
 54a:	75 e4                	jne    530 <printf+0x120>
      state = 0;
 54c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 54f:	31 d2                	xor    %edx,%edx
 551:	e9 07 ff ff ff       	jmp    45d <printf+0x4d>
 556:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 560:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 563:	83 ec 0c             	sub    $0xc,%esp
 566:	b9 0a 00 00 00       	mov    $0xa,%ecx
 56b:	8b 13                	mov    (%ebx),%edx
 56d:	6a 01                	push   $0x1
 56f:	e9 6b ff ff ff       	jmp    4df <printf+0xcf>
 574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 578:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 57b:	83 ec 04             	sub    $0x4,%esp
 57e:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 581:	8b 03                	mov    (%ebx),%eax
        ap++;
 583:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 586:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 589:	6a 01                	push   $0x1
 58b:	52                   	push   %edx
 58c:	57                   	push   %edi
 58d:	e8 31 fd ff ff       	call   2c3 <write>
        ap++;
 592:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 595:	83 c4 10             	add    $0x10,%esp
      state = 0;
 598:	31 d2                	xor    %edx,%edx
 59a:	e9 be fe ff ff       	jmp    45d <printf+0x4d>
 59f:	90                   	nop
  write(fd, &c, 1);
 5a0:	83 ec 04             	sub    $0x4,%esp
 5a3:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5a6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 5a9:	6a 01                	push   $0x1
 5ab:	e9 11 ff ff ff       	jmp    4c1 <printf+0xb1>
 5b0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 5b5:	bb 4c 07 00 00       	mov    $0x74c,%ebx
 5ba:	e9 61 ff ff ff       	jmp    520 <printf+0x110>
 5bf:	90                   	nop

000005c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c1:	a1 58 0a 00 00       	mov    0xa58,%eax
{
 5c6:	89 e5                	mov    %esp,%ebp
 5c8:	57                   	push   %edi
 5c9:	56                   	push   %esi
 5ca:	53                   	push   %ebx
 5cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 5ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5d8:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5da:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5dc:	39 ca                	cmp    %ecx,%edx
 5de:	73 30                	jae    610 <free+0x50>
 5e0:	39 c1                	cmp    %eax,%ecx
 5e2:	72 04                	jb     5e8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5e4:	39 c2                	cmp    %eax,%edx
 5e6:	72 f0                	jb     5d8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5ee:	39 f8                	cmp    %edi,%eax
 5f0:	74 2e                	je     620 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 5f2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5f5:	8b 42 04             	mov    0x4(%edx),%eax
 5f8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5fb:	39 f1                	cmp    %esi,%ecx
 5fd:	74 38                	je     637 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 5ff:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 601:	5b                   	pop    %ebx
  freep = p;
 602:	89 15 58 0a 00 00    	mov    %edx,0xa58
}
 608:	5e                   	pop    %esi
 609:	5f                   	pop    %edi
 60a:	5d                   	pop    %ebp
 60b:	c3                   	ret
 60c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 610:	39 c1                	cmp    %eax,%ecx
 612:	72 d0                	jb     5e4 <free+0x24>
 614:	eb c2                	jmp    5d8 <free+0x18>
 616:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61d:	8d 76 00             	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 620:	03 70 04             	add    0x4(%eax),%esi
 623:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 626:	8b 02                	mov    (%edx),%eax
 628:	8b 00                	mov    (%eax),%eax
 62a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 62d:	8b 42 04             	mov    0x4(%edx),%eax
 630:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 633:	39 f1                	cmp    %esi,%ecx
 635:	75 c8                	jne    5ff <free+0x3f>
    p->s.size += bp->s.size;
 637:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 63a:	89 15 58 0a 00 00    	mov    %edx,0xa58
    p->s.size += bp->s.size;
 640:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 643:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 646:	89 0a                	mov    %ecx,(%edx)
}
 648:	5b                   	pop    %ebx
 649:	5e                   	pop    %esi
 64a:	5f                   	pop    %edi
 64b:	5d                   	pop    %ebp
 64c:	c3                   	ret
 64d:	8d 76 00             	lea    0x0(%esi),%esi

00000650 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	57                   	push   %edi
 654:	56                   	push   %esi
 655:	53                   	push   %ebx
 656:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 659:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 65c:	8b 15 58 0a 00 00    	mov    0xa58,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 662:	8d 78 07             	lea    0x7(%eax),%edi
 665:	c1 ef 03             	shr    $0x3,%edi
 668:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 66b:	85 d2                	test   %edx,%edx
 66d:	0f 84 8d 00 00 00    	je     700 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 673:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 675:	8b 48 04             	mov    0x4(%eax),%ecx
 678:	39 f9                	cmp    %edi,%ecx
 67a:	73 64                	jae    6e0 <malloc+0x90>
  if(nu < 4096)
 67c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 681:	39 df                	cmp    %ebx,%edi
 683:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 686:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 68d:	eb 0a                	jmp    699 <malloc+0x49>
 68f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 690:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 692:	8b 48 04             	mov    0x4(%eax),%ecx
 695:	39 f9                	cmp    %edi,%ecx
 697:	73 47                	jae    6e0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 699:	89 c2                	mov    %eax,%edx
 69b:	39 05 58 0a 00 00    	cmp    %eax,0xa58
 6a1:	75 ed                	jne    690 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 6a3:	83 ec 0c             	sub    $0xc,%esp
 6a6:	56                   	push   %esi
 6a7:	e8 7f fc ff ff       	call   32b <sbrk>
  if(p == (char*)-1)
 6ac:	83 c4 10             	add    $0x10,%esp
 6af:	83 f8 ff             	cmp    $0xffffffff,%eax
 6b2:	74 1c                	je     6d0 <malloc+0x80>
  hp->s.size = nu;
 6b4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6b7:	83 ec 0c             	sub    $0xc,%esp
 6ba:	83 c0 08             	add    $0x8,%eax
 6bd:	50                   	push   %eax
 6be:	e8 fd fe ff ff       	call   5c0 <free>
  return freep;
 6c3:	8b 15 58 0a 00 00    	mov    0xa58,%edx
      if((p = morecore(nunits)) == 0)
 6c9:	83 c4 10             	add    $0x10,%esp
 6cc:	85 d2                	test   %edx,%edx
 6ce:	75 c0                	jne    690 <malloc+0x40>
        return 0;
  }
}
 6d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 6d3:	31 c0                	xor    %eax,%eax
}
 6d5:	5b                   	pop    %ebx
 6d6:	5e                   	pop    %esi
 6d7:	5f                   	pop    %edi
 6d8:	5d                   	pop    %ebp
 6d9:	c3                   	ret
 6da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 6e0:	39 cf                	cmp    %ecx,%edi
 6e2:	74 4c                	je     730 <malloc+0xe0>
        p->s.size -= nunits;
 6e4:	29 f9                	sub    %edi,%ecx
 6e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6ec:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 6ef:	89 15 58 0a 00 00    	mov    %edx,0xa58
}
 6f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 6f8:	83 c0 08             	add    $0x8,%eax
}
 6fb:	5b                   	pop    %ebx
 6fc:	5e                   	pop    %esi
 6fd:	5f                   	pop    %edi
 6fe:	5d                   	pop    %ebp
 6ff:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 700:	c7 05 58 0a 00 00 5c 	movl   $0xa5c,0xa58
 707:	0a 00 00 
    base.s.size = 0;
 70a:	b8 5c 0a 00 00       	mov    $0xa5c,%eax
    base.s.ptr = freep = prevp = &base;
 70f:	c7 05 5c 0a 00 00 5c 	movl   $0xa5c,0xa5c
 716:	0a 00 00 
    base.s.size = 0;
 719:	c7 05 60 0a 00 00 00 	movl   $0x0,0xa60
 720:	00 00 00 
    if(p->s.size >= nunits){
 723:	e9 54 ff ff ff       	jmp    67c <malloc+0x2c>
 728:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 72f:	90                   	nop
        prevp->s.ptr = p->s.ptr;
 730:	8b 08                	mov    (%eax),%ecx
 732:	89 0a                	mov    %ecx,(%edx)
 734:	eb b9                	jmp    6ef <malloc+0x9f>
