# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bperron <bperron@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/06 10:16:37 by bperron           #+#    #+#              #
#    Updated: 2022/05/11 09:14:32 by bperron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = gcc
CFLAGS = -Werror -Wall -Wextra
RM = rm -f

SERVER = server
CLIENT = client

SRCS_CLI = client.c libft/ft_strlen.c libft/ft_atoi.c ft_printf/ft_printf.c ft_printf/ft_printformatnbr.c ft_printf/ft_printformathex.c ft_printf/ft_printformatchar.c
SRCS_SRV = server.c libft/ft_strlen.c libft/ft_memset.c ft_printf/ft_printf.c ft_printf/ft_printformatnbr.c ft_printf/ft_printformathex.c ft_printf/ft_printformatchar.c

OBJS_SRV = $(SRCS_SRV:.c=.o)
OBJS_CLI = $(SRCS_CLI:.c=.o)

SRCS_CLI_BONUS = client_bonus.c libft/ft_strlen.c libft/ft_atoi.c libft/ft_memset.c ft_printf/ft_printf.c ft_printf/ft_printformatnbr.c ft_printf/ft_printformathex.c ft_printf/ft_printformatchar.c
SRCS_SRV_BONUS = server_bonus.c libft/ft_strlen.c libft/ft_memset.c ft_printf/ft_printf.c ft_printf/ft_printformatnbr.c ft_printf/ft_printformathex.c ft_printf/ft_printformatchar.c

OBJS_SRV_BONUS = $(SRCS_SRV_BONUS:.c=.o)
OBJS_CLI_BONUS = $(SRCS_CLI_BONUS:.c=.o)

all: $(SERVER) $(CLIENT)
	echo "Mandatory compilation done"

$(SERVER): $(OBJS_SRV)
	$(CC) $(CFLAGS) -o server $(OBJS_SRV)

$(CLIENT): $(OBJS_CLI)
	$(CC) $(CFLAGS) -o client $(OBJS_CLI)

bonus: $(OBJS_SRV_BONUS) $(OBJS_CLI_BONUS)
	$(CC) $(CFLAGS) -o server $(OBJS_SRV_BONUS)
	$(CC) $(CFLAGS) -o client $(OBJS_CLI_BONUS)
	echo "Bonus compilation done"

clean: 
	$(RM) $(OBJS_SRV) $(OBJS_CLI) $(OBJS_CLI_BONUS) $(OBJS_SRV_BONUS)
	echo "Clean done"

fclean:	clean 
	$(RM) $(SERVER) $(CLIENT)
	echo "Fclean done"

re:	fclean all

.PHONY: all bonus clean fclean re 

.SILENT: all clean fclean bonus $(OBJS_CLI) $(OBJS_SRV) $(CLIENT) $(SERVER) $(OBJS_CLI_BONUS) $(OBJS_SRV_BONUS)