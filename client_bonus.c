/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bperron <bperron@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/05/06 12:40:22 by bperron           #+#    #+#             */
/*   Updated: 2022/05/17 11:26:12 by bperron          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk_bonus.h"

static void	sighandler(int signum, siginfo_t *s_info, void *content)
{
	static int	nb = 0;

	(void) s_info;
	(void) content;
	if (signum == SIGUSR1)
		nb++;
	else if (signum == SIGUSR2)
		ft_printf ("Number of characters written : %d\n", nb);
}

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
	if (ac > 3)
	{
		ft_printf("The number of argument entered is incorrect.\n");
		return (1);
	}
	else if (!ft_strlen(av[2]))
	{
		ft_printf("The string passed is empty.\n");
		return (1);
	}
	else if (pid > 99998 || pid < 1)
	{
		ft_printf("The PID is invalid.\n");
		return (1);
	}
	return (0);
}

int	main(int ac, char *av[])
{
	int					pid;
	int					i;
	struct sigaction	s_sig;

	ft_memset(&s_sig, 0, sizeof(s_sig));
	s_sig.sa_sigaction = &sighandler;
	sigaction(SIGUSR1, &s_sig, NULL);
	sigaction(SIGUSR2, &s_sig, NULL);
	i = 0;
	if (ac < 3)
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
