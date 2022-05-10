/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printformatchar.c                               :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bperron <bperron@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/11 10:09:59 by bperron           #+#    #+#             */
/*   Updated: 2022/04/11 13:16:03 by bperron          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	ft_printfc(char c)
{
	write (1, &c, 1);
	return (1);
}

int	ft_printfs(char *s)
{
	int	ret;

	ret = 0;
	if (s == NULL)
	{
		write (1, "(null)", 6);
		return (6);
	}
	while (s[ret])
		write (1, &s[ret++], 1);
	return (ret);
}
