/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   minitalk_bonus.h                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bperron <bperron@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/05/06 12:40:03 by bperron           #+#    #+#             */
/*   Updated: 2022/05/11 12:47:05 by bperron          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef MINITALK_BONUS_H
# define MINITALK_BONUS_H

# include <signal.h>
# include "libft/libft.h"
# include "ft_printf/ft_printf.h"

typedef struct s_character
{
	unsigned char	c;
	int				i;
}	t_char;

int		error(int ac, char *av[], int pid);
void	sendbin(char *str, int pid);

#endif
