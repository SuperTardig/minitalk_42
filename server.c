/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bperron <bperron@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/05/06 12:40:15 by bperron           #+#    #+#             */
/*   Updated: 2022/05/09 14:12:36 by bperron          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

char g_str[9];

void printbit(char *g_str)
{
    int i;

    i = 0;
    if (g_str[0] == '1')
        i += 64;
    if (g_str[1] == '1')
        i += 32;
    if (g_str[2] == '1')
        i += 16;
    if (g_str[3] == '1')
        i += 8;
    if (g_str[4] == '1')
        i += 4;
    if (g_str[5] == '1')
        i += 2;
    if (g_str[6] == '1')
        i += 1;
    ft_printf("%c", i);
}

void sighandler(int signum)
{
    static int i = 0;
    
    if (signum == SIGUSR1)
        g_str[i++] = '0';
    else if (signum == SIGUSR2)
        g_str[i++] = '1';
    if (ft_strlen(g_str) == 7)
    {
        printbit(g_str);
        i = 0;
        while (g_str[i])
            g_str[i++] = 0;
        i = 0;
    }
}

int main()
{
    ft_printf("The server PID is : %d\n", getpid());
    signal(SIGUSR1, sighandler);
    signal(SIGUSR2, sighandler);
    while (1)
        usleep(1);
}