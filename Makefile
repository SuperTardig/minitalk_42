# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bperron <bperron@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/06 10:16:37 by bperron           #+#    #+#              #
#    Updated: 2022/05/18 11:13:15 by bperron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = gcc
CFLAGS = -Werror -Wall -Wextra
RM = rm -f

LIBFT_SRCS = ./libft/*.c
LIBFT_OBJS = $(LIBFT_SRCS:.c=.o)

FT_PRINTF_SRCS = ./ft_printf/*.c
FT_PRINTF_OBJS = $(FT_PRINTF_SRCS:.c=.o)

SERVER = server
CLIENT = client

SRCS_CLI = client.c
SRCS_SRV = server.c
OBJS_SRV = $(SRCS_SRV:.c=.o)
OBJS_CLI = $(SRCS_CLI:.c=.o)

SRCS_CLI_BONUS = client_bonus.c
SRCS_SRV_BONUS = server_bonus.c
OBJS_SRV_BONUS = $(SRCS_SRV_BONUS:.c=.o)
OBJS_CLI_BONUS = $(SRCS_CLI_BONUS:.c=.o)

all: $(SERVER) $(CLIENT)
	echo "Mandatory compilation done"

$(SERVER): $(OBJS_SRV)
	make -C libft
	make -C ft_printf
	$(CC) $(CFLAGS) -o server $(OBJS_SRV) $(LIBFT_OBJS) $(FT_PRINTF_OBJS)

$(CLIENT): $(OBJS_CLI)
	$(CC) $(CFLAGS) -o client $(OBJS_CLI) $(LIBFT_OBJS) $(FT_PRINTF_OBJS)

bonus: $(OBJS_SRV_BONUS) $(OBJS_CLI_BONUS)
	$(CC) $(CFLAGS) -o server $(OBJS_SRV_BONUS)
	$(CC) $(CFLAGS) -o client $(OBJS_CLI_BONUS)
	echo "Bonus compilation done"

clean:
	make clean -C libft
	make clean -C ft_printf
	$(RM) $(OBJS_SRV) $(OBJS_CLI) $(OBJS_CLI_BONUS) $(OBJS_SRV_BONUS)
	echo "Clean done"

fclean:	clean
	make fclean -C libft
	make fclean -C ft_printf
	$(RM) $(SERVER) $(CLIENT)
	echo "Fclean done"

re:	fclean all

notalk:
	echo "	———————————No Talk?–––———————————"
	echo "	⣞⢽⢪⢣⢣⢣⢫⡺⡵⣝⡮⣗⢷⢽⢽⢽⣮⡷⡽⣜⣜⢮⢺⣜⢷⢽⢝⡽⣝"
	echo "	⠸⡸⠜⠕⠕⠁⢁⢇⢏⢽⢺⣪⡳⡝⣎⣏⢯⢞⡿⣟⣷⣳⢯⡷⣽⢽⢯⣳⣫⠇"
	echo "	⠀⠀⢀⢀⢄⢬⢪⡪⡎⣆⡈⠚⠜⠕⠇⠗⠝⢕⢯⢫⣞⣯⣿⣻⡽⣏⢗⣗⠏⠀"
	echo "	 ⠪⡪⡪⣪⢪⢺⢸⢢⢓⢆⢤⢀⠀⠀⠀⠀⠈⢊⢞⡾⣿⡯⣏⢮⠷⠁⠀⠀"
	echo "	⠀⠀⠀⠈⠊⠆⡃⠕⢕⢇⢇⢇⢇⢇⢏⢎⢎⢆⢄⠀⢑⣽⣿⢝⠲⠉⠀⠀⠀⠀"
	echo "	⠀⠀⠀⠀⡿⠂⠠⠀⡇⢇⠕⢈⣀⠀⠁⠡⠣⡣⡫⣂⣿⠯⢪⠰⠂⠀⠀⠀⠀"
	echo "	⠀⠀⠀⡦⡙⡂⢀⢤⢣⠣⡈⣾⡃⠠⠄⠀⡄⢱⣌⣶⢏⢊⠂⠀⠀⠀⠀⠀⠀"
	echo "	⠀⠀⠀⠀⢝⡲⣜⡮⡏⢎⢌⢂⠙⠢⠐⢀⢘⢵⣽⣿⡿⠁⠁⠀⠀⠀⠀⠀⠀⠀"
	echo "	⠀⠀⠀⠀⠨⣺⡺⡕⡕⡱⡑⡆⡕⡅⡕⡜⡼⢽⡻⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
	echo "	⠀⠀⠀⠀⣼⣳⣫⣾⣵⣗⡵⡱⡡⢣⢑⢕⢜⢕⡝⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
	echo "	⠀⠀⠀⣴⣿⣾⣿⣿⣿⡿⡽⡑⢌⠪⡢⡣⣣⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
	echo "	⠀⠀⠀⡟⡾⣿⢿⢿⢵⣽⣾⣼⣘⢸⢸⣞⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
	echo "	⠀⠀⠀⠁⠇⠡⠩⡫⢿⣝⡻⡮⣒⢽⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
	echo "	—————————————————————————————–––"

.PHONY: all bonus clean fclean re notalk

.SILENT: all clean fclean bonus notalk $(OBJS_CLI) $(OBJS_SRV) $(CLIENT) $(SERVER) $(OBJS_CLI_BONUS) $(OBJS_SRV_BONUS) $(LIBFT_OBJS) $(FT_PRINTF_OBJS)
