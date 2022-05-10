# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bperron <bperron@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/06 10:16:37 by bperron           #+#    #+#              #
#    Updated: 2022/05/09 14:11:56 by bperron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = gcc
CFLAGS = -Werror -Wall -Wextra
RM = rm -f

SERVER = server 
CLIENT = client

SRCS_CLI = client.c libft/ft_atoi.c ft_printf/ft_printf.c ft_printf/ft_printformatnbr.c ft_printf/ft_printformathex.c ft_printf/ft_printformatchar.c
SRCS_SRV = server.c libft/ft_strlen.c libft/ft_strncmp.c ft_printf/ft_printf.c ft_printf/ft_printformatnbr.c ft_printf/ft_printformathex.c ft_printf/ft_printformatchar.c

OBJS_SRV = $(SRCS_SRV:.c=.o)
OBJS_CLI = $(SRCS_CLI:.c=.o)

all: $(SERVER) $(CLIENT)

$(SERVER): $(OBJS_SRV)
	$(CC) $(CFLAGS) -o $(SERVER) $(OBJS_SRV)

$(CLIENT): $(OBJS_CLI)
	$(CC) $(CFLAGS) -o $(CLIENT) $(OBJS_CLI)

clean: 
	$(RM) $(OBJS_SRV) $(OBJS_CLI)

fclean:	clean 
	$(RM) $(SERVER) $(CLIENT)

re:	fclean all

.PHONY: all clean fclean re bonus