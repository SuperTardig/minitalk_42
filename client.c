/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bperron <bperron@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/05/06 12:40:22 by bperron           #+#    #+#             */
/*   Updated: 2022/05/09 13:55:25 by bperron          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void sendbin(char c, int pid)
{
    int a[8];   
    int i;

    i = 0; 
    while(c > 0)    
    {    
        a[i++]= c % 2;    
        c = c / 2;    
    }
    while (i-- > 0)
    {
        if (a[i] == 0)
            kill(pid, SIGUSR1);
        if (a[i] == 1)
            kill(pid, SIGUSR2);
        usleep(100);
    }
}

int main(int ac, char *av[])
{
    int pid;
    int i;

    i = 0;
    if (ac > 3 || ac < 3)
    {
        ft_printf("The number of argument entered is incorrect.\n");
        return (0);
    }
    pid = ft_atoi(av[1]);
    if (pid > 99998 || pid < 1)
    {
        ft_printf("The PID is invalid.\n");
        return (0);
    }
    while (av[2][i])
        sendbin(av[2][i++], pid);
}