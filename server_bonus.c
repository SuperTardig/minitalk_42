/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bperron <bperron@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/05/06 12:40:15 by bperron           #+#    #+#             */
/*   Updated: 2022/05/11 12:46:57 by bperron          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk_bonus.h"

t_char	g_character;

static void	sighandler(int signum, siginfo_t *s_info, void *content)
{
	(void) content;
	g_character.c |= (signum == SIGUSR2);
	if (++g_character.i == 8)
	{
		if (!g_character.c)
		{
			ft_printf("\n");
			kill(s_info->si_pid, SIGUSR2);
		}
		g_character.i = 0;
		ft_printf("%c", g_character.c);
		g_character.c = 0;
		kill(s_info->si_pid, SIGUSR1);
	}
	else
		g_character.c = g_character.c << 1;
}

int	main(void)
{
	struct sigaction	s_sig;

	ft_memset(&s_sig, 0, sizeof(s_sig));
	s_sig.sa_sigaction = &sighandler;
	ft_printf("The server PID is : %d\n", getpid());
	sigaction(SIGUSR1, &s_sig, NULL);
	sigaction(SIGUSR2, &s_sig, NULL);
	while (1)
		usleep(1);
}
