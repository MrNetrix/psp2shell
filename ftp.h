/*
 * Copyright (c) 2015 Sergi Granell (xerpi)
 */

#ifndef FTP_H
#define FTP_H

#include <psp2/types.h>

/* Returns PSVita's IP and FTP port */
void ftp_init(char *vita_ip, unsigned short int *vita_port);
void ftp_fini();

#define DEBUG printf
#define INFO printf

#endif
