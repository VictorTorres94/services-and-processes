#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>

#define merinero main

sig_atomic_t times;

void handler (int signal_number){
	times++;
}

int merinero(int argc, char *argv[]){

	struct sigaction sa;
	memset (&sa, 0, sizeof(sa));
	sa.sa_handler = &handler;
	sigaction (SIGINT, &sa, NULL);

	while(1){	
		printf("%i\n" , (int) times);
	}


	return EXIT_SUCCESS;
}
