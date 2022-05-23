/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bperron <bperron@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/05/06 12:40:22 by bperron           #+#    #+#             */
/*   Updated: 2022/05/23 09:09:20 by bperron          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	sendbin(char *str, int pid)
{
	int	bin;

	while (*str)
	{
		bin = 128;
		while (bin > 0)
		{
			if (bin & *str)
				kill (pid, SIGUSR2);
			else
				kill (pid, SIGUSR1);
			bin /= 2;
			usleep(100);
		}
		str++;
	}
	bin = 8;
	while (bin-- > 0)
	{
		kill(pid, SIGUSR1);
		usleep(100);
	}
}

int	error(int ac, char *av[], int pid)
{
	if (pid > 99998 || pid < 1)
	{
		ft_printf("The PID is invalid.\n");
		return (1);
	}
	else if (ac > 3 || ac < 3)
	{
		ft_printf("The number of argument entered is incorrect.\n");
		return (1);
	}
	else if (!ft_strlen(av[2]))
	{
		ft_printf("The string passed is empty.\n");
		return (1);
	}
	return (0);
}

int	main(int ac, char *av[])
{
	int					pid;
	int					i;

	i = 0;
	if (ac < 2)
	{
		ft_printf("The number of argument entered is incorrect.\n");
		return (1);
	}
	pid = ft_atoi(av[1]);
	if (error(ac, av, pid) == 1)
		return (1);
	ft_printf("Number of character sent : %d\n", ft_strlen(av[2]));
	sendbin(av[2], pid);
}
