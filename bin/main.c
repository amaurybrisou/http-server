#include <stdio.h>
#include <stdlib.h>

int main(){
	char *str;
	str = malloc(16);
	_itoa(0xfff, str, 10);
	printf("%s\n", str);
	return 0;
}
