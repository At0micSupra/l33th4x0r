#include <stdio.h>

/*
Th15 15 4 51mp13 pr06r4m d3516n3d 70 c0nv3r7 y0u 1n70 4 1337 h4x0r.
*/
int main() {
	char c = '.';
	while((c = getchar()) != EOF) {
		switch(c) {
			case 'a':
				putchar('4');
				break;
			case 'b':
				putchar('8');
				break;
			case 'e':
				putchar('3');
				break;
			case 'i':
				putchar('1');
				break;
			case 'l':
				putchar('1');
				break;
			case 'g':
				putchar('6');
				break;
			case 'o':
				putchar('0');
				break;
			case 's':
				putchar('5');
				break;
			case 't':
				putchar('7');
				break;
			case 'z':
				putchar('2');
				break;
			default:
				putchar(c);
				break;
		}
		
	}
	
}
